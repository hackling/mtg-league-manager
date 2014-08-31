class Round < ActiveRecord::Base
  has_many :pairings

  def to_s
    "Round #{self.id}"
  end

  def self.current_round
    Round.first_or_create!(Round.pluck(:id).max)
  end
end
