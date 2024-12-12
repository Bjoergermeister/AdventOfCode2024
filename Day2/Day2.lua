local function sign(a)
    if a == 0 then
        return 0
    elseif a < 0 then
        return -1
    else
        return 1
    end
end

local function is_save(numbers)
    local sum_of_gradients = 0
    for index=2,#numbers do
        sum_of_gradients = sum_of_gradients + sign(numbers[index - 1] - numbers[index])
    end

    local average_gradient = sign(sum_of_gradients)

    for index=2,#numbers do
        local gradient = sign(numbers[index - 1] - numbers[index])
        local difference = math.abs(numbers[index - 1] - numbers[index])
        if gradient ~= average_gradient or gradient == 0 or difference < 1 or difference > 3 then
            return false
        end
    end

    return true
end

local function is_subset_save(numbers)
    for index=1,#numbers do
        local removed_number = table.remove(numbers, index)
        if is_save(numbers) then
            return true
        end
        table.insert(numbers, index, removed_number)
    end

    return false
end

local function run(lines, allow_cuts)
    local save_count = 0
    for line in lines do

        local numbers = {}
        for number in line:gmatch("%S+") do
            table.insert(numbers, tonumber(number))
        end

        if is_save(numbers) or (allow_cuts and is_subset_save(numbers)) then
            save_count = save_count + 1
        end
    end

    return save_count
end

local lines = io.lines("input.txt")
print("Puzzle 1: " .. tostring(run(lines, false)))
lines = io.lines("input.txt")
print("Puzzle 2: " .. tostring(run(lines, true)))