function split_string(line)
    local separator = "%s"
    local substrings = {}
    for string in string.gmatch(line, "([^"..separator.."]+)") do
        table.insert(substrings, string)
    end
    return substrings
end

listA = {}
listB = {}

for line in io.lines("input.txt") do
    substrings = split_string(line)
    table.insert(listA, tonumber(substrings[1]))
    table.insert(listB, tonumber(substrings[2]))
end

table.sort(listA)
table.sort(listB)

sumOfDistances = 0
for index=1,1000,1 do
    distance = math.abs(listA[index] - listB[index])
    sumOfDistances = sumOfDistances + distance
end

print(sumOfDistances)