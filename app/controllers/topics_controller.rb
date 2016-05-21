class TopicsController < ApplicationController
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
      flash[:alert] = 'There was an error creating the topic'
      redirect_to(new_topic)
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
end
