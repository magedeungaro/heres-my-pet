require 'action_view'

module NotificationsHelper
  include ActionView::Helpers::DateHelper

  def formatted_date(date_to_format)
    "#{distance_of_time_in_words(date_to_format, Time.now)} ago"
  end
end
