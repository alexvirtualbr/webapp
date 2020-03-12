class Api::V1::RoomController < ApplicationController

  def index
    #message = Message.new
    messages = Message.all

    if messages
      render json: { results: messages }.to_json, status: :ok
    else
      render json: { results: messages.errors }.to_json, status: :error
    end
  end
end
