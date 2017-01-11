class V2conn
	def configure_request
    #Configure Request Headers
    headers = RallyAPI::CustomHttpHeader.new()
    headers.name    = "GW Hackathon"
    headers.vendor  = "cobra kai"
    headers.version = "1.0.0"

    #Configure Request body
    @config = {}
        @config = {:base_url => "rallyURL"}
        @config[:api_key]   = "rallyAPI"
        @config[:workspace]  = "rallyWorkspace"
        @config[:project]    = "rallyProject"
        @config[:headers]    = headers
    return @config
  end

end

