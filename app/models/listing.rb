class Listing < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, 
	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {},
     default_url: "noimg.png"
  validates_attachment :image,
      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] } 
end

