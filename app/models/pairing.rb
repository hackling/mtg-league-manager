class Pairing < ActiveRecord::Base
  belongs_to :round
  belongs_to :player_1, class: User
  belongs_to :player_2, class: User

  def to_s
    "#{self.player_1.to_s} (#{self.player_1_wins.to_i}) vs #{self.player_2.to_s} (#{self.player_2_wins.to_i})"
  end

  def extended_to_s
    "Round #{self.round_id}: #{self.to_s}"
  end

  def owns_pairing?(user)
    user == self.player_1 || user == self.player_2
  end

  def self.pairings_issued?(round_id)
    Round.find(round_id).pairings.present?
  end

  def self.last_round
    self.pluck(:round_id).max
  end
end
