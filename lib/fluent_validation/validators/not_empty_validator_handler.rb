module FluentValidation
  module Validators
    class NotEmptyValidatorHandler
      def initialize(next_handler)
        @next_handler = next_handler
      end

      def handle(object)
        if can_handle? object
          respond object
        elsif !@next_handler.nil?
          @next_handler.handle object
        else
          true
        end
      end

      private
      def can_handle?(object)
        raise NotImplementedError.new 'can_handle?'
      end

      def respond(object)
        raise NotImplementedError.new 'respond'
      end
    end
  end
end