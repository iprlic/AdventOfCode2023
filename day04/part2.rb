#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

winners = input.split("\n").map do |line|
    winning_nubers = line.split(': ')[1].split(' | ')[0].split(' ').map(&:to_i)
    elf_numbers = line.split(': ')[1].split(' | ')[1].split(' ').map(&:to_i)

    winning_nubers.intersection(elf_numbers).count
end

all_cards = {}

winners.each_with_index do |winner, index|
    i = index + 1 

    if all_cards[i].nil?
        all_cards[i] = 1
    else
        all_cards[i] += 1
    end

    winner.times do |j|
        if all_cards[i+j+1].nil?
            all_cards[i+j+1] = all_cards[i]
        else
            all_cards[i+j+1] += all_cards[i]
        end
    end
end

sum = all_cards.reduce(0) do |acc, (key, value)| 
    acc += value
end

puts sum