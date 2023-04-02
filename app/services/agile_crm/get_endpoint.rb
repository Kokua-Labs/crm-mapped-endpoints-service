module AgileCrm
  module GetEndpoint
<<<<<<< Updated upstream
    def endpoint
      "#{@crm_api_endpoint}/#{get_current_path}"
    end
      
    private
     
    def get_current_path
      self.class.module_parent.to_s.split('::')[1].downcase
=======
    MAPPED_ENDPOINTS = {
      'Contacts': 'contacts',
      'Opportunities': 'opportunity'
    }

    def endpoint
      "#{@crm_api_endpoint}/#{get_current_path}"
    end

    def get_current_path
      MAPPED_ENDPOINTS[get_module_name]
    end

    def get_module_name
      self.class.module_parent.to_s.split('::')[1].to_sym
>>>>>>> Stashed changes
    end
  end
end