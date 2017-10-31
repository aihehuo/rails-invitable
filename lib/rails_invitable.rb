require "rails_invitable/engine"
require "rails_invitable/configuration"
require "rails_invitable/accepted_referral_actions"

module RailsInvitable
  mattr_accessor :user_class

  class << self
    attr_accessor :configuration

    def user_class(constantize: true)
      if @@user_class.is_a?(Class)
        raise 'RailsInvitable.user_class MUST be a String or Symbol object, not a Class object.'
      elsif @@user_class.is_a?(String) || @@user_class.is_a?(Symbol)
        constantize ? @@user_class.to_s.constantize : @@user_class.to_s
      end
    end

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

end
