# frozen_string_literal: true

module AdventCode23
  class Day3
    def initialize(input:)
      @input = input
      @lines = @input.each_line(chomp: true).map(&:strip)
    end

    def run
      numbers = find_numbers
      adjacents = find_adjacents numbers

      part_numbers = numbers.zip(adjacents).filter do |_number, bound|
        bound.any? { |b| symbol? b[0], b[1] }
      end.map { |number, _bound| number[0] }

      part_numbers.sum
    end

    def run_2
      numbers = find_numbers
      adjacents = find_adjacents numbers

      numbers.zip(adjacents).each_with_object(Hash.new { |h, k| h[k] = [] }) do |zippedNumber, acc|
        adjacent = zippedNumber[1]
        adjacent_gears = adjacent.filter { |x, y| gear? x, y }
        adjacent_gears.each do |x, y|
          acc["#{x}_#{y}"] << zippedNumber[0][0]
        end
      end.values.filter { |value| value.length == 2 }.map { |value| value.reduce(:*) }.sum
    end

    private

    def find_numbers
      numbers = []

      @lines.each_with_index do |line, index|
        line.scan(/\d+/) do |number|
          match = Regexp.last_match.offset(0)
          numbers.append [number.to_i, match[0], match[1] - 1, index]
        end
      end

      numbers
    end

    def find_adjacents(numbers)
      numbers.map { |number| bounding_box(number) }
    end

    def bounding_box(number)
      x1 = number[1]
      x2 = number[2]
      y = number[3]

      x_max = @lines[0].length - 1
      y_max = @lines.length - 1

      coordinates_around = (x1 - 1..x2 + 1).to_a.product((y - 1..y + 1).to_a)
      coordinates_around.filter do |i, j|
        (0..x_max).cover?(i) && (0..y_max).cover?(j) && !(j == y && (x1..x2).cover?(i))
      end
    end

    def symbol?(x, y)
      char = @lines[y][x]
      /\D/.match(char) && char != "."
    end

    def gear?(x, y)
      @lines[y][x] == "*"
    end
  end
end
