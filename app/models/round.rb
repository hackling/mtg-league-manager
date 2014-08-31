class Round < ActiveRecord::Base
  has_many :pairings
  has_many :decks

  def to_s
    "Round #{self.id}"
  end

  def self.round_in_progress
    Round.find(Pairing.last_round)
  end

  def self.next_round
    Round.where(id: (Pairing.last_round + 1)).first_or_create!
  end
end
