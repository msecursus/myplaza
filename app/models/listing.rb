class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "noimg.png"
		validates_attachment :image,
      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
	else
      
	has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, 
	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {},
     default_url: "noimg.png"
  	validates_attachment :image,
      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }, 
      :path => ":style/:id_:filename"
  	end
  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  #validates_attachment_presence :image  lijn oncommenten om image te verplichten
  belongs_to :user
  has_many :orders
end