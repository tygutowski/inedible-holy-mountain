dofile_once("/mods/inedible_holy_mountain/settings.lua")
local nxml = dofile_once("mods/inedible_holy_mountain/lib/nxml.lua")

-- Materials
local materials_content = ModTextFileGetContent("data/materials.xml")
local materials_xml = nxml.parse(materials_content)

-- Add [inedible] tag to holy mountain brick
for elem in materials_xml:each_child() do
	if tostring(elem.attr.name):find("^templebrick") ~= nil then
		elem.attr.tags = "[inedible]"
	end
end
ModTextFileSetContent("data/materials.xml", tostring(materials_xml))
-- Adds [inedible] tag to the ignored_material_tag of the CellEaterComponent for burrowing enemies.
for i, setting in ipairs(mod_settings) do
	if setting.category_id == "lukkis" then
		for j, option in ipairs(setting.settings) do
			if option.id == "lukki" and option.value_default == true then
				-- Lukki
				local lukki_content = ModTextFileGetContent("data/entities/animals/lukki/lukki.xml")
				local lukki_xml = nxml.parse(lukki_content)
				lukki_xml:first_of("CellEaterComponent").attr.ignored_material_tag="[inedible]"
				ModTextFileSetContent("data/entities/animals/lukki/lukki.xml", tostring(lukki_xml))
			end
			if option.id == "lukki_dark" and option.value_default == true then
				-- Dark Lukki
				local lukki_dark_content = ModTextFileGetContent("data/entities/animals/lukki/lukki_dark.xml")
				local lukki_dark_xml = nxml.parse(lukki_dark_content)
				lukki_dark_xml:first_of("CellEaterComponent").attr.ignored_material_tag="[inedible]"
				ModTextFileSetContent("data/entities/animals/lukki/lukki_dark.xml", tostring(lukki_dark_xml))
			end
		end
	end
	if setting.category_id == "worms" then
		for j, option in ipairs(setting.settings) do
			if option.id == "worm" and option.value_default == true then
				-- Worm
				local worm_content = ModTextFileGetContent("data/entities/animals/worm.xml")
				local worm_xml = nxml.parse(worm_content)
				worm_xml:first_of("CellEaterComponent").attr.ignored_material_tag="[inedible]"
				ModTextFileSetContent("data/entities/animals/worm.xml", tostring(worm_xml))
			end
			if option.id == "worm_big" and option.value_default == true then
				-- Big Worm
				local worm_big_content = ModTextFileGetContent("data/entities/animals/worm_big.xml")
				local worm_big_xml = nxml.parse(worm_big_content)
				worm_big_xml:first_of("CellEaterComponent").attr.ignored_material_tag="[inedible]"
				ModTextFileSetContent("data/entities/animals/worm_big.xml", tostring(worm_big_xml))
			end
			if option.id == "worm_end" and option.value_default == true then
				-- Hell Worm
				local worm_end_content = ModTextFileGetContent("data/entities/animals/worm_end.xml")
				local worm_end_xml = nxml.parse(worm_end_content)
				worm_end_xml:first_of("CellEaterComponent").attr.ignored_material_tag="[inedible]"
				ModTextFileSetContent("data/entities/animals/worm_end.xml", tostring(worm_end_xml))
			end
		end
	end
end
