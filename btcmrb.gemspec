lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'btcmrb/version'

Gem::Specification.new do |s|
  s.name          = 'btcmrb'
  s.version       = Btcmrb::VERSION
  s.date          = '2016-11-12'
  s.summary       = "Unofficial Ruby Gem for btcmarkets.net API"
  s.description   = "Unofficial Ruby Gem for btcmarkets.net API"
  s.authors       = ["Jeremy Tennant"]
  s.email         = 'tennantje@gmail.com'
  s.files         = Dir.glob("lib/**/*") + %w(LICENSE.md README.md Gemfile)
  s.require_path  = 'lib'
  s.license       = 'MIT'
  s.homepage      = 'http://rubygems.org/gems/btcmrb'

  s.add_dependency('httparty', '~> 0.14.0')

end
