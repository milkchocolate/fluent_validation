require 'fluent_validation/validators/validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'

module FluentValidation
  module Validators
    class AttributeValidator < Validator
      def validate(validator_context)
        validation_failures = Array.new

        unless is_valid?(validator_context)
          failure_message = generate_failure_message(validator_context.attribute_name, validator_context.attribute_value)
          validation_failures << Results::ValidationFailure.new(validator_context.attribute_name, validator_context.error_code, failure_message)
        end

        validation_failures
      end

      def is_valid?(validator_context)
        raise NotImplementedError.new 'is_valid?'
      end

      def generate_failure_message(attribute_name, attribute_value)
        raise NotImplementedError.new 'generate_failure_message'
      end
    end
  end
end