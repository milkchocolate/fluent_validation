require 'fluent_validation/results/validation_success'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/validators/attribute_validator_context'

module FluentValidation
  class AttributeRule
    attr_reader :expression, :validators
    attr_accessor :attribute_name, :condition, :error_code

    def initialize(&expression)
      @expression = expression
      @validators = Array.new
    end

    def add_validator(validator)
      @validators << validator
    end

    def validate(object)
      validation_failures = Array.new
      if @condition.nil? || @condition.call(object)
        value = expression.call object
        validator_context = Validators::AttributeValidatorContext.new @attribute_name, value, @error_code
        @validators.each do |validator|
          result = validator.validate validator_context
          validation_failures.concat result
        end
      end
      validation_failures
    end
  end
end