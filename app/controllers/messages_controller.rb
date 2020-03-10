class MessagesController < ApplicationController
    before_action :authenticate_user!
    
    layout :messages_layout
    
    def new
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            ActionCable.server.broadcast "room_channel",
            content: @message.content
        else
        end
    end

    private

        def message_params
            params.require(:message).permit(:content)
        end
    
end
