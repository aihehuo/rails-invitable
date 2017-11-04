module RailsInvitable
  module TimeHelper
    def format_to_date(time)
      time.strftime("%Y-%m-%d")
    end

    def format_to_datetime(time)
      time.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end
