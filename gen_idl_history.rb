#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# generate .idl_history
# gen_idl_history.rb

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

if ARGV[0] != nil then
  puts read_hist_from_file(ARGV[0])
end

