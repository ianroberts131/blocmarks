class LikesController < ApplicationController
  def index
    @likes = Likes.all
  end
  
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    
    if like.save
      flash[:notice] = "Bookmark liked!"
      redirect_to(@bookmark.topic)
    else
      flash[:alert] = "Error!"
      redirect_to(@bookmark.topic)
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    
    like = current_user.likes.find(params[:id])
    
    if like.destroy
      flash[:notice] = "Bookmark successfully unliked"
      redirect_to(@bookmark.topic)
    else
      flash[:alert] = "Error!"
      redirect_to(@bookmark.topic)
    end
  end
end
