#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# IDL enhanced REPL
# idl_erep.rb

require 'open3'
require 'readline'

profile = '~/.idl_profile'
idlbin = 'idl'
prompt = 'IDL-EREP> '
idlhist  = '~/.idl/idl/rbuf/history'
homehist = '~/.idl_history'
currhist = './.idl_history'
histlim  = 10000

def extract_idl_command(line)
  line.gsub(/ <!--.*-->$/, '')
end

def read_hist_from_file(file)
  res = []
  if File.exist?(File.expand_path(file)) then
    open(File.expand_path(file)) do |f|
      while l = f.gets
        res << extract_idl_command(l.chomp)
      end
    end
  end
  res.reverse
end

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

# read profile
if File.exist?(File.expand_path(profile)) then
  eval File.read File.expand_path(profile)
end

read_hist_from_file(idlhist).map do |h|
  Readline::HISTORY << h
end

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

    break if input =~ /^\s*exit\s*$/
  end

  i.close

  # status
  puts w.value

end

# finalize
open(File.expand_path(histfile), 'w') do |f|
  f.puts Readline::HISTORY.to_a
end


