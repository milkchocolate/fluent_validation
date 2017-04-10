require 'fluent_validation/validators/not_empty_validator_handler'

module FluentValidation
  module Validators
    class NotEmptyValidatorStringHandler < NotEmptyValidatorHandler
      def can_handle?(object)
        object.class == String
      end

      def respond(object)
        object.length > 0
      end
    end
  end
end