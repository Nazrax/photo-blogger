class Post < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy, :order => 'position'
  has_many :comments, :as => 'commentable'
  belongs_to :picture
  
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :content
end
