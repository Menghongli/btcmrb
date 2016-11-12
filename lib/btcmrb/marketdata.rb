module Btcmrb
  class Marketdata

    def self.tick
      {
        :uri => "/market/BTC/AUD/tick",
        :body => {},
        :verb => "GET",
        :auth => false
      }
      #=> {"bestBid":844.0,"bestAsk":844.98,"lastPrice":845.0,"currency":"AUD","instrument":"BTC","timestamp":1476242958,"volume24h":172.60804}
    end

    def self.orderbook
      {
        :uri => "/market/BTC/AUD/orderbook",
        :body => {},
        :verb => "GET",
        :auth => false
      }
      #=> {"currency":"AUD","instrument":"BTC","timestamp":1476243360,"asks":[[844.98,0.45077821],[845.0,2.7069457],[848.68,2.58512],[848.76,0.29745]],"bids":[[844.0,0.00489636],[840.21,0.060724],[840.16,0.1180803],[840.1,0.32130103]]}
    end

    def self.trades
      {
        :uri => "/market/BTC/AUD/trades",
        :body => {},
        :verb => "GET",
        :auth => false
      }
      #=> [{"tid":4432702312,"amount":0.01959674,"price":845.0,"date":1378878093},{"tid":59861212129,"amount":1.21434000,"price":845.15,"date":1377840783}]
    end

  end
end
