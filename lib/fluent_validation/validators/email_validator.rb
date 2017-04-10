require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class EmailValidator < AttributeValidator
      def initialize
        @regexp = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
      end

      def is_valid?(validator_context)
        @regexp.match? validator_context.attribute_value
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} is not a valid email address"
      end
    end
  end
end