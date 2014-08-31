class OwnershipController < ApplicationController
  before_filter :check_access_permission, except: [:index, :new, :create]

  ActionForbidden = Class.new StandardError

  rescue_from ActionForbidden do
    render status: :forbidden, text: "Defense Grid"
  end

  private

  def check_access_permission
    fail ActionForbidden
  end
end
