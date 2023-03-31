module Contacts
  class CreateService
    CRM__CONTACTS_ENDPOINT = "#{ENV['CRM_ENDPOINT']}/contacts".freeze

    def initialize(email)
      @email = email
    end

    def call
      create_contact
    end

    private

    def create_contact
      connect_to_crm
      binding.pry
    end

    def connect_to_crm
      auth = {:username => ENV['CRM_USERNAME'], :password => ENV['CRM_API_KEY']}

      @request ||= HTTParty.post(CRM__CONTACTS_ENDPOINT, 
                      basic_auth:auth, body: request_body,
                      headers: { 'Content-Type' => 'application/json' })
      end

    def request_body
      {
        properties: [
          {
            type: "SYSTEM",
            name: "email",
            value: @email
          }
        ]
      }.to_json
    end
  end
end