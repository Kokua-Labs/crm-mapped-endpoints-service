module AgileCrm
  module GetEndpoint
    def endpoint
      "#{@crm_api_endpoint}/#{get_current_path}"
    end
      
    private
     
    def get_current_path
      self.class.module_parent.to_s.split('::')[1].downcase
    end
  end
end