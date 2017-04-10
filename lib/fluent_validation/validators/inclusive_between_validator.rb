require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class InclusiveBetweenValidator < AttributeValidator
      def initialize(from, to)
        @from = from
        @to = to
      end

      def is_valid?(validator_context)
        validator_context.attribute_value >=@from && validator_context.attribute_value <= @to
      end

      def generate_failure_message(attribute_name, attribute_value)
        "#{attribute_name} must be between #{@from} and #{@to}. You entered #{attribute_value}."
      end
    end
  end
end