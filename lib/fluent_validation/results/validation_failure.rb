module FluentValidation
  module Results
    class ValidationFailure
      attr_reader :attribute_name
      attr_reader :error_code
      attr_reader :error_message

      def initialize (attribute_name, error_code, error_message)
        @attribute_name = attribute_name
        @error_code = error_code
        @error_message = error_message
      end
    end
  end
end