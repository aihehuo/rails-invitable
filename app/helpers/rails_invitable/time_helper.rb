module RailsInvitable
  module TimeHelper
    def format_to_date(time)
      time.strftime("%Y-%m-%d")
    end
  end
end
