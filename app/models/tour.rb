class Tour < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :state_event
  
  validates :name, :presence => true
  
  state_machine :state, initial: :hidden do
    state :hidden
    state :published

    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition all => :hidden
    end
  end
  
end
