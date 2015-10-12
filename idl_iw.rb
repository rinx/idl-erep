#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# IDL interactive wrapper
# idl_iw.rb

require 'open3'

idlbin = "idl"

Open3.popen3(idlbin) do |i, o, e, w|
  i.write "print, test"
  i.close
  o.each do |line|
    puts line
  end
  e.each do |line|
    puts line
  end
  puts w.value
end


