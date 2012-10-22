class Stock < ActiveRecord::Base

  validates :symbol, :holding, :price, :presence=>true
  validates :holding, :numericality => {:greater_than_or_equal_to => 0}
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :symbol, :uniqueness => true
  
end
