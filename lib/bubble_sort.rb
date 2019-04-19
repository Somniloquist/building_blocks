#!/usr/bin/env ruby

def bubble_sort array_to_sort
    sorted = array_to_sort
    sorted.each do
        sorted.each_index do |position|
            first, second = sorted[position], sorted[position + 1]
            break if !second
            sorted[position], sorted[position + 1] = second, first if (first > second) 
        end
    end
end

def bubble_sort_by array_to_sort
    sorted = array_to_sort
    sorted.each_index do |position|
        left, right = sorted[position], sorted[position+1]
        break if !second 
        if yield(left, right) > 0
            sorted[position], sorted[position+1] = second, first
        end
    end
    sorted
end

bubble_sort [4,3,78,2,0,2]
test = bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end

p test