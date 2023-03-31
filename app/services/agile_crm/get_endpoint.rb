module AgileCrm
  module GetEndpoint
    MAPPED_ENDPOINTS = {
      'Contacts': 'contacts',
      'Opportunities': 'opportunity'
    }.freeze

    def endpoint
      binding.pry
      "#{@crm_api_endpoint}/#{get_current_path}"
    end
      
    private

    # def get_current_path
    #   MAPPED_ENDPOINTS.fetch(module)
    # end
     
    def module
      return self.to_s.split('::')[1]
    end
  end
end