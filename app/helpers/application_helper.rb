module ApplicationHelper
  def br_currency(numeric_input)
    number_to_currency(numeric_input, delimiter: ".", separator: ",")
  end
end
