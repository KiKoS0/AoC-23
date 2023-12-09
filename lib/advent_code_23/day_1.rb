# frozen_string_literal: true

module AdventCode23
  class Day1
    def initialize(input:)
      @input = input
    end

    DIGIT_MAP = {
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9
    }

    def run
      (get_digits input: @input, regex: /\d/).sum
    end

    def run_2
      (get_digits input: @input, regex: /(?=(\d|#{DIGIT_MAP.keys.join("|")}))/).sum
    end

    private

    def get_digits(input:, regex:)
      lines = input.each_line(chomp: true).map(&:strip)

      lines.map do |line|
        digits = line.scan(regex).flatten.map do |digit|
          digit.is_integer? ? digit : DIGIT_MAP[digit]
        end

        "#{digits[0]}#{digits[-1]}".to_i
      end
    end
  end
end

class String
  def is_integer?
    to_i.to_s == self
  end
end
