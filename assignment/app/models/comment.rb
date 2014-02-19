class Comment < ActiveRecord::Base


belongs_to :user
belongs_to :article
has_attached_file :photo, :styles => { :thumb => "100x100#"}, :default_url => "/images/1.png"

validates :note, presence: true


def user_image(size)
	if photo.present?
		return photo.url(size)
	else
		return "/assets/3_#{size}.jpg"
end
end

end
