class UsersController < ApplicationController

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
        erb :'users/logout'
    end
end