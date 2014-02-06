class Comment < ActiveRecord::Base


belongs_to :user
belongs_to :article
has_attached_file :photo, :styles => { :thumb => "100x100#"}

validates :note, presence: true

end
