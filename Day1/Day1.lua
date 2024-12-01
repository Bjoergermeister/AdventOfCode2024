ListA = {}
ListB = {}

function split_string(line)
    local separator = "%s"
    local substrings = {}
    for string in string.gmatch(line, "([^"..separator.."]+)") do
        table.insert(substrings, string)
    end
    return substrings
end

for line in io.lines("input.txt") do
    local substrings = split_string(line)
    table.insert(ListA, tonumber(substrings[1]))
    table.insert(ListB, tonumber(substrings[2]))
end

table.sort(ListA)
table.sort(ListB)

function part1()
    local sumOfDistances = 0
    for index=1,1000,1 do
        local distance = math.abs(ListA[index] - ListB[index])
        sumOfDistances = sumOfDistances + distance
    end

    return sumOfDistances
end

function part2()
    local listB_quantities = {}
    for _, value in ipairs(ListB) do
        if listB_quantities[value] ~= nil then
            local currentValue = listB_quantities[value]
            listB_quantities[value] = currentValue + 1
        else
            listB_quantities[value] = 1
        end
    end

    local sum = 0
    for _, value in pairs(ListA) do
        if listB_quantities[value] ~= nil then
            sum = sum + (value * listB_quantities[value])
        end
    end

    return sum
end


print(part1())
print(part2())