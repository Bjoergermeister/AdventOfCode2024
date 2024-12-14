package.path = "../lib/?.lua;" .. package.path

local file = require "file"

local pattern = "mul%((%d+),(%d+)%)"

local function puzzle1(lines)
    local sum = 0
    for _, line in pairs(lines) do
        for number1, number2 in string.gmatch(line, pattern) do
            sum = sum + (number1 * number2)
        end
    end

    return sum
end

local lines = file.readLinesFromFile("input.txt")
print("Puzzle 1: " .. tostring(puzzle1(lines)))