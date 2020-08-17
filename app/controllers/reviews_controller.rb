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
        # fill this out
        # @review = Review.find_by_id(params[:id])
        # erb :'reviews/edit'
        # add a check to make sure the review being edited belongs to the current user
    end

    patch '/reviews/:id' do
        # fill this out
        # @review = Review.find_by_id(params[:id])
        # @review.update(title: params[:title], content: params[:content])
    end

end