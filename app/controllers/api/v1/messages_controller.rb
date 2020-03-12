class Api::V1::MessagesController < ApplicationController

    def create
        message = Message.new(message_params)
        if message.save
            # WebNotificationsChannel.broadcast_to(
            #     current_user,
            #     title: "New things!",
            #     body: 'All the news fit to print'
            # )
            render json: { results: message }.to_json, status: :ok
        else
            render json: { results: message.errors }.to_json, status: :error
        end
    end

    private

        def message_params
            params.require(:message).permit(:user_id, :content)
        end
    
end

