

--
-- Complete the 'misereNim' function below.
--
-- The function is expected to return a STRING.
-- The function accepts INTEGER_ARRAY s as parameter.
--

function misereNim(s)
    local nimSum = 0
    local allOnes = true

    for _, stone in ipairs(s) do
        nimSum = nimSum ~ stone
        allOnes = allOnes and (stone == 1)
    end

    if allOnes then
        return (#s % 2 == 0) and "First" or "Second"
    end

    return (nimSum == 0) and "Second" or "First"
end


local fptr = io.open(os.getenv("OUTPUT_PATH"), "w")

local t = io.stdin:read("*n", "*l")

for titr = 1, t do
    local n = io.stdin:read("*n", "*l")

    local s = {}

    for token in string.gmatch(io.stdin:read("*l"):gsub("%s+$", ""), "[^%s]+") do
        table.insert(s, tonumber(token))
    end

    local result = misereNim(s)

    fptr:write(result, "\n")
end

fptr:close()
