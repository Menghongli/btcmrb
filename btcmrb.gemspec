lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'btcmrb/version'

Gem::Specification.new do |s|
  s.name          = 'btcmrb'
  s.version       = Btcmrb::VERSION
  s.summary       = "Unofficial Ruby Gem for btcmarkets.net API"
  s.description   = "Unofficial Ruby Gem for btcmarkets.net API"
  s.authors       = ["Jeremy Tennant", "Chuan Liang"]
  s.email         = 'chuan@favia.com.au'
  s.files         = Dir.glob("lib/**/*") + %w(LICENSE.md README.md Gemfile)
  s.require_path  = 'lib'
  s.license       = 'MIT'
  s.homepage      = 'https://github.com/chuan-liang/btcmrb'

  s.add_dependency('httparty', '~> 0.14.0')

end
