#define PLUGIN_NAME "give ammo on pickup"
#define PLUGIN_AUTHOR "unknown"
#define PLUGIN_DESCRIPTION "Gives ammo to player on item pickup or when using `sm_gammo`."
#define PLUGIN_VERSION "0.1"
#define PLUGIN_URL "none"

public Plugin:myinfo = 
{
	name = PLUGIN_NAME, 
	author = PLUGIN_AUTHOR,
	description = PLUGIN_DESCRIPTION, 
	version = PLUGIN_VERSION, 
	url = PLUGIN_URL
};

public OnPluginStart()
{
	HookEvent("item_pickup", item_pickup, EventHookMode:1);
	RegAdminCmd("sm_gammo", sm_gammo, 16384, "", "", 0);
}

public Action:sm_gammo(client, args)
{
	PrintToChat(client, "Giving ammo.");
	CreateTimer(1.0, giveammo, client, 0);
	return Plugin_Continue;
}

public Action:item_pickup(Handle:event, String:event_name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	CreateTimer(1.0, giveammo, client, 0);
	return Plugin_Continue;
}

public Action:giveammo(Handle:hTimer, any:client)
{
	new flags = GetCommandFlags("give");
	SetCommandFlags("give", flags & -16385);
	FakeClientCommand(client, "give ammo");
	SetCommandFlags("give", flags | 16384);
	return Plugin_Continue;
}
