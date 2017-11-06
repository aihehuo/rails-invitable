module RailsInvitable
  class WithdrawSuccessor
    def initialize(order_no, response)
      @order_no = order_no
      @response = response
    end

    def call
      return false unless withdraw && withdraw_pending?
      ActiveRecord::Base.transaction do
        withdraw_finish
        charge_user_red_pocket
        record_red_pocket_change
      end
      withdraw
    rescue
      false
    end

    private

    attr_reader :order_no, :response

    def record_red_pocket_change
      RedPocketRecord.create!(referable: withdraw, amount: withdraw.amount, incoming: false, user: withdraw.user)
    end

    def withdraw_finish
      withdraw.update(response: response, success: true)
    end

    def charge_user_red_pocket
      withdraw.user.increment!(:red_pocket, -withdraw.amount)
    end

    def withdraw
      @withdraw ||= Withdraw.find_by(order_no: order_no)
    end

    def withdraw_pending?
      withdraw.success == false
    end
  end
end
