#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

sum = 0
input.split("\n").each do |line|
    winning_nubers = line.split(': ')[1].split(' | ')[0].split(' ').map(&:to_i)
    elf_numbers = line.split(': ')[1].split(' | ')[1].split(' ').map(&:to_i)

    guessed = winning_nubers.intersection(elf_numbers).count
    
    next if guessed == 0
    
    sum += 2 ** (guessed - 1)
end

puts sum