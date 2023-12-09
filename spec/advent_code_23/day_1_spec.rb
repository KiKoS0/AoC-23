# frozen_string_literal: true

require "advent_code_23/day_1"

RSpec.describe AdventCode23::Day1 do
  subject { AdventCode23::Day1 }

  context "part1" do
    it "example" do
      result = subject.new(input: '1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet').run

      expect(result).to be(142)
    end

    it "real input" do
      result = subject.new(input: File.read("data/1.txt")).run
      expect(result).to be(55_108)
    end
  end
  context "part2" do
    it "example" do
      result = subject.new(input: 'two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen').run_2

      expect(result).to be(281)
    end

    it "real input" do
      result = subject.new(input: File.read("data/1.txt")).run_2
      expect(result).to be(56_324)
    end
  end
end
