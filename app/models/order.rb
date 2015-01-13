class Order < ActiveRecord::Base
  belongs_to :county
  belongs_to :township
end
