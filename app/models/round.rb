class Round < ActiveRecord::Base
  has_many :pairings
  has_many :decks

  def to_s
    "Round #{self.id}"
  end

  def self.round_in_progress
    if Pairing.last_round
      Round.where(id: Pairing.last_round).first
    else
      Round.where(id: 1).first_or_create!
    end
  end

  def self.next_round
    Round.where(id: (Pairing.last_round.to_i + 1)).first_or_create!
  end
end
