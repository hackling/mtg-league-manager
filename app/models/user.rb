class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :decks

  def to_s
    "#{self.first_name} #{self.last_name}".titleize
  end

  def pairings
    Pairing.where("player_1_id = #{self.id} OR player_2_id = #{self.id}")
  end

  def current_pairing
    self.pairings.where(:round => Round.round_in_progress).first
  end

  def previous_pairings
    self.pairings.where("round_id != ?", Round.round_in_progress.try(:id) || 1).order('round_id DESC')
  end
end
