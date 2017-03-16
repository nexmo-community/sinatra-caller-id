require "sinatra"
require "sinatra/reloader"
require "json"
require "pony"

require_relative 'nexmo.rb'

class CallerId < Sinatra::Base
  get '/' do
    erb :phone_form
  end

  post '/lookup' do
		@insight = Nexmo.lookup(params["phone"], "#{request.base_url}/nexmo_insights?email=#{params["email"]}")
		erb	:phone_lookup
	end

  post '/nexmo_insights' do
    phone_info = request.body.read

    #print it out so we can view the response in the console
    puts params
    puts phone_info

    email_insight(phone_info, params[:email])

    #We need to return a 200 success code to Nexmo when the webhook hits our endpoint
    #if we don't return a 200 success code, Nexmo will retry sending the result
    status 200
  end

   def email_insight(phone_info, email)
     begin
      	Pony.mail(
      		:to => email,
          :via => :smtp,
          :via_options => {
            :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'my@email.com',
            :password             => MY_PASSWORD,
            :authentication       => 'plain',
            :enable_starttls_auto => true
          },
      		:from => 'my@email.com',
      		:subject => "Nexmo insight for #{JSON.parse(phone_info)["national_format_number"]}",
      		:headers => { 'Content-Type' => "text/html" },
      		:body => to_html_string(phone_info))
      rescue Exception => e
      	puts e
      end
    end

    def to_html_string(phone_info)
      html = "<h1>Number Insight</h1>\n<table>"
      JSON.parse(phone_info).each do |key, value|
        html << %Q(
          <tr>
            <td> #{key.split("_").map(&:capitalize).join(' ')} </td>
            <td> #{value} </td>
          </tr>
        )
        end
      html << "</table>"
    end

  CallerId.run!
end
