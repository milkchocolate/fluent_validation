require 'fluent_validation/validators/validator'

module FluentValidation
  module Validators
    class ChildCollectionValidatorAdaptor < Validator
      def initialize(fluent_validator)
        @fluent_validator = fluent_validator
      end

      def validate(validator_context)
        validation_failures = Array.new
        validator_context.attribute_value.each do |item|
          result = @fluent_validator.validate item
          validation_failures.concat result.validation_failures
        end
        validation_failures
      end
    end
  end
end