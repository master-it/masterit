class Source < ActiveRecord::Base
  attr_accessible :description, :url, :name, :work_id

  belongs_to :work
end
