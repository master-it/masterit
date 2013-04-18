class Completition < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :tour_id, :year
  
  validates :name, :presence => true
  validates :tour_id, :presence => true
  validates :year, :presence => true
  
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
