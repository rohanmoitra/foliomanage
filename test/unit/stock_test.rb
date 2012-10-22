require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "stock attributes must not be empty" do
    stock = Stock.new
    assert stock.invalid?
    assert stock.errors[:symbol].any?
    assert stock.errors[:holding].any?
    assert stock.errors[:price].any?
 end

  test "stock price must be positive" do
    stock = Stock.new(:symbol => "AAPL" ,
    :name => "Apple Inc." ,
    :holding => 50 )
    stock.price = -1
    assert stock.invalid?
    assert_equal "must be greater than or equal to 0.01" ,
    stock.errors[:price].join('; ' )
    stock.price = 0
    assert stock.invalid?
    assert_equal "must be greater than or equal to 0.01" ,
    stock.errors[:price].join('; ' )
    stock.price = 1
    assert stock.valid?
  end

end
