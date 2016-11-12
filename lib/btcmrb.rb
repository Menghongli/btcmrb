require "httparty"

Dir[File.dirname(__FILE__) + '/btcmrb/*.rb'].each do |file|
  require file
end

module Btcmrb

  def new
    Client.new
  end
  module_function :new

end
