class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :logging, true

  get '/' do
    erb :index
  end
  
  post '/download' do
    
  end
end
