class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]
  
  def create
    @user = User.find_by(email: params["sender"])
    @topic = @user.topics.find_by(title: params["subject"])
    
    if @topic.nil?
      @topic = @user.topics.build(title: params["subject"])
      @topic.save
    end
    
    @bookmark = @topic.bookmarks.build(url: params["stripped-text"])
    @bookmark.save
    
    head 200
  end
end