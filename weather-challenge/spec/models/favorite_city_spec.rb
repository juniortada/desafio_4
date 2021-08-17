require 'rails_helper'

RSpec.describe FavoriteCity, :type => :model do
  it 'is valid with valid attributes' do
    expect(FavoriteCity.new(name: 'Sao Paulo')).to be_valid
  end
  it 'is not valid without a name' do
    city = FavoriteCity.new(name: nil)
    expect(city).to_not be_valid
  end
end
