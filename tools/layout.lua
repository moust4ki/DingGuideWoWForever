-- Where the mocked widgets of tools/wow_mock.lua stand, from their anchors: rectangles for the
-- layout tests (nothing overlaps, everything inside its row). A region's size is its own; a
-- text without a width takes its measured width, without a height its lines' height; a
-- scroll child sits at its scroll frame's top left. Units are the window's: a frame's scale is
-- not applied, so compare regions of one window. Rectangles: { left, right, top, bottom },
-- y going up as in the game.
local Layout = {}

local X = { TOPLEFT = "left", LEFT = "left", BOTTOMLEFT = "left", TOPRIGHT = "right", RIGHT = "right",
    BOTTOMRIGHT = "right", TOP = "center", CENTER = "center", BOTTOM = "center" }
local Y = { TOPLEFT = "top", TOP = "top", TOPRIGHT = "top", BOTTOMLEFT = "bottom", BOTTOM = "bottom",
    BOTTOMRIGHT = "bottom", LEFT = "center", CENTER = "center", RIGHT = "center" }

local function size(r)
    local w, h = r:GetWidth(), r:GetHeight()
    if r.kind == "FontString" then
        if w == 0 then w = r:GetStringWidth() end
        if h == 0 then h = r:GetStringHeight() end
    end
    return w, h
end

local function at(rect, xPart, yPart)
    local x = xPart == "left" and rect.left or xPart == "right" and rect.right or (rect.left + rect.right) / 2
    local y = yPart == "top" and rect.top or yPart == "bottom" and rect.bottom or (rect.top + rect.bottom) / 2
    return x, y
end

-- The region's rectangle, or nil when it is not placed.
function Layout.rect(r, path)
    if r == UIParent then return { left = 0, right = 1024, top = 768, bottom = 0 } end
    path = path or {}
    assert(not path[r], "anchor loop")
    path[r] = true
    local w, h = size(r)
    local points = r.points or {}
    local result
    if #points == 0 then
        local parent = r.parent
        if parent and parent.scrollChild == r then
            local p = Layout.rect(parent, path)
            if p then
                local top = p.top + (parent.scroll or 0)
                result = { left = p.left, right = p.left + w, top = top, bottom = top - h }
            end
        end
    else
        local xs, ys = {}, {}
        for _, point in ipairs(points) do
            local rel = Layout.rect(point[2] or r.parent, path)
            if not rel then
                path[r] = nil
                return nil
            end
            local relPoint = point[3] or point[1]
            local x, y = at(rel, X[relPoint], Y[relPoint])
            xs[X[point[1]]] = x + point[4]
            ys[Y[point[1]]] = y + point[5]
        end
        local left, right, top, bottom
        if xs.left and xs.right then left, right = xs.left, xs.right
        elseif xs.left then left, right = xs.left, xs.left + w
        elseif xs.right then left, right = xs.right - w, xs.right
        elseif xs.center then left, right = xs.center - w / 2, xs.center + w / 2 end
        if ys.top and ys.bottom then top, bottom = ys.top, ys.bottom
        elseif ys.top then top, bottom = ys.top, ys.top - h
        elseif ys.bottom then top, bottom = ys.bottom + h, ys.bottom
        elseif ys.center then top, bottom = ys.center + h / 2, ys.center - h / 2 end
        if left and top then result = { left = left, right = right, top = top, bottom = bottom } end
    end
    path[r] = nil
    return result
end

-- What a text covers: its letters, placed as it is justified in its width; a frame or a
-- texture, its rectangle.
function Layout.ink(r)
    local rect = Layout.rect(r)
    if not rect or r.kind ~= "FontString" then return rect end
    local width = math.min(r:GetStringWidth(), rect.right - rect.left)
    local justify = r.justifyH or "CENTER"
    if justify == "LEFT" then
        rect.right = rect.left + width
    elseif justify == "RIGHT" then
        rect.left = rect.right - width
    else
        local center = (rect.left + rect.right) / 2
        rect.left, rect.right = center - width / 2, center + width / 2
    end
    return rect
end

-- Shown, its parents too, and for a text, something written.
function Layout.visible(r)
    if r.kind == "FontString" and (r:GetText() or "") == "" then return false end
    local p = r
    while p and p ~= UIParent do
        if not p:IsShown() then return false end
        p = p.parent
    end
    return true
end

local EPSILON = 0.01

-- The two rectangles share some area (touching edges do not count).
function Layout.overlap(a, b)
    return a.left < b.right - EPSILON and b.left < a.right - EPSILON
        and a.bottom < b.top - EPSILON and b.bottom < a.top - EPSILON
end

-- a lies within b.
function Layout.inside(a, b)
    return a.left >= b.left - EPSILON and a.right <= b.right + EPSILON
        and a.bottom >= b.bottom - EPSILON and a.top <= b.top + EPSILON
end

-- The problems of a row: two of its parts overlap, or one leaves it. parts: { name = region }
-- (nil or hidden ones are left out). Returns a list of messages.
function Layout.check(row, parts)
    local problems = {}
    local box = Layout.rect(row)
    if not box then return { "the row is not placed" } end
    local shown, names = {}, {}
    for name, region in pairs(parts) do
        if region and Layout.visible(region) then
            local rect = Layout.ink(region)
            if not rect then
                problems[#problems + 1] = name .. " is not placed"
            else
                shown[name] = rect
                names[#names + 1] = name
            end
        end
    end
    table.sort(names)
    local function show(rect) return ("%.0f-%.0f"):format(rect.left - box.left, rect.right - box.left) end
    for i, a in ipairs(names) do
        if not Layout.inside(shown[a], box) then
            problems[#problems + 1] = ("%s (%s) leaves the row (0-%.0f)"):format(a, show(shown[a]), box.right - box.left)
        end
        for j = i + 1, #names do
            local b = names[j]
            if Layout.overlap(shown[a], shown[b]) then
                problems[#problems + 1] = ("%s (%s) overlaps %s (%s)"):format(a, show(shown[a]), b, show(shown[b]))
            end
        end
    end
    return problems
end

return Layout
