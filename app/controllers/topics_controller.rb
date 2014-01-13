class TopicsController < ApplicationController
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
    if @topic.save
      redirect_to topic_path(@topic), notice: 'Your topic was successfully created!'
    else
      render :new
    end
  end

  def edit
    set_topic
  end

  def update
    @topic = Topic.new(topic_params)
    if @topic.update(topic_params)
      redirect_to topic_path(@topic), notice: 'Your topic was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    set_topic.destroy
    redirect_to topic_path, notice: 'Topic successfully destroyed'
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
