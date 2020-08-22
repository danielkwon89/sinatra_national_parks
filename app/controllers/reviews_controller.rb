class ReviewsController < ApplicationController

    get '/park/:id/reviews/new' do
        if logged_in?
            @park = Park.find_by_id(params[:id])
            erb :'reviews/new'
        end
    end

    post '/park/:id/reviews/new' do
        if logged_in?
            @review = current_user.reviews.build(title: params[:title], content: params[:review], park_id: params[:id], rating: params[:rating], upvotes: 0, downvotes: 0)
            if @review.save
                redirect to "/park/#{params[:id]}"
            else
                erb :'reviews/new'
            end
        else
            redirect to '/'
        end
    end
    
    get '/reviews/:id/edit' do
        @review = Review.find_by_id(params[:id])
        if logged_in? && @review.user == current_user  
            erb :'reviews/edit'
        end
    end

    patch '/reviews/:id/edit' do
        @review = Review.find_by_id(params[:id])
        if @review.user == current_user
            @review.update(title: params[:title], content: params[:content], rating: params[:rating])
            redirect to "park/#{@review.park.id}"
        end
    end

    delete '/reviews/:id' do
        @review = Review.find_by_id(params[:id])
        if @review.user == current_user
            @review.delete
        end
        redirect to "#{session[:back_url]}"
    end

    get '/reviews/:id/upvote' do
        binding.pry
        @review = Review.find_by_id(params[:id])
        @review.upvotes += 1
        redirect to "#{session[:back_url]}"
    end

    get '/reviews/:id/downvote' do
        @review = Review.find_by_id(params[:id])
        @review.downvotes += 1
        redirect to "#{session[:back_url]}"
    end
end