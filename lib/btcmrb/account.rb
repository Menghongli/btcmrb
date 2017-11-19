module Btcmrb
  class Account

    def self.balance
      {
        :uri => "/account/balance",
        :body => {},
        :verb => "GET",
        :auth => true
      }
    end

    def self.tradingfee(instrument, currency)
      {
        :uri => "/account/#{instrument}/#{currency}/tradingfee",
        :body => {},
        :verb => "GET",
        :auth => true
      }
    end

  end
end
