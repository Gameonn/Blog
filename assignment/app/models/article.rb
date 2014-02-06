class Article < ActiveRecord::Base

belongs_to :user

has_many :comments

has_attached_file :photo, :styles => {:small => "120x150>"}

validates :title,:body, presence: true, :uniqueness =>{:case_sensitive =>false}
  def self.search(query)
    where("title like ?", "%#{query}%") 
  end
end
