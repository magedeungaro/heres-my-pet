require 'rest-client'
require 'json'

class ApiCallerService
  def self.fetch(verb: :get, url:, body: nil, headers: nil, **rest)
    RestClient::Request.new(method: verb, url: url, body: body, headers: headers).execute.body

    rescue RestClient::ExceptionWithResponse => e
      body = JSON.parse(e.response.body)
      Sentry.capture_exception(e)
      { code: e.response.code, message: body['message'] }
  end
end
