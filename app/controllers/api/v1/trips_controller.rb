class Api::V1::TripsController < ApplicationController
    def index
        trips = Trip.all
        trips = trips.map do |trip|
            { id: trip.id, name: trip.name }
        end

        if trips
            render json: { results: trips }.to_json, status: :ok
        else
            render json: { results: trips.errors}.to_json, status: :error
        end
    end
end
