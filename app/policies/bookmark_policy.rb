class BookmarkPolicy < ApplicationPolicy
  # ApplicationPolicy defaults will work for bookmarks. Nothing needed other than class definition
  def update?
    user.present? && (record.topic.user == user)
  end
  
  def destroy?
    user.present? && (record.topic.user == user)
  end
end