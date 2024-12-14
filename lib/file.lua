local aoc = {}

function aoc.readLinesFromFile(filename)
    local lines = {}
    local file = io.open(filename, "r")
    if not file then
        error("Could not open file " .. filename)
    end

    for line in file:lines() do
        table.insert(lines, line)
    end

    return lines
end

return aoc