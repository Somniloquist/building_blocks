#!/usr/bin/env ruby

module Caesar
    def caesar_cipher (input, shift = 0)
        cipher = input.split('').map do |c|
            # determine char code at which to wrap
            c == c.downcase ? wrap_a = 'a'.ord : wrap_a = 'A'.ord
            c == c.downcase ? wrap_z = 'z'.ord : wrap_z = 'Z'.ord

            c == " " ? c : (((c.ord - wrap_a + shift) % 26) + wrap_a).chr
        end

        return cipher.join
    end
end

include Caesar
puts caesar_cipher("Hellow There", -1)