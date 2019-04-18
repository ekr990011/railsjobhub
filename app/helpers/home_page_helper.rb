module HomePageHelper

  def humanDate(date)
    ts = Time.now - date
    ts_days = ts / 86400
    if ts_days <= 1
      return 'Today'
    else
      return ts_days.to_i.to_s + "d"
    end
  end

end
