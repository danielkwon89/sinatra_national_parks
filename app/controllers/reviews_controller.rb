class ReviewsController < ApplicationController

    get '/park/:id/reviews/new' do
        if logged_in?
            @park = Park.find_by_id(params[:id])
            erb :'reviews/new'
        end
    end

    post '/park/:id/reviews/new' do
        if logged_in?
            @review = current_user.reviews.build(title: params[:title], content: params[:review], park_id: params[:id])
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
        # binding.pry
        @review = Review.find_by_id(params[:id])
        if logged_in? && @review.user == current_user  
            erb :'reviews/edit'
        end
        # add a check to make sure the review being edited belongs to the current user
    end

    patch '/reviews/:id/edit' do
        @review = Review.find_by_id(params[:id])
        if @review.user == current_user
            @review.update(title: params[:title], content: params[:content])
            redirect to "/homepage"
        end
    end

    # get '/reviews/:id/delete' do
    #     @review = Review.find_by_id(params[:id])
    #     if logged_in? && @review.user == current_user
    #     end
    # end

    delete '/reviews/:id' do
        @review = Review.find_by_id(params[:id])
        if @review.user == current_user
            @review.delete
        end
        redirect to "/homepage"
    end
end