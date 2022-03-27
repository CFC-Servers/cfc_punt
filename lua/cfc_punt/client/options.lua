local AddToolCategory, AddToolMenuOption
do
  local _obj_0 = spawnmenu
  AddToolCategory, AddToolMenuOption = _obj_0.AddToolCategory, _obj_0.AddToolMenuOption
end
CFCPunt.isEnabled = CreateConVar("cfc_punt_enabled", 1, FCVAR_ARCHIVE, "Should enable CFC Punt", 0, 1)
local populatePanel
populatePanel = function(panel)
  local label = "Enable CFC Punt"
  return panel:CheckBox(label, "cfc_punt_enabled")
end
hook.Add("AddToolMenuCategories", "CFC_Punt_MenuCategory", function()
  return AddToolCategory("Options", "CFC", "CFC")
end)
return hook.Add("PopulateToolMenu", "CFC_Punt_MenuOption", function()
  return AddToolMenuOption("Options", "CFC", "cfc_punt_enabled", "CFC Punt", "", "", function(panel)
    return populatePanel(panel)
  end)
end)
