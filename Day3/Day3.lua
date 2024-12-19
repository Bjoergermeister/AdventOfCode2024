package.path = "../lib/?.lua;" .. package.path

local pattern = "mul%((%d+),(%d+)%)"
local file = require "file"

local function puzzle1(lines)
    local sum = 0
    for _, line in pairs(lines) do
        for number1, number2 in string.gmatch(line, pattern) do
            sum = sum + (number1 * number2)
        end
    end
    
    return sum
end

local function find_substrings(text, pattern, substrings)
    local start_index = 0
    local end_index = 0
    while start_index < string.len(text) do
        start_index, end_index, _ = string.find(text, pattern, start_index)
        if start_index == nil then
            break
        end

        substrings[start_index] = string.sub(text, start_index, end_index)
        start_index = end_index + 1
    end
end

local function puzzle2(lines)
    local sum = 0
    local is_multiplication_active = true
    for _, line in pairs(lines) do
        local substrings = {}
        find_substrings(line, pattern, substrings)
        find_substrings(line, "do%(%)", substrings)
        find_substrings(line, "don't%(%)", substrings)

        -- Create an array of table indices to be able to sort them
        local indices = {}
        for index in pairs(substrings) do
            table.insert(indices, index)
        end
        table.sort(indices)

        for i, n in ipairs(indices) do
            local action = substrings[n]
            if (action == "do()") then
                is_multiplication_active = true
            elseif (action == "don't()") then
                is_multiplication_active = false
            elseif is_multiplication_active then
                local number1, number2 = string.match(action, pattern)
                sum = sum + (number1 * number2)
            end
        end
    end
    return sum
end

local lines = file.readLinesFromFile("input.txt")
print("Puzzle 1: " .. tostring(puzzle1(lines)))
print("Puzzle 2: " .. tostring(puzzle2(lines)))