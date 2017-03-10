require "sinatra"
require "sinatra/reloader"

class CallerId < Sinatra::Base
  get '/' do
    erb :phone_form
  end

  CallerId.run!
end
