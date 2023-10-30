require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#format_price' do
    it 'formats a price with euros and two decimal places' do
      price = 25.5
      formatted_price = helper.format_price(price)
      expect(formatted_price).to eq('€25.50')
    end

    it 'handles zero price' do
      price = 0
      formatted_price = helper.format_price(price)
      expect(formatted_price).to eq('€0.00')
    end
  end
end
