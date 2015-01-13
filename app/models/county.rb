class County < ActiveRecord::Base
  has_many :orders
  has_many :township
end
