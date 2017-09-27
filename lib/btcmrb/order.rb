module Btcmrb
  class Order

    def self.all
      # Documentation
      # POST "/order/history"
      # since parameter - an order id.
      # {"currency":"AUD","instrument":"BTC","limit":10,"since":33434568724}
      # {"success":true,"errorCode":null,"errorMessage":null,"orders":[{"id":1003245675,"currency":"AUD","instrument":"BTC","orderSide":"Bid","ordertype":"Limit","creationTime":1378862733366,"status":"Placed","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":10000000,"clientRequestId":null,"trades":[]},{"id":4345675,"currency":"AUD","instrument":"BTC","orderSide":"Ask","ordertype":"Limit","creationTime":1378636912705,"status":"Fully Matched","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":0,"clientRequestId":null,"trades":[{"id":5345677,"creationTime":1378636913151,"description":null,"price":13000000000,"volume":10000000,"fee":100000}]}]}

      # Implementation
      {
        :uri => "/order/history",
        :body => {:currency => "AUD", :instrument => "BTC", :limit => 10,"since":1},
        :verb => "POST",
        :auth => true
      }
    end

    # Similar to Index, but only returns open orders
    def self.open_orders
      # Documentation
      # POST "/order/open"
      # {"currency":"AUD","instrument":"BTC","limit":10,"since":33434568724}
      # {"success":true,"errorCode":null,"errorMessage":null,"orders":[{"id":1003245675,"currency":"AUD","instrument":"BTC","orderSide":"Bid","ordertype":"Limit","creationTime":1378862733366,"status":"Placed","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":10000000,"clientRequestId":null,"trades":[]},{"id":4345675,"currency":"AUD","instrument":"BTC","orderSide":"Ask","ordertype":"Limit","creationTime":1378636912705,"status":"Fully Matched","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":0,"clientRequestId":null,"trades":[{"id":5345677,"creationTime":1378636913151,"description":null,"price":13000000000,"volume":10000000,"fee":100000}]}]}

      # Implementation
      {
        :uri => "/order/open",
        :body => {"currency":"AUD","instrument":"BTC","limit":10,"since":1},
        :verb => "POST",
        :auth => true
      }
    end

    def self.trade_history
      # Documentation
      # POST "/order/trade/history"
      # since parameter - a trade id.
      # {"currency":"AUD","instrument":"BTC","limit":10,"since":33434568724}


      # Implementation
      {
        :uri => "/order/trade/history",
        :body => {"currency":"AUD","instrument":"BTC","limit":10,"since":1},
        :verb => "POST",
        :auth => true
      }
    end

    def self.show(*ids)
      # Documentation
      # POST "/order/detail"
      # {"orderIds":[6840125478]}


      # Implementation
      {
        :uri => "/order/detail",
        :body => {"orderIds":ids},
        :verb => "POST",
        :auth => true
      }
    end

    def self.create(currency, instrument, price, volume, order_side, order_type)
      # Documentation
      # POST "/order/create"
      # The clientRequestId is not currently used but must be specified. Any string is valid.
      # Price of $130 = 13000000000 (i.e x 100000000)
      # Volume of 1 BTC = 100000000 (i.e x 100000000)
      # {"currency":"AUD","instrument":"BTC","price":13000000000,"volume":10000000,"orderSide":"Bid","ordertype":"Limit","clientRequestId":"abc-cdf-1000"}
      # => {"success":true,"errorCode":null,"errorMessage":null,"id":100,"clientRequestId":"abc-cdf-1000"}
      # => {"success":false,"errorCode":3,"errorMessage":"Invalid argument.","id":0,"clientRequestId":"abc-cdf-1000"}

      # Implementation
      {
        :uri => "/order/create",
        :body => {"currency":currency,"instrument":instrument,"price":(price*100000000).round(0),"volume":(volume*100000000).round(0),"orderSide":order_side,"ordertype":order_type,"clientRequestId":"abc-cdf-1000"},
        :verb => "POST",
        :auth => true
      }
    end

    def self.cancel(id)
      # Documentation
      # POST "/order/cancel"
      # {"orderIds":[6840125478]}
      # => {"success":true,"errorCode":null,"errorMessage":null,"responses":[{"success":false,"errorCode":3,"errorMessage":"order does not exist.","id":6840125478}]}

      # Implementation
      {
        :uri => "/order/cancel",
        :body => {"orderIds":id},
        :verb => "POST",
        :auth => true
      }
    end

  end
end
