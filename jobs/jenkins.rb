require 'net/http'
require 'json'


SCHEDULER.every '1m', first_in: 0 do |job|
  currentstatus = nil
  last_status = currentstatus


  jenkins_uri= URI('insertJenkinsURIHere')

  Net::HTTP.start(jenkins_uri.host, jenkins_uri.port) do |http|
    request = Net::HTTP::Get.new jenkins_uri
    response = http.request request # Net::HTTPResponse object
    build_info = JSON.parse(response.body)
    puts build_info
    currentstatus = build_info["result"]
    puts currentstatus
    send_event('status', {
            current_status: currentstatus,
            number: build_info["number"],
            url: build_info["url"],
            displayname: build_info["fullDisplayName"]
    })
  end
end