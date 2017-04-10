require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class GreaterThanValidator < AttributeValidator
      def initialize(comparison_value)
        @comparison_value = comparison_value
      end

      def is_valid?(validator_context)
        validator_context.attribute_value > @comparison_value
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} must be greater than #{@comparison_value}."
      end
    end
  end
end