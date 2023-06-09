sv_allow_lobby_connect_only 0
sv_steamgroup "3274135"
sv_pure "0"
sv_search_key "no-steam"
sv_tags "no-steam"
sv_consistency "0"                       // Whether the server enforces file consistency for critical files.
sv_contact ""
log on //Creates a logfile (on | off)
sv_logbans 1 //default 0;Log server bans in the server logs.
sv_logsdir logs //Folder in the game directory where server logs will be stored.

sv_maxcmdrate 100 //default 40; (If sv_mincmdrate is > 0), this sets the maximum value for cl_cmdrate. [cevo=101]
mp_disable_autokick "1"
// sm_cvar stringtable_alwaysrebuilddictionaries 1
//cvars for plugins with no .cfg file
sm_advertisements_interval "10"

sm_cvar survivor_max_incapacitated_count 10
sm_cvar l4d_vote_kick_immunity "1"
sm_cvar l4d_vote_alltalk_access "1"
sm_cvar sb_unstick 1

//Plugin cvars
sm_cvar survivor_allow_crawling "1"
sm_cvar survivor_crawl_speed "45"
sm_cvar grenadelauncher_radius_stumble 50
sm_cvar grenadelauncher_damage 700
sm_cvar sm_gun_cabinet_css 1

sm_cvar l4d2_charger_power "400.0"
sm_cvar l4d2_charger_power_push_limit "100"
sm_cvar l4d2_charger_power_damage "15"
sm_cvar l4d2_charger_power_remove "30"

l4d_cloud_damage_enabled "1"
l4d_cloud_damage_damage "7"
l4d_cloud_damage_time "6"
l4d_cloud_damage_radius "420"
l4d_cloud_damage_sound "player/survivor/voice/choke_5.wav"
l4d_cloud_meleeslow_enabled "1"
l4d_cloud_message_enabled "3"
l4d_cloud_shake_enabled "1"
l4d_cloud_blocks_revive "1"

sm_sb_specialattack 1
sm_sb_pukemove 1
sm_sb_chargetime 1
sm_sb_chargeexpire 30
sm_sb_explode 1
sm_sb_gravity "0.8"
sm_sb_hint 1

l4d2_jockeyjump_enable "1"
l4d2_jockeyjump_force "550.0"
l4d2_jockeyjump_delay "3.0"
l4d2_jockeyjump_rechargebar "1"

l4d_witch_changetarget "1"
l4d_witch_attack_range "450.0"
l4d_witch_chance_attacknext "100.0"
l4d_witch_chance_followsurvivor "0.0"
l4d_witch_range_vision "100.0"

l4d_recovery_hp_add "10"
l4d_recovery_hp_duration "10"
l4d_recovery_hp_limit "80"
l4d_recovery_hp_upgrade "1"

l4d_splash_damage_damage "10.0"
l4d_splash_damage_enabled "1"
l4d_splash_damage_notification "3"
l4d_splash_damage_radius "320"

l4d2_boomerbitchslap_announce "0"
l4d2_boomerbitchslap_cooldown "10.0"
l4d2_boomerbitchslap_enabled "1"
l4d2_boomerbitchslap_ledgeslap "1"
l4d2_boomerbitchslap_power "55.0"

l4d2_explosive_cars_burntime "0"
l4d2_explosive_cars_car_max_height "2500"
l4d2_explosive_cars_car_min_height "2500"
l4d2_explosive_cars_damage "200"
l4d2_explosive_cars_explosion_damage "1"
l4d2_explosive_cars_explosion_multiplier "35.67"
l4d2_explosive_cars_fire_multiplier "2.42"
l4d2_explosive_cars_fire_selfdamage "0"
l4d2_explosive_cars_health "2500"
l4d2_explosive_cars_infected "1"
l4d2_explosive_cars_inferno_count "2"
l4d2_explosive_cars_panic "1"
l4d2_explosive_cars_panic_chance "100"
l4d2_explosive_cars_power "500"
l4d2_explosive_cars_radius "420"
l4d2_explosive_cars_tank "0"
l4d2_explosive_cars_trace "25"
l4d2_explosive_cars_trace_interval "0.4"
l4d2_explosive_cars_unload "none"

l4d2_charger_attackdelay "0.0"
l4d2_charger_release_on "1"
l4d2_hunter_attackdelay "0.0"
l4d2_hunter_release_on "1"
l4d2_jockey_attackdelay "0.0"
l4d2_jockey_dismount_on "1"
l4d_si_ability_announce "0"
sm_cvar l4d_si_ability_announce "0"
sm_tankhp_gaugetype "1"

l4d_powerups_broadcast_on "1"
l4d_powerups_adren_give_on "0"
l4d_powerups_broadcast_type "1"
l4d_powerups_duration "30"
l4d_powerups_pills_give_on "0"
l4d_powerups_pills_luck "1"
l4d_powerups_plugin_on "1"
l4d_powerups_random_give_on "0"
l4d_powerups_use_on "1"
l4d_powerups_weaponfiring_rate "0.6667"
l4d_powerups_weaponmelee_rate "0.45"
l4d_powerups_weaponreload_rate "0.5714"

l4d_ghost_fly_speed "280"
l4d_ghost_fly "1"
l4d_ghost_max_speed "330"

ledge_drop_damage "2"
ledge_message "If you'd like to let go of this ledge press your CROUCH key."
ledge_min_hang_time "3.0"

//-->Hunter mods
sm_cvar z_hunter_health 525
sm_cvar z_hunter_max_pounce_bonus_damage 68
sm_cvar z_hunter_speed 275
sm_cvar z_hunter_claw_range 85
sm_cvar hunter_pz_claw_dmg 15

sm_cvar z_tank_health 4500

//-->Smoker mods
sm_cvar z_gas_health 450
sm_cvar tongue_allow_voluntary_release 1
sm_cvar z_gas_speed 280
sm_cvar tongue_break_from_damage_amount 300
sm_cvar tongue_choke_damage_amount 10
sm_cvar tongue_range 1450
sm_cvar tongue_victim_acceleration 400
sm_cvar tongue_victim_max_speed 400

//-->Boomer mods
sm_cvar z_exploding_health 50
sm_cvar z_exploding_splat_radius 280
sm_cvar z_vomit_interval 25
sm_cvar z_exploding_shove_max 99
sm_cvar z_exploding_shove_min 99

//-->Charger mods
sm_cvar z_charger_health 750
sm_cvar z_charge_interval 10
sm_cvar z_charge_duration 3
sm_cvar z_charge_start_speed 500
sm_cvar z_charger_pound_dmg 20

//-->Spitter mods
sm_cvar z_spitter_health 130
sm_cvar z_spitter_speed 250
sm_cvar spitter_pz_claw_dmg 5
sm_cvar z_spit_interval 15
sm_cvar z_spitter_limit 2

//-->Jockey mods
sm_cvar z_jockey_health 500
sm_cvar jockey_pz_claw_dmg 5
sm_cvar z_jockey_leap_again_timer 3
sm_cvar z_jockey_leap_range 250
sm_cvar z_jockey_ride_damage 6
sm_cvar z_jockey_speed 280

//-->Witch mods
sm_cvar music_dynamic_witch_alert_interval 0
sm_cvar cl_witch_glow_range 10
sm_cvar cl_witch_light_enable 1
sm_cvar z_witch_wander_hear_radius 10
sm_cvar z_witch_speed 400
sm_cvar z_witch_health 2000
sm_cvar z_witch_damage 150
sm_cvar z_witch_speed_inured 350

//-->Tank mods
sm_cvar z_frustration_timer 35
sm_cvar tank_throw_min_interval 0.8
sm_cvar tank_swing_range 75
sm_cvar vs_tank_damage 35
sm_cvar l4d_si_ability_cooldown_slap 10

sv_allowupload "1"
sv_allowdownload "1"
sv_downloadurl "http://yani.duckdns.org/l4dstats/content/"
mp_disable_autokick "0"
sv_lan "0"
sm_cvar mp_allowupload "1"
sv_voiceenable "1"
sm_cvar steamworks_immediate_upload 0
sm_cvar steamworks_stats_disable 0
mp_friendlyfire "0"

//friendly fire
sm_cvar survivor_friendly_fire_factor_gametypes_versus "0"
sm_cvar survivor_friendly_fire_factor_gamemode_versus "0"
sm_cvar survivor_friendly_fire_factor_easy "0"
sm_cvar survivor_friendly_fire_factor_normal "0"
sm_cvar survivor_friendly_fire_factor_hard "0"
sm_cvar survivor_friendly_fire_factor_expert "0"

sm_cvar allow_all_bot_survivor_team 1
sm_cvar sb_all_bot_game 1


//sm_cvar nb_assault "0"
sm_cvar sb_friend_immobilized_reaction_time_normal 0 // Default 2
sm_cvar sb_friend_immobilized_reaction_time_hard 0 // Default 1
sm_cvar sb_friend_immobilized_reaction_time_expert 0 // Default 0.5
sm_cvar sb_friend_immobilized_reaction_time_vs 0 // Default 0.5
sm_advertisements_interval "30"
sm_cvar survivor_incapacitated_accuracy_penalty 0
sm_cvar l4d_vote_kick_immunity "1"
sm_cvar l4d_vote_alltalk_access "1"
sm_cvar sv_alltalk "1"
sv_airaccelerate 0
mp_autoteambalance "0"
l4d_vts_enable "1"

sm_cvar vs_max_team_switches "999"
sm_cvar sv_gametypes "versus"
sm_cvar mp_gamemode "versus"

sm_cvar survivor_incapacitated_accuracy_penalty 0.2
sm_cvar survivor_allow_crawling "1"
sm_cvar survivor_crawl_speed "55"


/////////////////////////
//communication
////////////
sv_voiceenable 1 //default 1; enable/disable voice comm

/////////////////////////
//Bans
// execute banned.cfgs at server start. Optimally at launch commandline.
// Put writeip/wrtieid commands in the bottom of server.cfg AFTER banned.cfgs have loaded.
////////////
exec banned_user.cfg //loads banned users' ids
exec banned_ip.cfg //loads banned users' ips
writeip //Save the ban list to banned_ip.cfg.
writeid //Wrties a list of permanently-banned user IDs to banned_user.cfg.

exec autoexec.cfg

/////////////////////////
//Master server - "setmaster" - add/remove/enable/disable master servers
////////////
//Usage: setmaster
//setmaster add 68.232.163.125:27015
//setmaster add 192.168.1.1


/////////////////////////
//Network Tweaks - Increase network performance
////////////
rate 30000 //default 10000; Max bytes/sec the host can recieve data
sv_minrate 5000 //default "5000"; Min bandwidth rate allowed on server, 0 = unlimited
sv_maxrate 300000 //default "0"; Max bandwidth rate allowed on server, 0 = unlimited
sv_mincmdrate 20 //default 0; This sets the minimum value for cl_cmdrate. 0 = unlimited
//sv_maxcmdrate 33 //default 40; (If sv_mincmdrate is > 0), this sets the maximum value for cl_cmdrate. [cevo=101]
