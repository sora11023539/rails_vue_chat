class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    render json: {
      id: like.id,
      email: current_user.email,
      message: 'Success!'
    },
    status: :ok
  end

  def destroy
    like.destroy!
    render json: {
      id: like.id,
      email: like.user.email,
      message: '削除に成功しました'
    }
  end

  private

  def like
    @like ||=
      if action_name === 'create'
        current_user.likes.create!(message: message)
      else
        Like.find(params[:id])
      end
  end

  def message
    @message ||= Message.find(params[:id])
  end
end
