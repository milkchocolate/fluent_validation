require 'fluent_validation/validators/attribute_validator'
require 'fluent_validation/validators/not_empty_validator_string_handler'
require 'fluent_validation/validators/not_empty_validator_array_handler'

module FluentValidation
  module Validators
    class NotEmptyValidator < AttributeValidator
      def initialize
        super
        @not_empty_validator_chain = build_validator_chain
      end

      def is_valid?(validator_context)
        @not_empty_validator_chain.handle validator_context.attribute_value
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} must not be empty."
      end

      private
      def build_validator_chain
        array_validator = NotEmptyValidatorArrayHandler.new nil
        NotEmptyValidatorStringHandler.new array_validator
      end
    end
  end
end