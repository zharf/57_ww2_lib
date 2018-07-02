if (KP_liberation_arsenalUsePreset) then {
	private ["_virtualCargo", "_virtualWeapons", "_virtualMagazines", "_virtualItems", "_virtualBackpacks"];
	_virtualCargo = [] call LARs_fnc_addAllVirtualCargo;
	_virtualWeapons = [];
	_virtualMagazines = [];
	_virtualItems = [];
	_virtualBackpacks = [];
	KP_liberation_allowed_items = [];

	if (isNil "GRLIB_arsenal_weapons") then {GRLIB_arsenal_weapons = []};
	if (isNil "GRLIB_arsenal_magazines") then {GRLIB_arsenal_magazines = []};
	if (isNil "GRLIB_arsenal_items") then {GRLIB_arsenal_items = []};
	if (isNil "GRLIB_arsenal_backpacks") then {GRLIB_arsenal_backpacks = []};
	if (isNil "blacklisted_from_arsenal") then {blacklisted_from_arsenal = []};

	_items = GRLIB_arsenal_weapons + GRLIB_arsenal_magazines + GRLIB_arsenal_items + GRLIB_arsenal_backpacks;
	if (count _items == 0) then { _items = true; };
	[liberation_arsenal, _items, false] call ace_arsenal_fnc_initBox;
	[liberation_arsenal, blacklisted_from_arsenal] call ace_arsenal_fnc_removeVirtualItems;
	(liberation_arsenal getVariable "ace_arsenal_virtualItems") select 2 append ["LIB_R_88m_RPzB", "LIB_1Rnd_RPzB"];
} else {
	[missionNamespace, true] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace, true] call BIS_fnc_addVirtualMagazineCargo;
	[missionNamespace, true] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace, true] call BIS_fnc_addVirtualBackpackCargo;
};
