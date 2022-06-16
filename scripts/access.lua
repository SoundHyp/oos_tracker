function has(item)
  return Tracker:ProviderCountForCode(item) == 1
end

-- ALL CHECKS MARKED AS "HARD" IN THE RANDOMIZER ARE NOT USED HERE

-- WEIRD LOGIC CHECKS

-- Can farm Ore Chunks in Subrosia
function ore_chunks()
	return has("shovel") or 
	has("sword1") or 
	has("power1") or
	has("boomerang2")
end

-- Saves time on having to check for specific flutes in spots that simply need the flute
function any_flute()
	return has("flute")
end

function moosh()
	return has("flute") and has("natzu_moosh")
end
function ricky()
	return has("flute") and has("natzu_ricky")
end
function dimitri()
	return has("flute") and has("natzu_dimitri")
end


-- If you have any season, you have a rod!
function has_rod()
	return has("winter") or
	has("spring") or
	has("summer") or
	has("fall")
end

-- Can the player use a punch ring?
function punch()
	return has("ring_fist") or has("ring_expert")
end

-- Can the player harvest seeds?
-- Dimitri is not globally available for all trees so he's not here
function harvest_seeds()
	return use_seeds() and
	(has("sword1") or has_rod() or
	has("foolsore") or punch())
end

-- INTERACT RULES

function shoot_seeds()
	return has("slingshot1") or
	has("slingshot2")
end


function use_seeds()
	return has("satchel") or
	shoot_seeds()
end

function destroy_bush()
	return has("sword1") or
	has("boomerang2") or
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("galeseeds")) or
	has("power1") or
	has("bombs") or
	has("hook1") or
	has("cane")
end

function destroy_bush_flute()
	return destroy_bush() or any_flute()
end

function destroy_bush_limited()
	return has("bombs")
end

function destroy_pot()
	return has("sword2") or 
	has("power1") or
	has("hook1")
end 

function destroy_mushroom()
	return has("boomerang2") or 
	has("power1") or
	dimitri()
end 

function destroy_flower()
	return has("sword1") or 
	has("boomerang2")
end 

function destroy_crystal()
	return has("sword1") or 
	has("power1") or
	has("ring_expert")
end 

function destroy_bush_respawn()
	return has("sword1") or
	has("bombs") or
	has("foolsore")
end

function hit_lever()
	return has("sword1") or 
	has_rod() or
	has("shovel") or
	has("foolsore") or
	has("boomerang1") or
	has("boomerang2") or
	has("slingshot1") or
	(has("emberseeds") and use_seeds()) or
	(has("scentseeds") and use_seeds()) or
	punch()
end 

function hit_far_lever()
	return shoot_seeds() or
	has("boomerang2")
end 

function hit_far_lever_hard()
	return shoot_seeds() or
	has("boomerang1") or 
	(max_jump() >= 1 and
	(has("sword1") or any_rod() or has("foolsore")))
end

function hit_switch()
	return has("sword1") or 
	has_rod() or
	has("foolsore") or
	has("boomerang1") or
	use_seeds() or
	has("bombs") or
	has("shovel")
end

function hit_far_switch()
	return has("boomerang1") or
	has("bombs") or
	shoot_seeds() or
	(has("sword1") and (has("ring_energy") or has("roc1")))
end 

function max_jump()
	local j = 0
	
	if (has("roc2") and has("satchel") and has("pegasusseeds")) then
		j = 4
	elseif has("roc2") then
		j = 3
	elseif (has("roc1") and has("satchel") and has("pegasusseeds")) then
		j = 2
	elseif has ("roc1") then
		j = 1
	end
	
	return j
end 

function cross_water()
	return has("swim1") or
	max_jump() >= 1
end

function check_hint()
	return use_seeds() and has("mysteryseeds")
end

-- KILL RULES (order of appearance)

-- Generic damage check
function kill_normal()
	return has("sword1") or 
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds")) or
	(shoot_seeds() and has("galeseeds")) or
	has("foolsore") or
	has("ring_expert")
end
function kill_hard()
	if kill_normal() or
		(has("satchel") and has("scentseeds")) or
		(has("satchel") and has("galeseeds")) or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
-- Are these referenced ever?
function kill_stalfos()
	return kill_normal() or 
	has_rod()
end
function kill_stalfos_hard()
	return kill_hard() or 
	has_rod()
end

function kill_goriyabros()
	return has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("ring_expert")
end
function kill_goriyabros_hard()
	if kill_goriyabros() or 
		(has("satchel") and has("scentseeds")) or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
-- Referenced?
function kill_goriya()
	return kill_normal()
end

function kill_aquamentus()
	return has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore")
end
function kill_aquamentus_hard()
	if kill_aquamentus() or 
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
-- Referenced?
function kill_rope()
	return kill_normal()
end

function kill_hardhat_pit()
	return has("sword1") or 
	has("boomerang1") or
	has("shield") or
	has_rod() or
	(shoot_seeds() and (has("galeseeds") or has("scentseeds"))) or
	has("foolsore")
end
function kill_hardhat_pit_hard()
	if kill_hardhat_pit() or
		(has("satchel") and (has("galeseeds") or has("scentseeds"))) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_moblin_pit()
	return has("sword1") or 
	(use_seeds() and has("scentseeds")) or
	(shoot_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("galeseeds")) or
	has("foolsore") or
	(max_jump() >= 1 and kill_normal())
end
function kill_moblin_pit_hard()
	if kill_moblin_pit() or
	(max_jump() >= 1 and kill_hard()) or
	punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_facade()
	return has("bombs")
end

function kill_beetle()
	return (shoot_seeds() and has("galeseeds")) or
	((has("shield1") or has("shovel")) and
	(has("sword1") or 
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds")) or
	has("cane") or has("hook1")))
end
function kill_beetle_hard()
	return (use_seeds() and has("galeseeds")) or
	((has("shield1") or has("shovel")) and
	(has("sword1") or 
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds")) or
	has("cane") or
	(has("satchel") and has("scentseeds")) or
	has("bombs") or has("hook1")))
end

function kill_omuai()
	return has("power1") and
	(has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore"))
end
function kill_omuai_hard()
	if kill_omuai() or
		(has("power1") and
		has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("power1") and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_mothula()
	return has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore")
end
function kill_mothula_hard()
	if kill_mothula() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
-- Referenced?
function kill_shroudedstalfos()
	return kill_stalfos()
end

-- Referenced?
function kill_likelike()
	return kill_normal() or
	has("power1") or
	has_rod()
end

-- Referenced?
function kill_watertektite()
	return kill_normal()
end

function kill_agunima()
	return use_seeds() and has("emberseeds") and
	(has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("ring_expert"))
end
function kill_agunima_hard()
	if kill_agunima() or
		(has("emberseeds") and 
		((has("satchel") and has("scentseeds")) or
		punch())) then
		return true, AccessibilityLevel.Normal
	elseif has("emberseeds") and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

-- redundant
function kill_wizzrobe_cart()
	return kill_normal() or 
	has("shield1") or
	has_rod() or
	has("power1")
end

function kill_gohma()
	return (shoot_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds"))
end

function kill_moldorm()
	return has("sword1") or
	has("foolsore") or
	(shoot_seeds() and has("scentseeds")) or
	has("ring_expert")
end
function kill_moldorm_hard()
	if kill_moldorm() or
		(has("satchel") and has("scentseeds")) or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_ironmask()
	return has("sword1") or
	(use_seeds() and has("emberseeds")) or
	(use_seeds() and has("scentseeds")) or
	has("foolsore")
end
function kill_ironmask_hard()
	if kill_ironmask() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_armos()
	return has("sword1") or
	has("boomerang2") or
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore")
end
function kill_armos_hard()
	if kill_armos() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_gibdo()
	return kill_normal() or
	has("boomerang2") or
	has_rod()
end
function kill_gibdo_hard()
	return kill_gibdo() or
	kill_hard()
end

function kill_darknut()
	return has("sword1") or
	has("foolsore") or
	(shoot_seeds() and has("scentseeds"))
end
function kill_darknut_hard()
	if kill_darknut() or
	(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_darknut_pit()
	return kill_darknut() or
	has("shield1")
end
function kill_darknut_pit_hard()
	return kill_darknut_hard() or
	has("shield1")
end

function kill_syger()
	return has("sword1") or
	has("foolsore") or
	(shoot_seeds() and has("scentseeds"))
end
function kill_syger_hard()
	if kill_syger() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

--redundant-ish
function kill_digdogger()
	return has("magnet")
end

function kill_hardhat_magnet()
	return has("magnet") or
	(shoot_seeds() and has("galeseeds"))
end
function kill_hardhat_magnet_hard()
	return has("magnet") or
	(use_seeds() and has("galeseeds"))
end

function kill_vire()
	return has("sword1") or
	has("foolsore") or
	has("ring_expert")
end
function kill_vire_hard()
	if kill_vire() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_manhandla()
	return has("boomerang2") and
	(has("sword1") or
	shoot_seeds() or
	has("foolsore"))
end
function kill_manhandla_hard()
	if kill_manhandla() then
		return true, AccessibilityLevel.Normal
	elseif has("boomerang2") and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
-- Referenced?
function kill_wizzrobe()
	return kill_normal()
end

function kill_keese()
	return kill_normal() or
	has("boomerang1")
end

function kill_magunesu()
	return has("sword1") or
	has("foolsore") or
	has("ring_expert")
end

function kill_poe()
	return has("sword1") or
	(shoot_seeds() and has("scentseeds")) or
	(use_seeds() and has("emberseeds")) or
	has("foolsore")
end
function kill_poe_hard()
	if kill_poe() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_darknut_across()
	return (shoot_seeds() and has("scentseeds")) or
	has("magnet") or
	(has("sword1") and has("ring_energy")) or
	(has("roc2") and
	kill_darknut_pit())
end
function kill_darknut_across_hard()
	return (shoot_seeds() and has("scentseeds") or
	has("magnet")) or
	(has("roc2") and
	kill_darknut_pit_hard())
end

--redundant
-- Referenced?
function kill_wizzrobe_pit()
	return has("sword1") or
	has("shield1") or
	(use_seeds() and has("scentseeds")) or
	has_rod() or
	has("bombs") or
	has("foolsore")
end

-- Referenced?
function kill_stalfos_pit()
	return kill_normal() or 
	has("shield1") or
	(use_seeds() and has("scentseeds")) or
	has_rod() or
	has("bombs") or
	has("foolsore")
end

function kill_gleeok()
	return has("sword1") or
	has("foolsore") or
	has("ring_expert")
end
function kill_gleeok_hard()
	if kill_gleeok() or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_frypolar()
	return (shoot_seeds() and has("mysteryseeds") and
	has("power1")) or
	(shoot_seeds() and has("emberseeds"))
end
function kill_frypolar_hard()
	return kill_frypolar() or
	((has("satchel") and has("mysteryseeds") and
	has("power1")) or
	(has("satchel") and has("emberseeds")))
end

--redundant
-- Referenced?
function kill_polsvoice_pit()
	return has("sword1") or
	has("boomerang1") or
	has_rod() or
	(use_seeds() and has("scentseeds")) or
	(use_seeds() and has("galeseeds")) or
	has("bombs") or
	has("shield1") or
	has("foolsore") or
	has("flute")
end

function kill_medusahead()
	return has("sword1") or
	has("foolsore")
end
-- Referenced?
function kill_floormaster()
	return kill_normal()
end

function kill_onox()
	return has("sword1") and
	max_jump() >= 1
end
