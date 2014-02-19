class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


has_many :articles


has_many :comments

has_attached_file :photo, :styles => {:small => "120x150>", :medium => "300x300>",:large =>   "400x400>"}

def user_image(size)
	if photo.present?
		return photo.url(size)
	else
		return "/assets/3_#{size}.jpg"
end
end

end
