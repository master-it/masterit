class PlagiatDetail < ActiveRecord::Base
  attr_accessible :message, :url
  belongs_to :user
  belongs_to :work
end
