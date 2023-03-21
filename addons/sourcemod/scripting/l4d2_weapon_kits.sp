/**********Thanks To**************
* {7~11} TROLL for the original plugin
* CrimsonGt - helped {7~11} TROLL with give player item issues
*********************************/
#pragma semicolon 1
#include <sourcemod>

#define PLUGIN_VERSION "1.3.0"
#define KIT_OPTIONS_PATH "/gamedata/l4d2_weapon_kits.kits.cfg"
#define ITEM_NUMBER 43

new Handle:g_kits_enabled;
new Handle:g_max_kits;
new max_kit[MAXPLAYERS+1];

//Item related
new Handle:g_item_enabled;
new Handle:g_max_give[ITEM_NUMBER];
new give_quota[ITEM_NUMBER][MAXPLAYERS+1];
char item_names[][] = {
	"adrenaline", "defibrillator", "first_aid_kit", "pain_pills", "chainsaw", "pumpshotgun",
	"autoshotgun", "shotgun_chrome", "shotgun_spas", "pistol", "pistol_magnum",
	"hunting_rifle", "rifle", "rifle_ak47", "rifle_desert", "rifle_sg552", "smg", "smg_mp5",
	"smg_silenced", "sniper_awp", "sniper_military", "sniper_scout", "grenade_launcher",
	"fireworkcrate", "gascan", "molovtov", "oxygentank", "propanetank", "pipe_bomb",
	"vomitjar", "gnome", "upgradepack_incendiary", "upgradepack_explosive", "baseball_bat",
	"baseball_bat", "crowbar", "electric_guitar", "fireaxe", "frying_pan", "katana", "machete",
	"tonfa", "knife"
};

public Plugin:myinfo =  {
	name = "[L4D2] Weapon Kits",
	author = "Teddy Ruxpin, eyeonus",
	description = "Allows Clients To Get Weapons Packs and other items",
	version = PLUGIN_VERSION,
	url = "www.blacktusklabs.com"
}

public OnPluginStart() {
	//Open the Kit menu
	RegConsoleCmd("kit", KitMenu, "Choose a kit to give yourself.");
	g_kits_enabled = CreateConVar("sm__kits_enabled", "0", "Kits Menu Enabled", FCVAR_SPONLY|FCVAR_REPLICATED, true, 0.0, true, 1.0);
	
	//Open the original item menu
	RegConsoleCmd("goods", TankBusterMenu, "Choose an item to give yourself.");
	g_item_enabled = CreateConVar("sm_item_enabled", "0", "Item Menu Enabled", FCVAR_SPONLY|FCVAR_REPLICATED, true, 0.0, true, 1.0);
	
	//plugin version
	CreateConVar("l4d2_weapon_kits_version", PLUGIN_VERSION, "L4D2 Weapon Kits Version", FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);
	
	//Number of times a player can get a kit in a round.
	g_max_kits = CreateConVar("sm__max_kits", "-1", "Maximum number of kits per round. (-1 = unlimited)");
	
	//Number of times player can get an item per round
	for (new i = 0; i < ITEM_NUMBER; i++) {
		char temp[24];
		Format(temp, sizeof(temp), "sm_max_%s", item_names[i]);
		g_max_give[i] = CreateConVar(temp, "-1", "Maximum per round. (-1 = unlimited)");
	}
	
	//Execute or create cfg
	AutoExecConfig(true, "l4d2_weapon_kits");
	
	//Check for Kit config file, create default if none.
	char path[PLATFORM_MAX_PATH];
	BuildPath(Path_SM,path,PLATFORM_MAX_PATH,KIT_OPTIONS_PATH);
	if (!FileExists(path)) {
		KeyValues kv = new KeyValues("Kits");
		kv.JumpToKey("Frontline Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "rifle_ak47");
		kv.SetString("2", "pistol_magnum");
		kv.SetString("3", "pipe_bomb");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.JumpToKey("Demolition Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "katana");
		kv.SetString("2", "pipe_bomb");
		kv.SetString("3", "upgradepack_explosive");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.JumpToKey("Police Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "shotgun_spas");
		kv.SetString("2", "pistol");
		kv.SetString("3", "molotov");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.JumpToKey("Sniper Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "sniper_military");
		kv.SetString("2", "pistol_magnum");
		kv.SetString("3", "vomitjar");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.JumpToKey("Counter Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "rifle_SG552");
		kv.SetString("2", "knife");
		kv.SetString("3", "molotov");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.JumpToKey("Pyro Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "fireaxe");
		kv.SetString("2", "molotov");
		kv.SetString("3", "upgradepack_incendiary");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.JumpToKey("Hunting Kit", true);
		kv.SetNum("items", 4);
		kv.SetString("1", "hunting_rifle");
		kv.SetString("2", "knife");
		kv.SetString("3", "vomitjar");
		kv.SetString("4", "adrenaline");
		kv.Rewind();
		
		kv.ExportToFile(path);
	}
}

public Action:Event_round_start(Handle:event, const String:name[], bool:dontBroadcast) {
	//Get max clients on server
	new maxclients = MaxClients;
	
	//Sets initial quotas for every player
	for (new client = 1; client <= maxclients; client++) {
		max_kit[client] = GetConVarInt(g_max_kits);
		
		for (new i = 0; i < ITEM_NUMBER; i++) {
			give_quota[i][client] = GetConVarInt(g_max_give[i]);
		}
	}
}

public OnClientPutInServer(client) {
	//Sets initial quotas for the player just joined
	max_kit[client] = GetConVarInt(g_max_kits);
	
	for (new i = 0; i < ITEM_NUMBER; i++) {
		give_quota[i][client] = GetConVarInt(g_max_give[i]);
	}
}

public Action:TankBusterMenu(client,args) {
	if (GetClientTeam(client) == 2 && GetConVarBool(g_item_enabled)) { TankBuster(client); }
	return Plugin_Handled;
}

public Action:TankBuster(clientId) {
	new Handle:menu = CreateMenu(TankBusterMenuHandler);
	SetMenuTitle(menu, "TankBuster 2 Weapons Menu");
	AddMenuItem(menu, "option0", "Adrenaline");
	AddMenuItem(menu, "option1", "Defibrillator");
	AddMenuItem(menu, "option2", "First Aid Kit");
	AddMenuItem(menu, "option3", "Pain Pills");
	AddMenuItem(menu, "option4", "Chainsaw");
	AddMenuItem(menu, "option5", "Shotgun");
	AddMenuItem(menu, "option6", "Autoshotgun");
	AddMenuItem(menu, "option7", "Shotgun Chrome");
	AddMenuItem(menu, "option8", "Shotgun Spas");
	AddMenuItem(menu, "option9", "Pistol");
	AddMenuItem(menu, "option10", "Pistol Magnum");
	AddMenuItem(menu, "option11", "Hunting Rifle");
	AddMenuItem(menu, "option12", "Rifle M4 ");
	AddMenuItem(menu, "option13", "Rifle AK47");
	AddMenuItem(menu, "option14", "Rifle Desert");
	AddMenuItem(menu, "option15", "Rifle SG552");
	AddMenuItem(menu, "option16", "SMG");
	AddMenuItem(menu, "option17", "SMG MP5");
	AddMenuItem(menu, "option18", "SMG Silenced");
	AddMenuItem(menu, "option19", "Sniper AWP");
	AddMenuItem(menu, "option20", "Sniper Military");
	AddMenuItem(menu, "option21", "Sniper Scout");
	AddMenuItem(menu, "option22", "Grenade Launcher");
	AddMenuItem(menu, "option23", "Fireworkcrate");
	AddMenuItem(menu, "option24", "Gascan");
	AddMenuItem(menu, "option25", "Molotov");
	AddMenuItem(menu, "option26", "Oxygentank");
	AddMenuItem(menu, "option27", "Propanetank");
	AddMenuItem(menu, "option28", "Pipe Bomb");
	AddMenuItem(menu, "option29", "Vomit Jar");
	AddMenuItem(menu, "option30", "Gnome");
	AddMenuItem(menu, "option31", "Upgradepack Incendiary");
	AddMenuItem(menu, "option32", "Upgradepack Explosive");
	AddMenuItem(menu, "option33", "Baseball Bat * Only if level allows");
	AddMenuItem(menu, "option34", "Cricket Bat * Only if level allows");
	AddMenuItem(menu, "option35", "Crowbar * Only if level allows");
	AddMenuItem(menu, "option36", "Electric Guitar * Only if level allows");
	AddMenuItem(menu, "option37", "Fireaxe * Only if level allows");
	AddMenuItem(menu, "option38", "Frying Pan * Only if level allows");
	AddMenuItem(menu, "option39", "Katana * Only if level allows");
	AddMenuItem(menu, "option40", "Machete * Only if level allows");
	AddMenuItem(menu, "option41", "Tonfa * Only if level allows");
	AddMenuItem(menu, "option42", "Knife * Only if level allows");
	SetMenuExitButton(menu, true);
	DisplayMenu(menu, clientId, MENU_TIME_FOREVER);
}

public TankBusterMenuHandler(Handle:menu, MenuAction:action, client, itemNum) {
	new flags = GetCommandFlags("give");
	SetCommandFlags("give", flags & ~FCVAR_CHEAT);
	if (action == MenuAction_Select ) {
		if (give_quota[itemNum][client] > 0) {
			FakeClientCommand(client, "give %s", item_names[itemNum]);
			give_quota[itemNum][client]--;
			if (give_quota[itemNum][client] > 0) {
				PrintToChat(client, "\x00[SM] \x01You may obtain %d more %s this round",give_quota[itemNum][client], item_names[itemNum]);
			} else {
				PrintToChat(client, "\x00[SM] \x01You cannot obtain any more %s until next round", item_names[itemNum]);
			}
		} else {
			PrintToChat(client, "\x00[SM] \x01You cannot obtain any more %s until next round", item_names[itemNum]);
		}
	}
	SetCommandFlags("give", flags|FCVAR_CHEAT);
}

public Action:KitMenu(client, args) {
	if (GetClientTeam(client) == 2 && GetConVarBool(g_kits_enabled)) {
		Kit(client);
	}
	return Plugin_Handled;
}

public Action:Kit(clientId) {
	if (max_kit[clientId] == 0) {
		PrintToChat(clientId, "\x04[SM] \x01You cannot obtain any more kits until next round. %s", max_kit[clientId]);
	} else {
		new Handle:menu = CreateMenu(KitMenuHandler);
		
		char path[PLATFORM_MAX_PATH];
		BuildPath(Path_SM,path,PLATFORM_MAX_PATH,KIT_OPTIONS_PATH);
		KeyValues kit_options = new KeyValues("Kits");
		FileToKeyValues(kit_options, path);
		//kit_options.ImportFromFile(path);
		kit_options.GotoFirstSubKey();
		
		SetMenuTitle(menu, "Weapon Kits Menu");
		char menuItem[128];
		do {
			kit_options.GetSectionName(menuItem, 128);
			AddMenuItem(menu, menuItem, menuItem );
		}  while (kit_options.GotoNextKey());
		delete kit_options;
		
		SetMenuExitButton(menu, true);
		DisplayMenu(menu, clientId, MENU_TIME_FOREVER);
	}
}

public KitMenuHandler(Handle:menu, MenuAction:action, client, itemNum) {
	if (action == MenuAction_Select ) {
		if (max_kit[client] != 0) {
			char path[PLATFORM_MAX_PATH];
			BuildPath(Path_SM,path,PLATFORM_MAX_PATH,KIT_OPTIONS_PATH);
			KeyValues kit_options = new KeyValues("Kits");
			kit_options.ImportFromFile(path);
			kit_options.GotoFirstSubKey();
			
			if (itemNum) {
				for (new i = 0; i < itemNum; i++) {
					kit_options.GotoNextKey();
				}
			}
			
			new flags = GetCommandFlags("give");
			SetCommandFlags("give", flags & ~FCVAR_CHEAT);
			char item[128], itemName[128], command[128];
			for (int i = 0; i < kit_options.GetNum("items"); i++) {
				Format(item, 128, "%d", i+1);
				kit_options.GetString(item, itemName, 128);
				Format(command, 128, "give %s", itemName);
				FakeClientCommand(client, command);
			}
			
			SetCommandFlags("give", flags|FCVAR_CHEAT);
			delete kit_options;
			if (max_kit[client] > 0) {
				max_kit[client]--;
				PrintToChat(client, "\x04[SM] \x01You have %d kits remaining this round.", max_kit[client]);
			}
		}
	}
}
