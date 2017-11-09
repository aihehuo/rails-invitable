require_dependency "rails_invitable/application_controller"

module RailsInvitable
  class Api::V1::WithdrawsController < ApplicationController
    def create
      authorize Withdraw
      withdraw = WithdrawCreator.new(current_user, params[:amount].to_f).call
      if withdraw and withdraw.is_a? Withdraw
        render json: { data: withdraw.transfer, channel: withdraw.channel }.to_json, status: :created
      elsif withdraw.is_a? String
        render json: { error: { message: withdraw } }.to_json, status: 422
      else
        render json: { error: { message: "提现失败" } }.to_json, status: 422
      end
    end

    def succeed
      unless RailsInvitable.configuration.webhook_ip_whitelist.include? env["action_dispatch.remote_ip"].to_s
        Rails.logger.info "#{RailsInvitable.configuration.webhook_ip_whitelist} does not have #{env["action_dispatch.remote_ip"].to_s}"
        return
      end
      if params[:type] == 'transfer.succeeded'
        Rails.logger.info "Calling withdraw succeed #{params[:data][:object][:order_no]}"
        WithdrawSuccessor.new(params[:data][:object][:order_no], params).call
        head 201
      end
    end
  end
end
