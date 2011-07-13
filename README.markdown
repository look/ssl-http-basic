# ssl-http-basic

This sample [Sinatra](http://www.sinatrarb.com/) application demonstrates how to chain Rack middleware to force requests to SSL and then require a HTTP Basic password for all requests. It uses [`Rack::SSL`](https://github.com/josh/rack-ssl) to redirect to SSL and [`Rack::Auth::Basic`](http://rack.rubyforge.org/doc/Rack/Auth/Basic.html) for HTTP Basic auth.

This is useful because `Rack::Auth::Basic` only works for all requests, otherwise you need to [write a helper](http://www.sinatrarb.com/faq.html#auth). So if your root action is responsible for redirecting to SSL and you only want passwords sent over SSL, you can't use `Rack::Auth::Basic`. Also, the approach of chaining middleware is much cleaner.

This code is written for the Heroku Cedar stack. To see a demo, visit [http://ssl-http-basic.herokuapp.com](http://ssl-http-basic.herokuapp.com)

## Local development

For local development it can be convenient to skip SSL. You can do that with code like this:

    use Rack::SSL, :exclude => lambda { |env| ENV['RACK_ENV'] != 'production' }

## License

This is a trivial amount of code. Do what ever you want with it.
