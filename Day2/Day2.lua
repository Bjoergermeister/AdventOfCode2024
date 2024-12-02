local function sign(a)
    if a == 0 then
        return 0
    elseif a < 0 then
        return -1
    else
        return 1
    end
end

local function is_save(numbers, count)
    local original_sign = sign(numbers[1] - numbers[2])
    for index=2,count do
        local firstNumber = numbers[index - 1]
        local secondNumber = numbers[index]
        local abs = math.abs(firstNumber - secondNumber)
        if abs < 1 or abs > 3 or sign(firstNumber - secondNumber) ~= original_sign then
            return false
        end
    end

    return true
end

local function puzzle1(lines)
    local save_count = 0
    for line in lines do

        local numbersCount = 0
        local numbers = {}
        for number in line:gmatch("%S+") do
            table.insert(numbers, tonumber(number))
            numbersCount = numbersCount + 1
        end

        if is_save(numbers, numbersCount) then
            save_count = save_count + 1
        end
    end

    return save_count
end

local lines = io.lines("input.txt")
print("Puzzle 1: " .. tostring(puzzle1(lines)))