module RailsInvitable
  class Withdraw < ApplicationRecord
    serialize :transfer, JSON
    serialize :response, JSON

    enum channel: [:wx_pub]

    belongs_to :user, class_name: RailsInvitable.user_class.to_s, required: true

    def title
      I18n.t('rails_invitable.titles.withdraw', payment_name: I18n.t("rails_invitable.payment_channels.#{channel}"))
    end
  end
end
