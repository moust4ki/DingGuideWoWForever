-- Services around the player: vendors, repairers, innkeepers, flight masters and the
-- player's own class trainers, from QuestieDB's NPC flags (Core/Data.lua), only those of the
-- player's side (or neutral). Service steps point the arrow to the nearest ones; the
-- service finder lists them.
local _, Ding = ...
local Compat = Ding.Compat

local S = {}
Ding.Services = S

S.KINDS = { "vendor", "repair", "innkeeper", "flight", "trainer" }

local FACTION_LETTER = { Alliance = "A", Horde = "H" }

-- Open to the player's side: "AH" (neutral) or the player's letter.
local function forPlayer(friendly)
    local letter = FACTION_LETTER[UnitFactionGroup("player")]
    return type(friendly) == "string" and letter ~= nil and friendly:find(letter, 1, true) ~= nil
end

local points = {}   -- [npc] = its spawns with their world position (session cache)

local function spawnsOf(npc)
    local list = points[npc]
    if not list then
        list = Ding.Data:NpcPoints(npc)
        for _, p in ipairs(list) do
            local c, wx, wy = Compat.MapToWorld(p.map, p.x, p.y)
            p.continent, p.wx, p.wy = c or false, wx, wy
        end
        points[npc] = list
    end
    return list
end
S.SpawnsOf = spawnsOf

-- The world positions are computed again (another database, another map of the world).
function S:Reset() points = {} end

-- NPC ids of a kind open to the player; "trainer" is the player's own class.
function S:Npcs(kind)
    local all = Ding.Data:Services()
    local ids = kind == "trainer" and (all.trainer[Compat.PlayerClass()] or {}) or (all[kind] or {})
    local out = {}
    for _, npc in ipairs(ids) do
        if forPlayer(Ding.Data:NpcFriendly(npc)) then out[#out + 1] = npc end
    end
    return out
end

-- The nearest NPCs of a kind on the player's continent: { { npc, name, point, distance } },
-- nearest first, `max` at most.
function S:Nearest(kind, max)
    local continent, px, py = Compat.GetPlayerWorld()
    local found = {}
    if not continent then return found end
    for _, npc in ipairs(self:Npcs(kind)) do
        local best, bestD
        for _, p in ipairs(spawnsOf(npc)) do
            if p.continent == continent and p.wx then
                local d = (p.wx - px) ^ 2 + (p.wy - py) ^ 2
                if not bestD or d < bestD then best, bestD = p, d end
            end
        end
        if best then
            found[#found + 1] = { npc = npc, name = Ding.Data:NpcName(npc), point = best, distance = math.sqrt(bestD) }
        end
    end
    table.sort(found, function(a, b) return a.distance < b.distance end)
    while #found > (max or #found) do table.remove(found) end
    return found
end

-- Service a step asks for: "train" -> trainer, "vendor", "repair", "fly" -> flight master.
local STEP_KINDS = { train = "trainer", vendor = "vendor", repair = "repair", fly = "flight" }

function S:StepKind(step)
    for key, kind in pairs(STEP_KINDS) do
        if step[key] then return kind end
    end
    return nil
end

-- Points of the nearest NPCs a service step needs (the arrow takes the nearest).
function S:StepPoints(step, max)
    local kind = self:StepKind(step)
    if not kind then return {} end
    local out = {}
    for _, n in ipairs(self:Nearest(kind, max or 3)) do out[#out + 1] = n.point end
    return out
end
