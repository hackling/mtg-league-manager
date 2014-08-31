class PairingsController < ApplicationController
  expose :pairing
  expose :pairings

  def new
  end

  def create
    pairing = Pairing.create(pairing_params)
    redirect_to pairing
  end

  def update
    pairing = Pairing.find(params['id'])
    pairing.update(pairing_results_params)
    redirect_to pairing
  end

  def owns_pairing?(pairing)
    pairing.owns_pairing?(current_user)
  end
  helper_method :owns_pairing?

  private

  def pairing_params
    params.require(:pairing).permit(:round_id, :player_1_id, :player_2_id)
  end

  def pairing_results_params
    params.require(:pairing).permit(:round_id, :player_1_id, :player_2_id, :player_1_wins, :player_2_wins, :draws)
  end
end
