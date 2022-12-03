local n = arg[1]
local start = {}
for i = 1, n do
    start[i] = "A"
end
local stop = {}
for i = 1, n do
    stop[i] = "T"
end
local counter = 1
local convert = {
    A = "C",
    C = "G",
    G = "T",
    T = "A"
}

local function table_equals(a, b)
    for i = 1, n do
        if not (b[i] == a[i]) then
            return false
        end
    end
    return true
end

while not table_equals(start, stop) do
    counter = counter + 1
    -- print(table.concat(start))
    for i = 1, n do
        local old = start[i]
        start[i] = convert[old]
        if not (old == "T") then
            break
        end
    end
end

print(string.format("Number of generated k-mers: %d - took: %dms", counter, os.clock() * 1000))
