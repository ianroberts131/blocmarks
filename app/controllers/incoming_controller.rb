class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    @user = User.find_by(email: params["sender"])
    @topic = @user.topics.find_by(title: params["subject"])
    @bookmark = @topic.bookmarks.build(url: params["stripped-text"])
    @bookmark.save
    puts "INCOMING PARAMS HERE: #{params}"
    head 200
  end
end