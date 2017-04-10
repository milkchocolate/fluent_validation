require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class RegularExpressionValidator < AttributeValidator
      def initialize(pattern)
        @pattern = pattern
      end

      def is_valid?(validator_context)
        @pattern.match?(validator_context.attribute_value)
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} is not in the correct format."
      end
    end
  end
end