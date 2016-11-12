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

  end
end
