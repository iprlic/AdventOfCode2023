#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

sum = 0

input.split("\n").each do |l| 
   r = 0
   g = 0
   b = 0
   draws = l.split(': ')[1].split('; ').each do |d|
        d.split(', ').each do |c|
            n = c.split(' ')[0].to_i
            color = c.split(' ')[1]
            r = n if color == 'red' && n > r 
            g = n if color == 'green' && n > g 
            b = n if color == 'blue' && n > b 
        end
   end

   sum += (r * g * b)
end

puts sum