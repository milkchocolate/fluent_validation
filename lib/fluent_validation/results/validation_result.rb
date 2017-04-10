module FluentValidation
  module Results
    class ValidationResult
      attr_reader :validation_failures

      def initialize(validation_failures)
        @validation_failures = validation_failures
      end

      def is_valid?
        @validation_failures.nil? || @validation_failures.length <= 0
      end
    end
  end
end