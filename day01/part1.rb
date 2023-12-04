#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

s = 0

input.split("\n").each do |l| 
    first_number = l.chars.find{ |c| c.match?(/\d/) } 
    last_number = l.chars.reverse.find{ |c| c.match?(/\d/) }

    s += (first_number + last_number).to_i 
end

puts s