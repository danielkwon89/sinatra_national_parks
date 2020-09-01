class UsersController < ApplicationController

    post '/signup' do
        @user = User.create(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
        
        if @user.valid?
            session[:user_id] = @user.id
            redirect to '/homepage'
        else
            redirect to '/'
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
            erb :failure, :layout => false
		end
    end

    get '/logout' do
        session.clear
        erb :'users/logout', :layout => false
    end

    get '/user/profile/:id' do
        @user = User.find_by_id(params[:id])
        erb :'users/profile'
    end

    get '/user/bio' do
        @user = current_user
        erb:'users/bio'
    end

    post '/user/bio' do
        @user = current_user
        @user.bio = params[:bio]
        @user.save
        redirect to "/user/profile/#{current_user.id}"
    end
end