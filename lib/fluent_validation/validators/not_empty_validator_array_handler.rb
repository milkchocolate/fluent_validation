require 'fluent_validation/validators/attribute_validator'

module FluentValidation
  module Validators
    class NotEmptyValidatorArrayHandler < NotEmptyValidatorHandler
      def can_handle?(object)
        object.class == Array
      end

      def respond(object)
        object.length > 0
      end
    end
  end
end