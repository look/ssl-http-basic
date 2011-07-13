require 'sinatra'
require 'rack/ssl'

use Rack::SSL
use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == ['admin', 'password']
end

get '/' do
  'Hello World'
end
