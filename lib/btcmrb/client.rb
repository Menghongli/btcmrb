require 'base64'
require 'openssl'
# require 'pry-byebug'

module Btcmrb

  class Client
    BTCM_ACCESS_KEY       = ENV['BTCM_ACCESS_KEY']
    BTCM_SECRET_KEY       = ENV['BTCM_SECRET']
    DC_BTCM_ACCESS_KEY    = Base64.decode64(BTCM_ACCESS_KEY)
    DC_BTCM_SECRET_KEY    = Base64.decode64(BTCM_SECRET_KEY)
    BASE_URI              = 'https://api.btcmarkets.net'
    include HTTParty

    def initialize
    end

    def send_request(object)
      if object[:auth] == false
        # Hooray! We can write less code, authentication is not necessary.
        response = send(object[:uri])
      else
        # Extra work is necessary, we need to prepare and sign the request
        timestamp = create_timestamp
        options = {
          :uri => object[:uri],
          :timestamp => timestamp,
          :body => object[:body]
        }
        request = format_request(options)
        signature = sign_request(request)
        encoded_signature = Base64.encode64(signature).to_s.gsub("\n",'')

        send(object[:uri],
          { :method => object[:verb],
            :authentication => object[:auth],
            :timestamp => timestamp,
            :encoded_signature => encoded_signature,
            :body => object[:body]
        })
      end

    end

    private

      def create_timestamp
        DateTime.now.strftime('%Q')
      end

      def format_request(options)
        default = options[:uri] + "\n" + options[:timestamp] + "\n"
        unless options[:body].empty?
          default = default + options[:body].to_json.to_s
        end
        default
      end

      def send(uri, options={})
        response = nil
        headers = {
          'Accept-Charset' => 'UTF-8',
          'Accept' => 'application/json',
          'Content-Type' => 'application/json',
          'User-Agent' => "BTCMRB Ruby Gem v#{Btcmrb::VERSION}"
        }

        if options[:authentication]
          headers.merge!(
          { 'apikey' => BTCM_ACCESS_KEY ,
            'signature' => options[:encoded_signature],
            'timestamp' => options[:timestamp]
            }).to_json
        end

        if options[:authentication] && options[:method] == "POST"
          HTTParty.post(BASE_URI + uri, :headers => headers, :body => options[:body].to_json)
        elsif options[:authentication] && options[:method] == "GET"
          HTTParty.get(BASE_URI + uri, :headers => headers)
        else
          HTTParty.get(BASE_URI + uri)
        end
      end

      def sign_request(str)
        OpenSSL::HMAC.digest('sha512', DC_BTCM_SECRET_KEY, str)
      end

  end
end
