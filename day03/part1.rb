#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

sum = 0

matrix = input.split("\n").map(&:chars)

matrix.each_with_index do |row, y|
    skip = 0
    row.each_with_index do |cell, x|
     
        if skip > 0 
            skip -= 1
            next
        end
        next if !cell.match?(/\d/)
        
        num = cell
        pos = [x]

        while !matrix[y][x + 1].nil? && matrix[y][x + 1].match?(/\d/)
            num += matrix[y][x + 1]
            x += 1
            skip += 1
            pos.push(x)
        end

        is_valid = false

        pos.each do |i|
            is_valid = true if !matrix[y][i-1].nil? && !matrix[y][i-1].match?(/\d/) && matrix[y][i-1] != '.'
            is_valid = true if !matrix[y][i+1].nil? && !matrix[y][i+1].match?(/\d/) && matrix[y][i+1] != '.'

            is_valid = true if !matrix[y-1].nil? && !matrix[y-1][i].nil? && !matrix[y-1][i].match?(/\d/) && matrix[y-1][i] != '.'
            is_valid = true if !matrix[y+1].nil? && !matrix[y+1][i].nil? && !matrix[y+1][i].match?(/\d/) && matrix[y+1][i] != '.'

            is_valid = true if !matrix[y-1].nil? && !matrix[y-1][i+1].nil? && !matrix[y-1][i+1].match?(/\d/) && matrix[y-1][i+1] != '.'
            is_valid = true if !matrix[y+1].nil? && !matrix[y+1][i+1].nil? && !matrix[y+1][i+1].match?(/\d/) && matrix[y+1][i+1] != '.'

            is_valid = true if !matrix[y-1].nil? && !matrix[y-1][i-1].nil? && !matrix[y-1][i-1].match?(/\d/) && matrix[y-1][i-1] != '.'
            is_valid = true if !matrix[y+1].nil? && !matrix[y+1][i-1].nil? && !matrix[y+1][i-1].match?(/\d/) && matrix[y+1][i-1] != '.'
        end

        sum += num.to_i if is_valid
    end
end

puts sum