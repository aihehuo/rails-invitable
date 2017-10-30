module RailsInvitable
  class UserAcceptedReferralSerializer < ActiveModel::Serializer
    include TimeHelper

    attributes :id
    attributes :time_info
    attributes :status

    belongs_to :user

    def time_info
      if object.completed_at
        "#{format_to_date(object.completed_at)} #{I18n.t('rails_invitable.invite.invite')}"
      elsif object.registered_at
        "#{format_to_date(object.registered_at)} #{I18n.t('rails_invitable.invite.be_member')}"
      end
    end

    def status
      if object.completed_at
        I18n.t('rails_invitable.invite.invite_success')
      elsif object.registered_at
        I18n.t('rails_invitable.invite.waiting_opening')
      end
    end
  end
end
