require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'can initialize with readable attributes' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'has a check_stock method' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    expect(vendor.check_stock(item1)).to eq(0)
  end
end