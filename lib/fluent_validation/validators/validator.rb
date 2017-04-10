module FluentValidation
  module Validators
    class Validator
      def validate(validator_context)
        raise NotImplementedError.new 'validate'
      end
    end
  end
end