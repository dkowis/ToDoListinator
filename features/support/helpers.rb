def parse_date(date_string)
  if date_string == "tomorrow"
    1.day.from_now
  else
    Date.parse(due_date)
  end
end