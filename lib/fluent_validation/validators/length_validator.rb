require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class LengthValidator < AttributeValidator
      def initialize(min, max)
        @min = min
        @max = max
      end

      def is_valid?(validator_context)
        if validator_context.attribute_value.nil?
          true
        else
          validator_context.attribute_value.length >= @min && validator_context.attribute_value.length <= @max
        end
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} must be between #{@min} and #{@max} characters. You provided #{attribute_value.length} characters."
      end
    end
  end
end