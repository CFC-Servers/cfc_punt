export CFCPunt
CFCPunt.isEnabled = CreateConVar "cfc_punt_enabled", 1, FCVAR_ARCHIVE, "Should enable CFC Punt", 0, 1

populatePanel = (panel) ->
    label = "Enable CFC Punt"
    panel\CheckBox label, "cfc_punt_enabled"

hook.Add "AddToolMenuCategories", "CFC_Punt_MenuCategory",  ->
    AddToolCategory "Options", "CFC", "CFC"

hook.Add "PopulateToolMenu", "CFC_Punt_MenuOption", ->
    AddToolMenuOption "Options", "CFC", "cfc_punt_enabled", "CFC Punt", "", "", (panel) ->
        populatePanel panel
