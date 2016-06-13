class UsersController < ApplicationController
  def show
    @user_bookmarks_hash = Topic.where(user: current_user).map { |topic| topic.bookmarks }.flatten.group_by { |bookmark| bookmark.topic_id }
    @liked_bookmarks_hash = current_user.likes.map { |like| Bookmark.find_by(id: like.bookmark_id) }.group_by { |bookmark| bookmark.topic_id }
  end
end
