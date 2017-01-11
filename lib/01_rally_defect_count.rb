require 'httpclient/webagent-cookie'
require 'rally_api'
require_relative './00_rally_connection.rb'

class DefectCount

  def get_defect_list
    #Confiugure Rally Connection
    newConn = V2conn.new
    @config = newConn.configure_request

    #Connect to Rally
    rally = RallyAPI::RallyRestJson.new(@config)

    #Run Defect Query and return result
    defect_query = RallyAPI::RallyQuery.new()
    start_date = Time.now - (86400*1)
    defect_query.query_string = "(CreationDate > #{start_date.iso8601})"
    defect_query.type = "defect"
    results = rally.find(defect_query)
    defect_count=results.total_result_count
    return defect_count
  end
end
