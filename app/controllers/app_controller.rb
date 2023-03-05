class ApplicationController < Sinatra::Base
  # handle to enable CORS Headers
  configure { enable :cross_origin }

  before { response.headers['Access-Control-Allow-Origin'] = '*' }

  options '*' do
    response.headers[
      'Access-Control-Allow-Methods'
    ] = 'GET, PUT, POST, DELETE, OPTIONS'
    response.headers[
      'Access-Control-Allow-Headers'
    ] = 'Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token'
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  #   # Format the json response
  def json_response(code: 200, data: nil)
    status = [200, 201].include?(code) ? 'SUCCESS' : 'FAILED'
    headers['Content-Type'] = 'application/json'
    [code, { data: data, message: status }.to_json] if data
  end
end
