class RailsInvitable::ApplicationController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  def unauthorized
    head 401
  end
end
