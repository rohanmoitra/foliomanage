Stock.delete_all
Stock.create( :symbol => 'AAPL',
              :name => 'Apple Inc.',
              :holding =>   10,
              :price => 550.15)

Stock.create( :symbol => 'GOOG',
              :name => 'Google Inc.',
              :holding =>   10,
              :price => 650)

Stock.create( :symbol => 'MSFT',
              :name => 'Microsoft Corp',
              :holding =>   100,
              :price => 35)