module FormatHelper
  def hms(sec)
    min, sec = sec.divmod(60)
    hour, min = min.divmod(60)
    if hour.zero?
      '%02d:%02d' % [min, sec]
    else
      '%d:%02d:%02d' % [hour, min, sec]
    end
  end
end
