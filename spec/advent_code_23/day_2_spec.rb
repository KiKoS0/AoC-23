# frozen_string_literal: true

require "advent_code_23/day_2"

INPUT = 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'

RSpec.describe AdventCode23::Day2 do
  subject { AdventCode23::Day2 }

  context "part1" do
    it "example" do
      result = subject.new(input: INPUT).run

      expect(result).to be(8)
    end

    it "real input" do
      result = subject.new(input: File.read("data/2.txt")).run
      expect(result).to be(2632)
    end
  end
  context "part2" do
    it "example" do
      result = subject.new(input: INPUT).run_2

      expect(result).to be(2286)
    end

    it "real input" do
      result = subject.new(input: File.read("data/2.txt")).run_2
      expect(result).to be(69_629)
    end
  end
end
