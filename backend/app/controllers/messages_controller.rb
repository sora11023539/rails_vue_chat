class MessagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    render json: messages, status: :ok
  end

  private

  def messages
    @messages ||= Message.includes(:user, [likes: :user]).map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        email: message.user.email,
        created_at: message.created_at,
        likes: message.likes.map{ |like| { id: like.id, email: like.user.email } }
      }
    end
  end
end
