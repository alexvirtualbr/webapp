class Message < ApplicationRecord
    after_create_commit { RoomBroadcastJob.perform_later self }

    belongs_to :user
end
