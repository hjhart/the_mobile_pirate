class Application < Sinatra::Base
  enable :sessions
  set :root, File.dirname(__FILE__)
  set :logging, true

  get '/' do
    @message = session[:message]
    erb :index
  end
  
  post '/download' do
    movie = params[:movie]

    redirect '/500' if movie.nil?
    
    output = `cd ~/Sites/the_rotten_pirate && bundle exec rake download['#{movie}']`
    puts output 
    if output
      session[:message] = 'Your download started successfully!'
    else
      session[:error] = 'Your download failed for some reason...'
    end
    redirect '/'
  end
end
