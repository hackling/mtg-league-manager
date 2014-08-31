class DecksController < OwnershipController
  expose :deck

  def new
  end

  def create
    previous_deck = Deck.where(round_id: deck_params[:round_id], user: deck_params[:user_id]).first
    if previous_deck.present?
      previous_deck.update_attributes(deck_params)
    else
      flash[:notice] = 'Deck successfully submitted'
      Deck.create(deck_params)
      flash[:notice] = 'Deck successfully submitted'
    end

    redirect_to current_user
  end

  def update
    Deck.find(params['id']).update_attributes!(deck_params)
    flash[:notice] = 'Deck successfully resubmitted'
    redirect_to current_user
  end

  private

  def check_access_permission
    unless Deck.find(params[:id]).user == current_user
      fail ActionForbidden
    end
  end

  def deck_params
    params[:deck].merge!(user_id: current_user.id)
    params.require(:deck).permit(:user_id, :round_id, :list)
  end
end
