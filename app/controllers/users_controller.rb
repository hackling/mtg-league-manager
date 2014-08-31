class UsersController < ApplicationController
  expose :user do
    if params['id']
      User.find(params['id'])
    else
      current_user
    end
  end

  def show
  end

  def contact_details
  end

  def update
  end
end
