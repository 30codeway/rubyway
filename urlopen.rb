#!/usr/bin/env ruby
require 'open-uri'

f = open('http://bbs.linuxtone.org')

f.each_line do |line|
  puts line
end

puts "The document is #{f.size} bytes in length"
