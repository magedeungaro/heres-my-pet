require 'rest-client'

class ApiCallerService
  def self.fetch(verb: :get, url:, body: nil, headers: nil, **rest)
    RestClient::Request.new(method: verb, url: url, body: body, headers: headers).execute
  end
end
