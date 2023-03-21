//// Credits to DeathChaos25 for the fakezoey, This provided the framework for adawong
#pragma semicolon 1
#include <sourcemod>
#include <sceneprocessor>
#include <sdktools>

#define PLUGIN_VERSION "1.0"

public Plugin:myinfo =  {
	name = "AdaWong", 
	author = "Lux", 
	description = "Adds another survivor called AdaWong", 
	version = PLUGIN_VERSION, 
	url = "https://forums.alliedmods.net/showthread.php?p=2429012#post2429012"
}

static String:g_sSounds[][] = 
{
	"player/survivor/voice/adawong/youwontmind.mp3",
	"player/survivor/voice/adawong/youshouldputherdown.mp3",
	"player/survivor/voice/adawong/yourfriendshaving.mp3",
	"player/survivor/voice/adawong/yourdisc.mp3",
	"player/survivor/voice/adawong/yourastrange1.mp3",
	"player/survivor/voice/adawong/yourallherebecauesofme.mp3",
	"player/survivor/voice/adawong/youllreallyneedtowork.mp3",
	"player/survivor/voice/adawong/yep.mp3",
	"player/survivor/voice/adawong/wrongtree.mp3",
	"player/survivor/voice/adawong/worldtoburn.mp3",
	"player/survivor/voice/adawong/wooo.mp3",
	"player/survivor/voice/adawong/whyisitnothingstaysdead.mp3",
	"player/survivor/voice/adawong/whosfirst.mp3",
	"player/survivor/voice/adawong/wellthatmakesmyjob.mp3",
	"player/survivor/voice/adawong/well.mp3",
	"player/survivor/voice/adawong/watchoutforyourself.mp3",
	"player/survivor/voice/adawong/watchout.mp3",
	"player/survivor/voice/adawong/wannaplay.mp3",
	"player/survivor/voice/adawong/wait.mp3",
	"player/survivor/voice/adawong/understandem.mp3",
	"player/survivor/voice/adawong/tragic.mp3",
	"player/survivor/voice/adawong/timetosavetheday.mp3",
	"player/survivor/voice/adawong/thismightwork.mp3",
	"player/survivor/voice/adawong/thislookshandy.mp3",
	"player/survivor/voice/adawong/thisisgoingtorequire.mp3",
	"player/survivor/voice/adawong/thisisgettingnowhere.mp3",
	"player/survivor/voice/adawong/thisisagoodtime.mp3",
	"player/survivor/voice/adawong/thisisagoodexit.mp3",
	"player/survivor/voice/adawong/thinkaboutwhere.mp3",
	"player/survivor/voice/adawong/thestore.mp3",
	"player/survivor/voice/adawong/there.mp3",
	"player/survivor/voice/adawong/thatwasnotnice.mp3",
	"player/survivor/voice/adawong/thatwasapain.mp3",
	"player/survivor/voice/adawong/thatsit.mp3",
	"player/survivor/voice/adawong/thatcantberight.mp3",
	"player/survivor/voice/adawong/thanksforkeepingthembusy.mp3",
	"player/survivor/voice/adawong/teamworkisnot.mp3",
	"player/survivor/voice/adawong/talklater.mp3",
	"player/survivor/voice/adawong/sure.mp3",
	"player/survivor/voice/adawong/standaside.mp3",
	"player/survivor/voice/adawong/sorryboysnotime.mp3",
	"player/survivor/voice/adawong/sorry02.mp3",
	"player/survivor/voice/adawong/sorry01.mp3",
	"player/survivor/voice/adawong/Soooo.mp3",
	"player/survivor/voice/adawong/socalcalls.mp3",
	"player/survivor/voice/adawong/sobig.mp3",
	"player/survivor/voice/adawong/showsover.mp3",
	"player/survivor/voice/adawong/senselessdeat.mp3",
	"player/survivor/voice/adawong/seenghost.mp3",
	"player/survivor/voice/adawong/scream2.mp3",
	"player/survivor/voice/adawong/scream1.mp3",
	"player/survivor/voice/adawong/scream.mp3",
	"player/survivor/voice/adawong/savesomeforme.mp3",
	"player/survivor/voice/adawong/rip.mp3",
	"player/survivor/voice/adawong/returnkindness.mp3",
	"player/survivor/voice/adawong/restingeyes.mp3",
	"player/survivor/voice/adawong/really.mp3",
	"player/survivor/voice/adawong/readyornot.mp3",
	"player/survivor/voice/adawong/ready.mp3",
	"player/survivor/voice/adawong/raceison.mp3",
	"player/survivor/voice/adawong/powernap.mp3",
	"player/survivor/voice/adawong/poortan.mp3",
	"player/survivor/voice/adawong/planet.mp3",
	"player/survivor/voice/adawong/planb.mp3",
	"player/survivor/voice/adawong/pff03.mp3",
	"player/survivor/voice/adawong/pff02.mp3",
	"player/survivor/voice/adawong/pff01.mp3",
	"player/survivor/voice/adawong/perfect.mp3",
	"player/survivor/voice/adawong/perceptive1.mp3",
	"player/survivor/voice/adawong/perceptive.mp3",
	"player/survivor/voice/adawong/ooow.mp3",
	"player/survivor/voice/adawong/okay1.mp3",
	"player/survivor/voice/adawong/okay.mp3",
	"player/survivor/voice/adawong/noturningbacknow.mp3",
	"player/survivor/voice/adawong/notimeforgames.mp3",
	"player/survivor/voice/adawong/notime.mp3",
	"player/survivor/voice/adawong/nothingworth.mp3",
	"player/survivor/voice/adawong/no.mp3",
	"player/survivor/voice/adawong/newwhosfirst.mp3",
	"player/survivor/voice/adawong/morethingschange.mp3",
	"player/survivor/voice/adawong/monsterchase.mp3",
	"player/survivor/voice/adawong/mightcomeinhandy.mp3",
	"player/survivor/voice/adawong/meleeswing09.mp3",
	"player/survivor/voice/adawong/meleeswing08.mp3",
	"player/survivor/voice/adawong/meleeswing07.mp3",
	"player/survivor/voice/adawong/meleeswing06.mp3",
	"player/survivor/voice/adawong/meleeswing04.mp3",
	"player/survivor/voice/adawong/meleeswing03.mp3",
	"player/survivor/voice/adawong/maddogdown.mp3",
	"player/survivor/voice/adawong/lowerlevels.mp3",
	"player/survivor/voice/adawong/lookslikefun1.mp3",
	"player/survivor/voice/adawong/lookslikefun.mp3",
	"player/survivor/voice/adawong/letsgetthisstraight.mp3",
	"player/survivor/voice/adawong/keepingup.mp3",
	"player/survivor/voice/adawong/just1looseend.mp3",
	"player/survivor/voice/adawong/iwouldofhelpedyou.mp3",
	"player/survivor/voice/adawong/iwouldnotcount.mp3",
	"player/survivor/voice/adawong/itsthroughhere.mp3",
	"player/survivor/voice/adawong/isupposeihelp.mp3",
	"player/survivor/voice/adawong/isuggestwetakeit.mp3",
	"player/survivor/voice/adawong/ioweyouone.mp3",
	"player/survivor/voice/adawong/imsorrydidiwake.mp3",
	"player/survivor/voice/adawong/imightneedit.mp3",
	"player/survivor/voice/adawong/imgladthatsover.mp3",
	"player/survivor/voice/adawong/imalittlebusy.mp3",
	"player/survivor/voice/adawong/iliketodomore.mp3",
	"player/survivor/voice/adawong/ifyouwannawin.mp3",
	"player/survivor/voice/adawong/ifyournotgoing.mp3",
	"player/survivor/voice/adawong/idoughtit.mp3",
	"player/survivor/voice/adawong/icantjustletyoudrop.mp3",
	"player/survivor/voice/adawong/icantgetthoughhere.mp3",
	"player/survivor/voice/adawong/icanhandle.mp3",
	"player/survivor/voice/adawong/hurt08.mp3",
	"player/survivor/voice/adawong/hurt07.mp3",
	"player/survivor/voice/adawong/hurt06.mp3",
	"player/survivor/voice/adawong/hurt05.mp3",
	"player/survivor/voice/adawong/hurt04.mp3",
	"player/survivor/voice/adawong/hurt03.mp3",
	"player/survivor/voice/adawong/hurt02.mp3",
	"player/survivor/voice/adawong/hurt01.mp3",
	"player/survivor/voice/adawong/hurt00.mp3",
	"player/survivor/voice/adawong/huhrestingeyes.mp3",
	"player/survivor/voice/adawong/huhhhh.mp3",
	"player/survivor/voice/adawong/huhhh.mp3",
	"player/survivor/voice/adawong/huhh.mp3",
	"player/survivor/voice/adawong/huh.mp3",
	"player/survivor/voice/adawong/howmanymore.mp3",
	"player/survivor/voice/adawong/howclever.mp3",
	"player/survivor/voice/adawong/howaboutyoushow.mp3",
	"player/survivor/voice/adawong/housecleaning.mp3",
	"player/survivor/voice/adawong/hopeyouhavethestomach.mp3",
	"player/survivor/voice/adawong/hopethisiswha.mp3",
	"player/survivor/voice/adawong/hesangry.mp3",
	"player/survivor/voice/adawong/hereicome.mp3",
	"player/survivor/voice/adawong/here01.mp3",
	"player/survivor/voice/adawong/here.mp3",
	"player/survivor/voice/adawong/hangonkids1.mp3",
	"player/survivor/voice/adawong/hangon.mp3",
	"player/survivor/voice/adawong/handonkids.mp3",
	"player/survivor/voice/adawong/handlefire.mp3",
	"player/survivor/voice/adawong/gottakeepmoving.mp3",
	"player/survivor/voice/adawong/gooodastimeasany.mp3",
	"player/survivor/voice/adawong/goodluck.mp3",
	"player/survivor/voice/adawong/gomakeanimpression.mp3",
	"player/survivor/voice/adawong/gladthatsover.mp3",
	"player/survivor/voice/adawong/givemyregards.mp3",
	"player/survivor/voice/adawong/gettingold.mp3",
	"player/survivor/voice/adawong/gester1.mp3",
	"player/survivor/voice/adawong/gester.mp3",
	"player/survivor/voice/adawong/forme.mp3",
	"player/survivor/voice/adawong/followmylead.mp3",
	"player/survivor/voice/adawong/firstorder.mp3",
	"player/survivor/voice/adawong/expectme.mp3",
	"player/survivor/voice/adawong/exit.mp3",
	"player/survivor/voice/adawong/excuseme.mp3",
	"player/survivor/voice/adawong/everthesurvivor.mp3",
	"player/survivor/voice/adawong/dontgetthewrongidea.mp3",
	"player/survivor/voice/adawong/damit.mp3",
	"player/survivor/voice/adawong/crying.mp3",
	"player/survivor/voice/adawong/couldbebetter.mp3",
	"player/survivor/voice/adawong/closure.mp3",
	"player/survivor/voice/adawong/chainsaw.mp3",
	"player/survivor/voice/adawong/cannal.mp3",
	"player/survivor/voice/adawong/canchitchat.mp3",
	"player/survivor/voice/adawong/breath.mp3",
	"player/survivor/voice/adawong/bingo.mp3",
	"player/survivor/voice/adawong/betterholdontothis.mp3",
	"player/survivor/voice/adawong/bettergettothetower.mp3",
	"player/survivor/voice/adawong/backformore.mp3",
	"player/survivor/voice/adawong/back.mp3",
	"player/survivor/voice/adawong/aworldinchaos.mp3",
	"player/survivor/voice/adawong/ammo.mp3",
	"player/survivor/voice/adawong/alwaysdobetter.mp3",
	"player/survivor/voice/adawong/alright.mp3",
	"player/survivor/voice/adawong/almostthere.mp3",
	"player/survivor/voice/adawong/almost.mp3",
	"player/survivor/voice/adawong/adawong.mp3"
};


static const String:MODEL_ADAWONG[] = "models/survivors/survivor_adawong.mdl";

static const String:CONFIG_ADAWONG[] = "data/adawong.cfg";
static String:sSavedScene[64];

static bool:g_bAdaWongAntiSpam[MAXPLAYERS + 1];


public APLRes:AskPluginLoad2(Handle:myself, bool:late, String:error[], err_max)
{
	decl String:s_GameFolder[32];
	GetGameFolderName(s_GameFolder, sizeof(s_GameFolder));
	if (!StrEqual(s_GameFolder, "left4dead2", false))
	{
		strcopy(error, err_max, "This plugin is for Left 4 Dead 2 Only!");
		return APLRes_Failure;
	}
	return APLRes_Success;
}

public OnPluginStart()
{
	
}
public OnMapStart()
{
	PrecacheModel(MODEL_ADAWONG, true);
	
	for(new i = 0; i < sizeof(g_sSounds); i++)
      PrecacheSound(g_sSounds[i]);
}

public OnSceneStageChanged(scene, SceneStages:stage)
{
	if (stage != SceneStage_Started || GetSceneInitiator(scene) == SCENE_INITIATOR_PLUGIN)/* Do not capture scenes spawned by the plugin, to prevent a loop */
	{
		return;
	}
	
	new actor = GetActorFromScene(scene);
	if (IsAdaWong(actor))
	{		
		decl String:sceneFile[MAX_SCENEFILE_LENGTH];
		GetSceneFile(scene, sceneFile, sizeof(sceneFile));
		CancelScene(scene);
		
		if(g_bAdaWongAntiSpam[actor])
			return;
		
		ReplaceScene(sceneFile, "adawong");
		if (StrEqual(sSavedScene, "0", false))
			return;
		
		for(new x = 1; x <= 2; x++)
			EmitSoundToAll(sSavedScene, actor, SNDCHAN_AUTO, SNDLEVEL_NORMAL, SND_NOFLAGS, SNDVOL_NORMAL); //PerformSceneEx(actor, "", sSavedScene, 0.0, pitch); /* SCENE_INITIATOR_PLUGIN is default and does not need to be specified ############################Armonic replace this WITH EMITSOUNDTOALL*/
		
		g_bAdaWongAntiSpam[actor] = true;
		CreateTimer(2.0, VoiceDelay, actor, TIMER_FLAG_NO_MAPCHANGE);

	}
	switch (stage)
	{
		case SceneStage_Started:
		{
			new client = GetActorFromScene(scene);
			if (IsSurvivor(client))
			{
				decl String:vocalize[MAX_VOCALIZE_LENGTH];
				if (GetSceneVocalize(scene, vocalize, sizeof(vocalize)) != 0)
				{
					if (StrEqual(vocalize, "smartlook", false))
					{
						new target = GetClientAimTarget(client, true);
						if (IsAdaWong(target))
							CancelScene(scene);
					}
				}
			}
		}
	}
}

static ReplaceScene(String:sScene[], String:sCharacter[])
{
	decl String:sPath[PLATFORM_MAX_PATH];
	BuildPath(Path_SM, sPath, sizeof(sPath), "%s", CONFIG_ADAWONG);
	if (!FileExists(sPath))
	{
		PrintToChatAll("[AdaWong] Error: Cannot read the config %s", sPath);
		return;
	}
	// Get scenes from config
	new Handle:hFile = CreateKeyValues("scenes");
	if (!FileToKeyValues(hFile, sPath))
	{
		PrintToChatAll("[AdaWong] Error: Failed to get scenes from %s", sPath);
		CloseHandle(hFile);
		return;
	}
	// Check the character to get scene info from
	if (!KvJumpToKey(hFile, sCharacter))
	{
		PrintToChatAll("[AdaWong] Error: Failed to get character from %s", sPath);
		CloseHandle(hFile);
		return;
	}
	// Retrieve how many scenes for this character
	new maxscenes = KvGetNum(hFile, "max_scenes", 0);
	if (maxscenes == 0)
	{
		PrintToChatAll("[AdaWong] Error: Failed to get max_scenes from %s", sPath);
		CloseHandle(hFile);
		return;
	}
	// Get the scene replacement info
	decl String:sTemp[10], String:sSceneTemp[128];
	for (new i = 1; i <= maxscenes; i++)
	{
		IntToString(i, sTemp, sizeof(sTemp));
		if (KvJumpToKey(hFile, sTemp))
		{			
			KvGetString(hFile, "scene", sSceneTemp, sizeof(sSceneTemp));
			if (StrEqual(sScene, sSceneTemp, false))
			{
				KvGetString(hFile, "replace", sSavedScene, sizeof(sSavedScene));
				CloseHandle(hFile);
				return;
			}
			//if we are to the end of all the scenes
			if (i == maxscenes)
			{
				sSavedScene = "0";
			}
			KvGoBack(hFile);
		}
	}
	CloseHandle(hFile);
}

public Action:VoiceDelay(Handle:hTimer, any:iActor)
{
	g_bAdaWongAntiSpam[iActor] = false;
}

static bool:IsAdaWong(client)
{
	if (IsSurvivor(client))
	{
		new character = GetEntProp(client, Prop_Send, "m_survivorCharacter");
		if (character == 1)
		{
			decl String:model[64];
			GetEntPropString(client, Prop_Data, "m_ModelName", model, sizeof(model));
			if (StrEqual(model, MODEL_ADAWONG, false))
			{
				return true;
			}
		}
	}
	return false;
}

static bool:IsSurvivor(iClient)
{
	if (iClient < 1 || iClient > MaxClients || !IsClientInGame(iClient) || GetClientTeam(iClient) != 2)
		return false;
	
	return true;
}


