class MessagesController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            # ActionCable.server.broadcast(
            #     "room_BestRoom",
            #     sent_by: current_user.email,
            #     content: @message.content
            # )

            # WebNotificationsChannel.broadcast_to(
            #     current_user,
            #     title: "New things!",
            #     body: 'All the news fit to print'
            # )
        else
        end
    end

    private

        def message_params
            params.require(:message).permit(:user_id, :content)
        end
    
end

