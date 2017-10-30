require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::RedPocketRecordsController < ApplicationController
    def index
      @red_pocket_records = policy_scope(RedPocketRecord)

      render_pagination(@red_pocket_records, [:user])
    end
  end
end
