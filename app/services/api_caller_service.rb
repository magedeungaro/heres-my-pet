require 'rest-client'

class ApiCallerService
  def self.fetch(verb: :get, url:, body: nil, headers: nil, **rest)
    begin
      RestClient::Request.new(method: verb, url: url, body: body, headers: headers).execute
    rescue StandardError => e
      puts e
    end
  end
end
