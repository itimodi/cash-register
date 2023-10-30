module ApplicationHelper

  # Convert into € with precision 2
  # @params price [Float]
  # @return [String] example: '€25.50'
  def format_price(price)
    number_to_currency(price , unit: '€', precision: 2)
  end
end
