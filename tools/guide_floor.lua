-- The floor a guide note names (step key `floor`, docs/guide-packs.md): "up" (one floor up,
-- upstairs, a balcony, an upper level), "top" (the highest floor of a tower or a building, a
-- top deck), "down" (a lower floor or level, a cellar, a crypt below ground). Positions are flat in the game: the note is the only place
-- that says it. tools/write_leveling.lua writes the key from the route's notes, and
-- tools/check_guides.lua warns when a note says a floor that its step's key does not.
-- An explicit table of English phrases, nothing guessed: a note that names two floors, or
-- several ("Check each of the two floors"), gets none.
local M = {}

M.VALUES = { up = true, top = true, down = true }

-- Phrases, lowercase, found as they are in the note.
M.PHRASES = {
    up = {
        "one floor up",
        "upstairs, out on the balcony",
        "upstairs in the",
        "trainer of darnassus, upstairs",
        "upper floor of the cavern",
        "on an upper floor of",
        "waits on the upper floor of",
        "upper-floor terrace",
        "a floor above the entrance",
        "on the tower's middle floor",
        "at the tower's upper level",
        "climb to the cave's upper level",
        "on undercity's upper level",
        "on the raised deck",
    },
    top = {
        "highest floor",
        "on the top floor of",
        "at the top of the wizard's sanctum",
        "at the top of his tower",
        "up on the boat's top deck",
    },
    down = {
        "lower floor of the hollow tree",
        "on the crypt's lower floor",
        "deep in the cave, on its lowest floor",
        "on the building's lowest floor",
        "in the cellar of the",
        "in the cellar of si:7",
        "on the lower level, indoors",
        "head to the lower level of the cavern",
        "on the lower level within the bridge",
        "go to the lowest deck of the",
        "in the crypt under the building",
        "down the stairs of the slaughtered lamb's crypt",
        "in the slaughtered lamb's crypt",
    },
}

-- A note with one of these names more than one floor, or a floor that may not be the one:
-- no key.
M.AMBIGUOUS = {
    "two floors", "upper and lower", "as well", "several floors", "floor by floor", "if absent",
    "one of them", "one level over", "mostly",
}

-- The floor `note` names ("up", "top", "down"), or nil (none, several, or not for sure).
function M.of(note)
    if type(note) ~= "string" then return nil end
    local text = note:lower()
    for _, phrase in ipairs(M.AMBIGUOUS) do
        if text:find(phrase, 1, true) then return nil end
    end
    local found
    for _, value in ipairs({ "up", "top", "down" }) do
        for _, phrase in ipairs(M.PHRASES[value]) do
            if text:find(phrase, 1, true) then
                if found and found ~= value then return nil end
                found = value
            end
        end
    end
    return found
end

return M
