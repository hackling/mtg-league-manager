class Pairing < ActiveRecord::Base
  belongs_to :round
  belongs_to :player_1, class: User
  belongs_to :player_2, class: User

  def to_s
    "#{self.player_1.to_s} vs #{self.player_2.to_s}"
  end

  def extended_to_s
    "Round #{self.round_id}: #{self.player_1.to_s} vs #{self.player_2.to_s}"
  end

  def owns_pairing?(user)
    user == self.player_1 || user == self.player_2
  end
end
