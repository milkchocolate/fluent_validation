module FluentValidation
  module Validators
    class AttributeValidatorContext
      attr_reader :attribute_name, :attribute_value, :error_code

      def initialize(attribute_name, attribute_value, error_code = nil)
        @attribute_name = attribute_name
        @attribute_value = attribute_value
        @error_code = error_code
      end
    end
  end
end