module AgileCrm
  module Contacts
    class CreateService < AgileCrm::Client
      include AgileCrm::GetEndpoint

      def call
        res = create_contact

        if res.success?
          AgileCrm::Contact.create!(
            email: @options[:email],
            crm_contact_id: res.parsed_response['id']
          )
        end
      end
      
        private

      def create_contact
        @create_contact ||= HTTParty.post(endpoint, 
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