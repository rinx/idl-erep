#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# IDL enhanced REPL
# idl_erep.rb

require 'open3'
require 'readline'

idlbin = 'idl'
prompt = 'IDL-EREP> '
histfile = './.idl_history'

def readline_hist_management(prompt)
  line = Readline.readline(prompt, false)
  Readline::HISTORY << line.gsub(/$/, '')
  return nil if line.nil?
  if line =~ /^\s*$/ then
    Readline::HISTORY.pop
  end
  line
end

# main routine

# initialize
if File.exist?(histfile) then
  open(histfile) do |f|
    while l = f.gets
      Readline::HISTORY << l
    end
  end
else
  open(histfile, 'w').close()
end

Open3.popen2e(idlbin) do |i, o, w|

  # stdout, stderr
  Thread.new do
    o.each do |line|
      puts "\033[2K\r" + line
      print prompt
    end
  end

  # main loop
  while input = readline_hist_management(prompt)
    i.puts input

    break if input =~ /^\s*exit/
  end

  i.close

  # status
  puts w.value

end

# finalize
open(histfile, 'w') do |f|
  f.puts Readline::HISTORY.to_a
end


