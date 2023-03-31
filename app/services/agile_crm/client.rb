module AgileCrm
  class Client
    extend Callable

    def initialize(options = {})
        @auth = {:username => ENV['CRM_USERNAME'], :password => ENV['CRM_API_KEY']}
        @crm_api_endpoint = ENV['CRM_ENDPOINT']
        @options = options
    end

    private

    def endpoint
        raise NoMethodError
      end
      
    def basic_auth
      @auth
    end
  end
end