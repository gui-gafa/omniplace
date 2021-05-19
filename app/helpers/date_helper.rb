module DateHelper
  def date_as_dmy(date)
    date.strftime("%d/%m/%Y") if date.present?
  end
  def batata
    "batata"
  end
end
