require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class PredicateValidator < AttributeValidator
      def initialize(expression)
        @expression = expression
      end

      def is_valid?(validator_context)
        @expression.call(validator_context.attribute_value)
      end

      def generate_failure_message(attribute_name, attribute_value)
        "The specified condition was not met for #{attribute_name}."
      end
    end
  end
end