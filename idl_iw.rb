#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# IDL interactive wrapper
# idl_iw.rb

require 'open3'
require 'readline'

idlbin = 'idl'
prompt = 'IDL-IW> '

Open3.popen2e(idlbin) do |i, o, w|

  # stdout, stderr
  Thread.new do
    o.each do |line|
      puts "\033[2K\r" + line
    end
  end

  # main loop
  while l = Readline.readline(prompt, true)
    input = l
    i.puts input

    break if input =~ /^\s*exit/
  end

  i.close

  # status
  puts w.value

end

