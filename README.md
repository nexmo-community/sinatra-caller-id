Sign up for a [Vonage account](https://dashboard.nexmo.com/sign-up), and check the [Getting Started Guide](https://dashboard.nexmo.com/getting-started-guide) for your API Key and API Secret if you don't already have one.

You'll need to set a few environment variables to a `.env` file, using `.env.example` as a template.  Simply copy over `.env.example` to `.env`, and edit in the values for:

- `VONAGE_API_KEY`
- `VONAGE_API_SECRET`
- `GMAIL_USERNAME`
- `GMAIL_PASSWORD` - Don't worry, this is not transmitted anywhere.

If you're following along with the tutorial out check out the `start-here` branch

```bash
$ git clone git@github.com:ChrisGuzman/sinatra-caller-id.git

$ cd sinatra-caller-id/

$ bundle install

$ bundle exec ruby app.rb
```
