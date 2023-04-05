module AgileCrm
  module Workflow
    class Decider
      extend Callable

      def initialize(options = {})
        @options = options.to_hash.symbolize_keys!
      end

      def call
        return if @options.empty? || contact_email.nil?

        AgileCrm::Opportunities::Create.call(options) && return if contact_exists?

        AgileCrm::Contacts::CreateService.call(@options)
      end

      private

      def contact_email
        @options[:email]
      end

      def contact_exists?
        AgileCrm::Contact.already_exists?(contact_email)
      end
    end
  end
end
