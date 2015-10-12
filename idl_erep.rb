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
  line = Readline.readline(prompt, true)
  return nil if line.nil?
  if line =~ /^\s*$/ then
    Readline::HISTORY.pop
  end
  if inx = Readline::HISTORY.to_a.index(line) then
    Readline::HISTORY.delete_at(inx)
    Readline::HISTORY.to_a
  end
  line
end

# main routine

# initialize
if not File.exist?(histfile) then
  open(histfile, 'w').close()
end

open(histfile) do |f|
  while l = f.gets
    Readline::HISTORY << l
  end
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


