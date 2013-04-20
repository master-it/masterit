class Competition < ActiveRecord::Base
  attr_accessible :name, :year, :state_event, :tours, :tours_attributes, :tour_ids, :condition, :report
  has_many :tours
  has_one :report
  has_one :condition
  accepts_nested_attributes_for :tours, allow_destroy: true, reject_if: :all_blank

  validates :name, :presence => true

  state_machine :state, initial: :closed do
    state :hidden
    state :closed
    state :started

    event :start do
      transition closed: :started
    end

    event :close do
      transition started: :closed
    end

    event :hide do
      transition all => :hidden
    end
  end

end
