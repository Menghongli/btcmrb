# Btcmrb (BTC Markets Ruby)


## Description
Unofficial Ruby Gem for btcmarkets.net API and is still very much a work in progress.

## Installation
### Install the gem
Command line:
```
$ gem install btcmrb
```
Or in your application's Gemfile:
```
gem 'btcmrb', '~> 0.1.5'
```
### Create some environment variables
https://btcmarkets.net/account/apikey
```
export BTCM_ACCESS_KEY="YOUR ACCESS KEY"
export BTCM_SECRET="YOUR SECRET"
```

### Account Management API
https://github.com/BTCMarkets/API/wiki/Account-API
```ruby
client = Btcmrb.new
balance_request = Btcmrb::Account.balance
client.send_request(balance_request)
# => [{"balance":1000000000,"pendingFunds":0,"currency":"AUD"},{"balance":1000000000,"pendingFunds":0,"currency":"BTC"},{"balance":1000000000,"pendingFunds":0,"currency":"LTC"}]
```

### Market Data API
https://github.com/BTCMarkets/API/wiki/Market-data-API
```ruby
client = Btcmrb.new
ticker_request = Btcmrb::Marketdata.tick('BTC','AUD')
client.send_request(ticker_request)
# => {"bestBid":844.0,"bestAsk":844.98,"lastPrice":845.0,"currency":"AUD","instrument":"BTC","timestamp":1476242958,"volume24h":172.60804}

client = Btcmrb.new
orderbook_request = Btcmrb::Marketdata.orderbook('BTC','AUD')
client.send_request(orderbook_request)
# => {"currency":"AUD","instrument":"BTC","timestamp":1476243360,"asks":[[844.98,0.45077821],[845.0,2.7069457],[848.68,2.58512],[848.76,0.29745]],"bids":[[844.0,0.00489636],[840.21,0.060724],[840.16,0.1180803],[840.1,0.32130103]]}

client = Btcmrb.new
trades_requst = Btcmrb::Marketdata.trades('BTC','AUD')
client.send_request(trades_requst)
# => [{"tid":4432702312,"amount":0.01959674,"price":845.0,"date":1378878093},{"tid":59861212129,"amount":1.21434000,"price":845.15,"date":1377840783}]
```

### Trading API
https://github.com/BTCMarkets/API/wiki/Trading-API
```ruby
client = Btcmrb.new
all_orders = Btcmrb::Order.all
client.send_request(all_orders)
# => {"success":true,"errorCode":null,"errorMessage":null,"orders":[{"id":1003245675,"currency":"AUD","instrument":"BTC","orderSide":"Bid","ordertype":"Limit","creationTime":1378862733366,"status":"Placed","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":10000000,"clientRequestId":null,"trades":[]},{"id":4345675,"currency":"AUD","instrument":"BTC","orderSide":"Ask","ordertype":"Limit","creationTime":1378636912705,"status":"Fully Matched","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":0,"clientRequestId":null,"trades":[{"id":5345677,"creationTime":1378636913151,"description":null,"price":13000000000,"volume":10000000,"fee":100000}]}]}

client = Btcmrb.new
open_orders = Btcmrb::Order.open_orders
client.send_request(open_orders)
# => {"success":true,"errorCode":null,"errorMessage":null,"orders":[{"id":1003245675,"currency":"AUD","instrument":"BTC","orderSide":"Bid","ordertype":"Limit","creationTime":1378862733366,"status":"Placed","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":10000000,"clientRequestId":null,"trades":[]},{"id":4345675,"currency":"AUD","instrument":"BTC","orderSide":"Ask","ordertype":"Limit","creationTime":1378636912705,"status":"Fully Matched","errorMessage":null,"price":13000000000,"volume":10000000,"openVolume":0,"clientRequestId":null,"trades":[{"id":5345677,"creationTime":1378636913151,"description":null,"price":13000000000,"volume":10000000,"fee":100000}]}]}

client = Btcmrb.new
trade_history = Btcmrb::Order.trade_history
client.send_request(trade_history)
# => TBC

# A single order
client = Btcmrb.new
order_detail = Btcmrb::Order.show(123456789)
client.send_request(order_detail)
# => TBC

# Multiple orders
client = Btcmrb.new
order_detail = Btcmrb::Order.show(123456789,987654321)
client.send_request(order_detail)
# => TBC

# TODO: Create New Orders

client = Btcmrb.new
order_to_cancel = Btcmrb::Order.cancel(123456789)
client.send_request(order_to_cancel)
# =>  TBC
```



## License
MIT - For terms refer to LICENSE.md
