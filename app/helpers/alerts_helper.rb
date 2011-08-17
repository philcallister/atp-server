module AlertsHelper

  def day(date)
    date.strftime("%d")

  end

  def month(date)
    date.strftime("%b")
  end

end
