require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'can initialize with readable attributes' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor).to be_a(Vendor)
    
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end

  it 'has a check_stock method' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(vendor.check_stock(item1)).to eq(0)
  end

  it 'has a stock method' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.stock(item1, 30)
    
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.check_stock(item1)).to eq(30)

    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)

    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end
end