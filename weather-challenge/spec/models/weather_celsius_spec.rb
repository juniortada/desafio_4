require 'rails_helper'

RSpec.describe WeatherCelsius, type: :model do
  describe 'temperature' do
    context 'given celsius temperature' do
      it 'return temperature' do
        expect(WeatherCelsius.new.temperature(54.21)).to eq(12.34)
      end
    end
  end
end
