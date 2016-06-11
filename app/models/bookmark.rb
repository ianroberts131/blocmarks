class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy
  has_one :user, through: :topic
  
end
