module EventsHelper
  def get_time_sentence(event_date)
    now = Time.now
    dist = distance_of_time_in_words(Time.now, event_date)
    if Time.now > event_date
      return "Happened #{dist} ago"
    else
      return "Happening in #{dist}"
    end
  end
end
