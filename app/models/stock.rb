class Stock < ApplicationRecord 
    has_many :user_stocks
    has_many :users, through: :user_stocks

    def self.fint_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end
    

    def self.new_lookup(ticker_symbol)
        begin
            result = StockQuote::Stock.quote(ticker_symbol)
            new(name: result.company_name, ticker: result.symbol, last_price: result.latest_price) 
        rescue Exception => e
            return nil
        end
    end
end
