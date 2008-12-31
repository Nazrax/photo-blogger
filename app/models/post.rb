class Post < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  belongs_to :picture

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :content
end
