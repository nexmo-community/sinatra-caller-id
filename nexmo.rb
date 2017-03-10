require "net/http"
require "uri"
require "json"

class Nexmo

	def self.lookup(number, callback_url)
		uri = URI.parse("https://api.nexmo.com/ni/advanced/async/json")
		params = {
		  'api_key' => YOUR_API_KEY,
		  'api_secret' => YOUR_API_SECRET,
		  'number' => number,
		  'callback' => callback_url
		}

		response = Net::HTTP.post_form(uri, params)
		#print it out so we can view the response in the console
		puts response.body
		JSON.parse(response.body)
	end
end
