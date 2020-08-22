class ParksController < ApplicationController

    get '/park/:id' do
        @park = Park.select do |park|
            park.id == params[:id].to_i
        end.first
        erb :'parks/park'
    end

    get '/parks/by_name' do
        @parks = Park.all
        erb :'parks/by_name'
    end

    get '/parks/by_state' do
        @states = ["Alaska", "American Samoa", "Arizona", "Arkansas", "California", "Colorado", "Florida", "Hawaii", "Idaho", "Indiana", "Kentucky", "Maine", "Michigan", "Minnesota", "Missouri", "Montana", "Nevada", "New Mexico", "North Carolina", "North Dakota", "Ohio", "Oregon", "South Carolina", "South Dakota", "Tennessee", "Texas", "U.S. Virgin Islands", "Utah", "Virginia", "Washington", "Wyoming"]
        @parks = Park.all
        erb :'parks/by_state'
    end

end