#!/usr/bin/env ruby
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings input_string, dictionary
    matches = Hash.new(0)
    words = input_string.split

    words.each do |word|
        dictionary.each do |dictionary_word|
            if word.include?(dictionary_word) 
                matches[dictionary_word] += 1
            end
        end
    end

    matches
end

my_string = 'below'
p substrings my_string, dictionary

my_string = 'below low'
p substrings my_string, dictionary

my_string = "Howdy partner, sit down! How's it going?"
p substrings my_string, dictionary