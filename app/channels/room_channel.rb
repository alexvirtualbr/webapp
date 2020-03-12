class RoomChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "room_channel"
    stream_from "room_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("room_#{params[:room]}", data)
  end

end
