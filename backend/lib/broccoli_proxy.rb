module BroccoliProxy
  class Middleware
    def initialize(app)
      @port = ENV['EMBER_PORT'] || 4200
      puts "Ember port: #{@port}"
      @app = app
    end

    def call(env)
      source_request = Rack::Request.new env

      if source_request.path =~ /\A\/assets\//
        broccoli_path = "http://localhost:#{@port}/#{source_request.path.sub(/\/assets/, '')}"
        broccoli_request = Net::HTTP::Get.new broccoli_path

        broccoli_response = Net::HTTP.start('localhost', @port) do |http|
          http.request(broccoli_request)
        end

        headers = {}
        broccoli_response.each_header do |k,v|
          headers[k] = v unless k.to_s =~ /cookie|content-length|transfer-encoding/i
        end
        [broccoli_response.code.to_i, headers, [broccoli_response.read_body]]
      else
        @app.call(env)
      end
    end
  end
end
