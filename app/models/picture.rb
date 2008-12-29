class Picture < ActiveRecord::Base
  belongs_to :parent
  belongs_to :post
end
