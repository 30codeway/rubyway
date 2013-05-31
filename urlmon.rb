#!/usr/bin/env ruby
#FIle:		urlmon.rb
require 'net/http'
require 'logger'
include Net

$LOG = Logger.new('monitor.log')
domain = ARGV[0]

if domain == nil
    usage = "Usage:./urlmon.rb domain.com"
    $LOG.debug usage
elsif domain != nil
    begin
        url = URI::parse("http://"+domain.to_s)
        request = HTTP.start(url.host, url.port) do |http|
            begin
                response = http.request_get(url.request_uri)
                test = response.code + " " + response.message
                $LOG.info url.to_s + " " + test
            end
        end
     end
end
