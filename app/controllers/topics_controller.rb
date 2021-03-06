class TopicsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update, :destroy]
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @user = current_user
    @topic = Topic.new
  end
  
  def create
    @user = current_user
    @topic = @user.topics.build(topic_params)
    
    if @topic.save
      flash[:notice] = 'Topic successfully created'
      redirect_to(topics_path)
    else
      flash[:alert] = 'There was an error creating the Topic'
      redirect_to(new_topic_path)
    end
  end

  def edit
    @user = current_user
    @topic = @user.topics.find(params[:id])
  end
  
  def update
    @user = current_user
    @topic = @user.topics.find(params[:id])
    @topic.assign_attributes(topic_params)
    
    if @topic.save
      flash[:notice] = 'Topic successfully updated'
      redirect_to(topic_path)
    else
      flash[:alert] = 'There was an error updating the topic'
      render :edit
    end
  end
  
  def destroy
    @user = current_user
    @topic = @user.topics.find(params[:id])
    
    if @topic.destroy
      redirect_to(topics_path)
    else
      flash[:alert] = "There was an error deleting the topic."
      redirect_to(topics_path)
    end
  end
  
private
  def topic_params
    params.require(:topic).permit(:title)
  end
  
  def authorize_user
    @topic = Topic.find(params[:id])
    unless current_user == @topic.user
      flash[:notice] = "You must be the topic owner to do that!"
      redirect_to(@topic)
    end
  end
end
