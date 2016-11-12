# BTCMarkets API Wrapper

## Description
Unofficial Ruby Gem for btcmarkets.net API and is still very much a work in progress.

## Installation
### Install the gem
```sh
gem install btcmrb
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
# Example
balance_request = Btcmrb::Account.balance
client = Btcmrb.new
client.send_request(balance_request)
# => [{"balance":1000000000,"pendingFunds":0,"currency":"AUD"},{"balance":1000000000,"pendingFunds":0,"currency":"BTC"},{"balance":1000000000,"pendingFunds":0,"currency":"LTC"}]
```

### Market Data API
https://github.com/BTCMarkets/API/wiki/Market-data-API
```ruby
# Example
ticker_request = Btcmrb::Marketdata.tick
client = Btcmrb.new
client.send_request(ticker_request)
# => {"bestBid":844.0,"bestAsk":844.98,"lastPrice":845.0,"currency":"AUD","instrument":"BTC","timestamp":1476242958,"volume24h":172.60804}

orderbook_request = Btcmrb::Marketdata.orderbook
client = Btcmrb.new
client.send_request(orderbook_request)
# => {"currency":"AUD","instrument":"BTC","timestamp":1476243360,"asks":[[844.98,0.45077821],[845.0,2.7069457],[848.68,2.58512],[848.76,0.29745]],"bids":[[844.0,0.00489636],[840.21,0.060724],[840.16,0.1180803],[840.1,0.32130103]]}

trades_requst = Btcmrb::Marketdata.trades
client = Btcmrb.new
client.send_request(trades_requst)
# => [{"tid":4432702312,"amount":0.01959674,"price":845.0,"date":1378878093},{"tid":59861212129,"amount":1.21434000,"price":845.15,"date":1377840783}]
```
## License
MIT - For terms refer to LICENSE.md
