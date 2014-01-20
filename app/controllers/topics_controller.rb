class TopicsController < ApplicationController
  before_filter :user_signed_in, except: :index
  before_filter :user_made_post, only: [:edit, :update, :destroy]
  def index
    @topics = Topic.all
  end

  def show
    set_topic
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to topics_path, notice: 'Your topic was successfully created!'
    else
      render :new
    end
  end

  def edit
    set_topic
  end

  def update
    set_topic
    if @topic.update(topic_params)
      redirect_to topics_path, notice: 'Your topic was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    set_topic
    if @topic.destroy
      redirect_to root_path, notice: 'Topic successfully destroyed'
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :category)
  end

  def user_made_post
    set_topic
    redirect_to root_path, notice: 'Not your post!' if @topic.user != current_user
  end
end
