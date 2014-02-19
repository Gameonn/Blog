class Article < ActiveRecord::Base

belongs_to :user

has_many :comments

 default_scope order('created_at DESC')

has_attached_file :photo, :styles => {:small => "120x150>", :medium => "300x300>",:large =>   "400x400>"}


validates :title,:body, presence: true

  def self.search(search)
  	if search
    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
     # where("name like ?", "%#{params[:search]}%") 

  end
end
