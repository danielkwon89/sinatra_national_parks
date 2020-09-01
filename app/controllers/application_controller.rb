class ApplicationController < Sinatra::Base

    configure do
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']

        register Sinatra::ActiveRecordExtension
        set :views, Proc.new{File.join(root, "../views/")}
        set :public_folder, 'public'
    end

    get '/' do
        erb :index, :layout => false
    end

    get '/homepage' do
        @user = User.find_by_id(session[:user_id])
        @parks = Park.all
        erb :homepage
    end

    helpers do

        def logged_in?
            !!session[:user_id]
        end

        def current_user
            @current_user = User.find_by_id(session[:user_id])
        end

        

    end
end