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

    attr_accessor :base_uri, :timestamp

    def initialize
      @base_uri = BASE_URI
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
            :encoded_signature => encoded_signature
        })
      end

    end

    private

      def create_timestamp
        (Time.now.to_f * 1000).to_i.to_s
      end

      def format_request(options)
        default = options[:uri] + "\n" + options[:timestamp] + "\n"
        unless options[:body].empty?
          default = primary + options[:body]
        end
        default
      end

      def send(uri, options={})
        response = nil
        default_headers = {
          'Accept-Charset' => 'UTF-8',
          'Accept' => 'application/json',
          'Content-Type' => 'application/json',
          'User-Agent' => "BTCMRB Ruby Gem v#{Btcmrb::VERSION}"
        }

        if options[:authentication] && options[:method] == "POST"
          default_headers.merge!(
            { 'apikey' => BTCM_ACCESS_KEY ,
              'signature' => options[:encoded_signature],
              'timestamp' => options[:timestamp]
            }).to_json
            # TODO
        elsif options[:authentication] && options[:method] == "GET"
          default_headers.merge!(
            { 'apikey' => BTCM_ACCESS_KEY ,
              'signature' => options[:encoded_signature],
              'timestamp' => options[:timestamp]
            }).to_json
          HTTParty.get(BASE_URI + uri, headers: default_headers)
        else
          response = HTTParty.get(BASE_URI + uri)
        end
      end

      def sign_request(str)
        OpenSSL::HMAC.digest('sha512', DC_BTCM_SECRET_KEY, str)
      end

  end
end
