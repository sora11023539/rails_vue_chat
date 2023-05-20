class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    render json: {
      id: like.id,
      email: current_user.email,
      message: 'Success!'
    },
    status: 200
  end

  def like
    @like ||= current_user.likes.create(message: message)
  end

  def message
    @message ||= Message.find(params[:id])
  end
end
