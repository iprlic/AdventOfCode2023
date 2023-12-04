#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

r = 12
g = 13
b = 14

sum = 0

input.split("\n").each do |l| 
   id = l.split(': ')[0].split(' ').last.to_i
   broken = false
   draws = l.split(': ')[1].split('; ').each do |d|
        d.split(', ').each do |c|
            n = c.split(' ')[0].to_i
            color = c.split(' ')[1]
            broken = true if color == 'red' && n > r 
            broken = true if color == 'green' && n > g 
            broken = true if color == 'blue' && n > b 

            break if broken
        end

        break if broken
   end

   sum += id if !broken
end

puts sum