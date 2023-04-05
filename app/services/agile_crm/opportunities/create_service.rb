module AgileCrm
  module Opportunities
    class CreateService < AgileCrm::Client
      include AgileCrm::GetEndpoint
      EXPECTED_VALUE=0000

      def call
        create_opportunity
      end
      
        private

      def create_opportunity
        @request ||= HTTParty.post(endpoint, 
          basic_auth:basic_auth, body: request_body,
          headers: { 'Content-Type' => 'application/json' })
      end

      def crm_contact_id
        @crm_contact_id ||= AgileCrm::Contact.find_by(
          email: @options[:email]
        ).crm_contact_id
      end

      def request_body
        {
          name: "Deal in #{@options[:requested_service]}",
          expected_value: EXPECTED_VALUE,
          milestone: "Proposal",
          contact_ids: [
            crm_contact_id
          ],
          custom_data: [
              {
                  name: "Group Size",
                  value: "10"
              }
          ]
        }.to_json
      end 

    end
  end
end
