#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# IDL enhanced REPL
# idl_erep.rb

require 'open3'
require 'readline'

require File.expand_path(File.join(File.dirname(__FILE__), "gen_idl_history"))

idlbin = 'idl'
prompt = 'IDL-EREP> '
homehist = '~/.idl_history'
currhist = './.idl_history'

def readline_hist_management(prompt)
  line = Readline.readline(prompt, false)
  Readline::HISTORY << line.chomp
  return nil if line.nil?
  if line =~ /^\s*$/ then
    Readline::HISTORY.pop
  end
  line
end

# main routine

# initialize
if File.exist?(File.expand_path(currhist)) then
  open(File.expand_path(currhist)) do |f|
    while l = f.gets
      Readline::HISTORY << l.chomp
    end
  end
  histfile = currhist
elsif File.exist?(File.expand_path(homehist)) then
  open(File.expand_path(homehist)) do |f|
    while l = f.gets
      Readline::HISTORY << l.chomp
    end
  end
  histfile = homehist
else
  open(File.expand_path(homehist), 'w').close()
  histfile = homehist
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
open(File.expand_path(histfile), 'w') do |f|
  f.puts Readline::HISTORY.to_a
end


