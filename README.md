Sign up for a [Vonage account](https://dashboard.nexmo.com/sign-up), and check the [Getting Started Guide](https://dashboard.nexmo.com/getting-started-guide) for your API Key and API Secret if you don't already have one.

You'll need to set `VONAGE_API_KEY` and `VONAGE_API_SECRET` to a `.env` file, using `.env.example` as a template.   Also add your email address & password to `app.rb`.

If you're following along with the tutorial out check out the `start-here` branch

```bash
$ git clone git@github.com:ChrisGuzman/sinatra-caller-id.git

$ cd sinatra-caller-id/

$ bundle install

$ bundle exec ruby app.rb
```
