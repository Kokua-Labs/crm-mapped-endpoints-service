module AgileCrm
  module Contacts
    class CreateService < AgileCrm::Client
    include AgileCrm::GetEndpoint

      def call
        create_contact
      end
      
        private

        def create_contact
          @request ||= HTTParty.post(endpoint, 
            basic_auth:basic_auth, body: request_body,
            headers: { 'Content-Type' => 'application/json' })
        end

        def request_body
        {
          properties: [
            {
              type: "SYSTEM",
              name: "email",
              value: @options[:email]
            }
          ]
        }.to_json
        end
    end
  end
end