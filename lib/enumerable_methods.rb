#!/usr/bin/env ruby

 module Enumerable

  def my_each
    return self.to_enum(__method__) unless block_given?

    self.length.times do |item|
        yield self[item]
    end
    self
  end

  def my_each_with_index
    return self.to_enum(__method__) unless block_given?

    for i in 0...self.length do
      yield self[i], i
    end
    self
  end

  def my_select
    return self.to_enum(__method__) unless block_given?

    select = []
    self.my_each do |item|
      select << item if yield(item)
    end
    select
  end

  def my_all?
    return true unless block_given?
    self.my_each do |item|
      yield(item) ? true : (return false)
    end
    true
  end

  def my_any?
    return true unless block_given?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    return false unless block_given?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each { |item| count += 1 if yield(item) }
    else 
      self.my_each { count += 1 }
    end
    count
  end

  def my_map
    return self.to_enum(__method__) unless block_given?

    map = []
    self.my_each { |item| map << yield(item) }
    map
  end

  def my_inject memo = nil
    if memo.nil?
      memo = self[0]
      self[1...self.length].my_each { |item| memo = yield(memo, item) }
    else
      self.my_each { |item| memo = yield(memo, item) }
    end

    memo
  end

end

def multiply_els collection
  collection.my_inject { |total, n| total * n }
end

test = [1,2,3,4,5]
my_proc = Proc.new { |n| n * 5 }
p test.my_map(&my_proc)

p multiply_els([2,4,5])