#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

s = 0

digits = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
reversed_digits = digits.map(&:reverse)




input.split("\n").each do |l| 
    line = l.chars

    first_number = line.find{ |c| c.match?(/\d/) } 
    first_number_index = line.index(first_number)
    last_number = line.reverse.find{ |c| c.match?(/\d/) }
    last_number_index = line.reverse.index(last_number)
    
    digits.each do |d|
        i = l.index(d)
        if !i.nil? && i < first_number_index 
            first_number_index = i
            first_number = digits.index(d) + 1
        end
    end


    reversed_digits.each do |d|
        i = line.reverse.join.index(d)   
        if !i.nil? && i < last_number_index
            last_number_index = i
            last_number = digits.index(d.reverse) + 1
        end
    end



    s += (first_number.to_s + last_number.to_s).to_i 
end

puts s