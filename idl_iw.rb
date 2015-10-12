#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# IDL interactive wrapper
# idl_iw.rb

require 'open3'

idlbin = 'idl'

Open3.popen2e(idlbin) do |i, o, w|

  # stdout, stderr
  Thread.new do
    o.each do |line|
      puts line
    end
  end

  # main loop
  loop do
    input = $stdin.gets
    i.puts input

    break if input =~ /^\s*exit/
  end

  i.close

  # status
  puts w.value

end

