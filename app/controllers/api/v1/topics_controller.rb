class Api::V1::TopicsController < ApplicationController
  before_filter :user_signed_in
  respond_to :json

  def index
    respond_with Topic.all
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
