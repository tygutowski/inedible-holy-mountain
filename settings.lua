dofile("data/scripts/lib/mod_settings.lua")

function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "inedible_holy_mountain"
mod_settings_version = 1
mod_settings = 
{
	{
		id = "_",
		ui_name = "Which enemies should not be allowed to eat the holy mountain?",
		not_setting = true,
	},
	{
		category_id = "lukkis",
		ui_name = "LUKKI",
		settings = {
			{
				id = "lukki",
				ui_name = "Lukki (Spider)",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "lukki_dark",
				ui_name = "Kammolukki (Toothy Spider)",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
	{
		category_id = "worms",
		ui_name = "WORMS",
		settings = {
			{
				id = "worm",
				ui_name = "Mato (Worm)",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "worm_big",
				ui_name = "Jättimato (Giant Worm)",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "worm_end",
				ui_name = "Helvetinmato (End Worm)",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
