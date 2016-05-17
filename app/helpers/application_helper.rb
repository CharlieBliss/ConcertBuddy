module ApplicationHelper

  def std_format_time(time)
    return "" unless time
    time.strftime("%l:%M %P")
  end

  def std_format_date(date)
    return "" unless date
    date.strftime("%b %e, %Y")
  end

end
