require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class ExactLengthValidator < AttributeValidator
      def initialize(length)
        @length = length
      end

      def is_valid?(validator_context)
        if validator_context.attribute_value.nil?
          false
        else
          validator_context.attribute_value.length == @length
        end
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} must be #{@length} characters in length. You provided #{attribute_value.length} characters"
      end
    end
  end
end