# frozen_string_literal: true

def task1(logs)
  lines = logs.split("\n")
  lines.map { |line| line.downcase.include?('error') ? line : '' }.join
end
