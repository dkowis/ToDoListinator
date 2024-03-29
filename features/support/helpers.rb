def parse_date(date_string)
  case date_string
    when "tomorrow"
      1.day.from_now
    when "yesterday"
      1.day.ago
    when "today"
      Date.today
    else
      Date.parse(date_string)
  end
end