#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)


matrix = input.split("\n").map(&:chars)

star_pos = {}

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


        pos.each do |i|
            if !matrix[y][i-1].nil? && !matrix[y][i-1].match?(/\d/) && matrix[y][i-1] == '*'
                if star_pos[[y, i-1]].nil?
                    star_pos[[y, i-1]] = [num.to_i]
                else
                    star_pos[[y, i-1]].push(num.to_i)
                end
            end
            if !matrix[y][i+1].nil? && !matrix[y][i+1].match?(/\d/) && matrix[y][i+1] == '*'
                if star_pos[[y, i+1]].nil?
                    star_pos[[y, i+1]] = [num.to_i]
                else
                    star_pos[[y, i+1]].push(num.to_i)
                end
            end

            if !matrix[y-1].nil? && !matrix[y-1][i].nil? && !matrix[y-1][i].match?(/\d/) && matrix[y-1][i] == '*'
                if star_pos[[y-1, i]].nil?
                    star_pos[[y-1, i]] = [num.to_i]
                else
                    star_pos[[y-1, i]].push(num.to_i)
                end
            end

            if !matrix[y+1].nil? && !matrix[y+1][i].nil? && !matrix[y+1][i].match?(/\d/) && matrix[y+1][i] == '*'
                if star_pos[[y+1, i]].nil?
                    star_pos[[y+1, i]] = [num.to_i]
                else
                    star_pos[[y+1, i]].push(num.to_i)
                end
            end

            if !matrix[y-1].nil? && !matrix[y-1][i+1].nil? && !matrix[y-1][i+1].match?(/\d/) && matrix[y-1][i+1] == '*'
                if star_pos[[y-1, i+1]].nil?
                    star_pos[[y-1, i+1]] = [num.to_i]
                else
                    star_pos[[y-1, i+1]].push(num.to_i)
                end
            end

            if !matrix[y+1].nil? && !matrix[y+1][i+1].nil? && !matrix[y+1][i+1].match?(/\d/) && matrix[y+1][i+1] == '*'
                if star_pos[[y+1, i+1]].nil?
                    star_pos[[y+1, i+1]] = [num.to_i]
                else
                    star_pos[[y+1, i+1]].push(num.to_i)
                end
            end

            if !matrix[y-1].nil? && !matrix[y-1][i-1].nil? && !matrix[y-1][i-1].match?(/\d/) && matrix[y-1][i-1] == '*'
                if star_pos[[y-1, i-1]].nil?
                    star_pos[[y-1, i-1]] = [num.to_i]
                else
                    star_pos[[y-1, i-1]].push(num.to_i)
                end
            end

            if !matrix[y+1].nil? && !matrix[y+1][i-1].nil? && !matrix[y+1][i-1].match?(/\d/) && matrix[y+1][i-1] == '*'
                if star_pos[[y+1, i-1]].nil?
                    star_pos[[y+1, i-1]] = [num.to_i]
                else
                    star_pos[[y+1, i-1]].push(num.to_i)
                end
            end
        end

    end
end
 
sum = star_pos.reduce(0) do |acc, (k, v)|
    v.uniq.size == 2 ? acc + v.uniq.reduce(:*) : acc
end

puts sum