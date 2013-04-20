class Estimation < ActiveRecord::Base
  attr_accessible :content, :decoration, :technology_usage
  belongs_to :competition
  belongs_to :expert
end
