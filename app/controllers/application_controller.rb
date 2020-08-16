class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :views, Proc.new { File.join(root, "../views/") }

    configure do
        enable :sessions
        set :session_secret, "quokka"
        # change session_secret later if needed, possibly a generated hexadecimal
    end

    get '/' do
        erb :index
    end

    post '/signup' do
        if !User.find_by(email: params["email"])
            @user = User.create(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
            session[:user_id] = @user.id
            redirect to '/homepage'
        else
            erb :failure
        end
    end

    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(email: params["email"])
		if @user && @user.authenticate(params["password"])
			session[:user_id] = @user.id
            redirect to "/homepage"
		else
            erb :failure
		end
    end

    get '/logout' do
        session.clear
        erb :logout
    end

    get '/homepage' do
        @user = User.find_by_id(session[:user_id])
        @parks = Park.all
        erb :homepage
    end

    get '/park/:id' do
        @park = Park.select do |park|
            park.id == params[:id].to_i
        end.first
        erb :park
    end
end