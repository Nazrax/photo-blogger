class Picture < ActiveRecord::Base
  belongs_to :parent, :class_name => :picture
  belongs_to :post

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 3.megabytes,
                 :resize_to => '400x400>',
                 :thumbnails => { :thumb => '100x100>' }
  validates_as_attachment
end
