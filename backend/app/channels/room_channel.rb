class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from :room_channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    message

    ActionCable.server.broadcast :room_channel, {
      message: data[:message],
      name: user.name,
      created_at: message.created_at
    }
  end

  private

  def user
    @user ||= User.find_by(email: data[:email])
  end

  def message
    @message ||= user.messages.create!(content: data[:message])
  end
end
