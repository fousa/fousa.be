module DateHelper
  def format_quarter_date(date)
    year = date.beginning_of_quarter.year
    quarter = ((date.beginning_of_quarter.month - 1) / 3) + 1
    "#{year} Q#{quarter}"
  end
end
