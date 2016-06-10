class BookmarksController < ApplicationController
  before_action :authorize_user

  def new
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    
    if @bookmark.save
      flash[:notice] = "Bookmark created successfully"
      redirect_to(@topic)
    else
      flash[:alert] = "Issue creating bookmark"
      render :new
    end
  end

  def edit
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
  end
  
  def update
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    
    # is this even necessary?
    authorize @bookmark
    
    @bookmark.assign_attributes(bookmark_params)
    
    if @bookmark.save
      flash[:notice] = "Bookmark saved successfully"
      redirect_to(@topic)
    else
      flash[:notice] = "Error updating bookmark"
      render :edit
    end
  end
  
  def destroy
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    
    # is this even necessary?
    authorize @bookmark
    
    if @bookmark.destroy
      redirect_to(@topic)
    else
      flash[:alert] = "There was an error deleting the bookmark"
      redirect_to(@topic)
    end
  end
  
private
def bookmark_params
  params.require(:bookmark).permit(:url)
end

def authorize_user
  @topic = Topic.find(params[:topic_id])
  unless current_user == @topic.user
    flash[:alert] = "You must be the topic owner to do that!"
    redirect_to(@topic)
  end
end
end
