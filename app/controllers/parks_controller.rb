class ParksController < ApplicationController

    get '/park/:id' do
        @park = Park.select do |park|
            park.id == params[:id].to_i
        end.first
        erb :park
    end

end