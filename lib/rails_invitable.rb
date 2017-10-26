require "rails_invitable/engine"
require "rails_invitable/configuration"

module RailsInvitable
  mattr_accessor :user_class

  def self.user_class(constantize: true)
    if @@user_class.is_a?(Class)
      raise 'RailsInvitable.user_class MUST be a String or Symbol object, not a Class object.'
    elsif @@user_class.is_a?(String) || @@user_class.is_a?(Symbol)
      constantize ? @@user_class.to_s.constantize : @@user_class.to_s
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
