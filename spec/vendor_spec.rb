require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  it 'can initialize with readable attributes' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end
end