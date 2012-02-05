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

    if movie.nil? || movie.strip.empty?
      session[:error] = 'You must enter a title to download'
      redirect '/' 
    else
      File.open('movies_to_download.txt', 'a') { |f| f.puts "#{movie}" }
      session[:message] = 'Your download was queued successfully!'
      redirect '/'
    end
  end
end
