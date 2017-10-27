class RailsInvitable::ApplicationController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  def unauthorized
    head 401
  end

  def pagination(object)
    {
      pagination: {
        current_page: object.current_page,
        total_pages: object.total_pages,
        total_count: object.total_count,
        out_of_range: object.out_of_range?,
        per_page: object.limit_value
      }
    }
  end
end
