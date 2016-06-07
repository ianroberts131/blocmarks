class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]
  
  def create
    @user = User.find_by(email: params["sender"])
    
    if @user.topics.find_by(title: params["subject"]) == nil
      @topic = @user.topics.build(title: params["subject"])
      @topic.save
    end
    
    @topic = @user.topics.find_by(title: params["subject"])
    @bookmark = @topic.bookmarks.build(url: params["stripped-text"])
    @bookmark.save
    head 200
  end
end