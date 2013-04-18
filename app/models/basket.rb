class Basket < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :users, :works
  belongs_to :user
end
