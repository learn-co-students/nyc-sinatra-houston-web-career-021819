class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets
  set :method_override, true

  get '/' do
    erb :"application/index"
  end
end
