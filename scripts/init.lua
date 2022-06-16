-- Load scripts required by this pack
ScriptHost:LoadScript("scripts/access.lua")
ScriptHost:LoadScript("scripts/area.lua")

-- Load items
Tracker:AddItems("items.json")

-- Load maps
Tracker:AddMaps("maps/maps.json")

--[[ 
	Tracker Loading Information

	Basic:
	Tracker:AddLocations("maps/normal/holodrum.json")
	Tracker:AddLocations("maps/normal/subrosia.json")
	Tracker:AddLocations("maps/normal/dungeons.json")

	Dungeon Shuffle:
	Tracker:AddLocations("maps/dungeon_shuffle/normal.json") -- Replaces Dungeons
	Tracker:AddLocations("maps/dungeon_shuffle/hard.json") -- Replaces Dungeons

	Cross Items:
	Nothing at this time

	Portal Shuffle:
	Tracker:AddLocations("maps/normal/portals.json")  -- Adds Portals to Map
	Tracker:AddLocations("maps/portal/normal.json")  -- Replaces Subrosia
--]]

-- Normal Logic
if Tracker.ActiveVariantUID == "standard" then
	Tracker:AddLocations("maps/normal/holodrum.json")
	Tracker:AddLocations("maps/normal/subrosia.json")
	Tracker:AddLocations("maps/normal/dungeons.json")
end

-- Hard Logic
if Tracker.ActiveVariantUID == "hard" then
	Tracker:AddLocations("maps/hard/holodrum.json")
	Tracker:AddLocations("maps/hard/subrosia.json")
	Tracker:AddLocations("maps/hard/dungeons.json")
end 

-- Dungeon Shuffle - Normal Logic
if Tracker.ActiveVariantUID == "dungeon_shuffle" then
	Tracker:AddLocations("maps/normal/holodrum.json")
	Tracker:AddLocations("maps/normal/subrosia.json")
	Tracker:AddLocations("maps/dungeon_shuffle/normal.json") -- Replaces Dungeons
end

-- Dungeon Shuffle - Hard Logic
if Tracker.ActiveVariantUID == "dungeon_shuffle_hard" then
	Tracker:AddLocations("maps/hard/holodrum.json")
	Tracker:AddLocations("maps/hard/subrosia.json")
	Tracker:AddLocations("maps/dungeon_shuffle/hard.json") -- Replaces Dungeons
end

-- Cross Items - Normal Logic
if Tracker.ActiveVariantUID == "cross_items" then
	Tracker:AddLocations("maps/hard/holodrum.json")
	Tracker:AddLocations("maps/hard/subrosia.json")
	Tracker:AddLocations("maps/normal/dungeons.json") -- Replaces Dungeons
end

-- Cross Items - Dungeon Shuffle
if Tracker.ActiveVariantUID == "cross_items_dungeon" then
	Tracker:AddLocations("maps/hard/holodrum.json")
	Tracker:AddLocations("maps/hard/subrosia.json")
	Tracker:AddLocations("maps/dungeon_shuffle/normal.json") -- Replaces Dungeons
end

-- Cross Items - Dungeon/Portal Shuffle
if Tracker.ActiveVariantUID == "cross_items_shuffle" then
	Tracker:AddLocations("maps/hard/holodrum.json")
	Tracker:AddLocations("maps/dungeon_shuffle/normal.json") -- Replaces Dungeons
	Tracker:AddLocations("maps/normal/portals.json")  -- Adds Portals to Map
	Tracker:AddLocations("maps/portal/normal.json")  -- Replaces Subrosia
end

-- Portal Shuffle - Normal Logic
if Tracker.ActiveVariantUID == "portal" then
	Tracker:AddLocations("maps/normal/holodrum.json")
	Tracker:AddLocations("maps/hard/dungeons.json")
	Tracker:AddLocations("maps/normal/portals.json")  -- Adds Portals to Map
	Tracker:AddLocations("maps/portal/normal.json")  -- Replaces Subrosia
end

-- Portal Shuffle - Dungeon Shuffle
if Tracker.ActiveVariantUID == "portal_shuffle" then
	Tracker:AddLocations("maps/hard/holodrum.json")
	Tracker:AddLocations("maps/dungeon_shuffle/normal.json") -- Replaces Dungeons
	Tracker:AddLocations("maps/normal/portals.json")  -- Adds Portals to Map
	Tracker:AddLocations("maps/portal/normal.json")  -- Replaces Subrosia
end