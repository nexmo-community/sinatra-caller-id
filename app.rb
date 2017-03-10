require "sinatra"
require "sinatra/reloader"

require_relative 'nexmo.rb'

class CallerId < Sinatra::Base
  get '/' do
    erb :phone_form
  end

  post '/lookup' do
		@insight = Nexmo.lookup(params["phone"], "#{request.base_url}/nexmo_insights?email=#{params["email"]}")
		erb	:phone_lookup
	end

  CallerId.run!
end
