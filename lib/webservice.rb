module Webservice
    require 'net/http'

    # Do a POST JSON request to a URI
    # Body is a HASH with body parameters
    def request_to_uri(param_uri, body)
        uri = URI.parse(param_uri)
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request.body = JSON.dump(body)
        req_options = {
          use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        response
    end 
end
