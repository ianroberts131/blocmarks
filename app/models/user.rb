class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :topics
  has_many :likes, dependent: :destroy
  after_create :send_welcome_email
  
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
  
  private
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
