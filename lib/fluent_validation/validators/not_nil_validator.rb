require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class NotNilValidator < AttributeValidator
      def is_valid?(validator_context)
        !validator_context.attribute_value.nil?
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} must not be empty."
      end
    end
  end
end