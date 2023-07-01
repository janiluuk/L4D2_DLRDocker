<?php

/****************************************************************************

   LEFT 4 DEAD (2) PLAYER STATISTICS ©2019-2020 PRIMEAS.DE
   BASED ON THE PLUGIN FROM MUUKIS MODIFIED BY FOXHOUND FOR SOURCEMOD

 - https://forums.alliedmods.net/showthread.php?p=2678290#post2678290
 - https://www.primeas.de/

****************************************************************************/

// MySQL DATA
$mysql_server = "mysql";
$mysql_db = "l4dstats";
$mysql_user = "mysql";
$mysql_password = "mysql";
$mysql_tableprefix = "";

// SITE SETTINGS
$site_name = "Servers / Statistics"; // Clan Name
$site_url = "#"; // Clan url
$site_style = "dark-blue"; // Site Style
$site_game = "Left 4 Dead 2"; // Site Game
$site_statsurl = "#"; // Site Stats URL
$site_description = "Do you like to play Left 4 Dead 2? Our servers have no ads, no tricks, no conservatives. Only screwed up version of the game, realtime statistics, live broadcasting and lot of nice players."; // Site Description
$site_keywords = "left 4 dead 2, left4dead2, l4d2, survivor, survival horror, apocalypse, online gaming, multiplayer, dlr, deadlandrage yani da bunny"; // Site Keywords

// SITE LOGO
$site_logo = ""; //_source/images/logo.png"; // Logo Image URL - Options: Empty for only Clan Name
$site_logo_height = "60"; // Logo Image Height
$site_logo_width = "325"; // Logo Image Width

// COMMUNITY SETTINGS
$site_steamgroup = "https://steamcommunity.com/groups/DLRGaming"; // Steamhttps://steamcommunity.com/groups/DLRGaming/discussionsgroup URL
$site_welcome = "Turn on your mic, turn off your lights and <b>enjoy the ride</b>!"; // Welcome Mess
$site_welcome_intro = "";
// https://www.xevanio.de/en/projects/l4d-l4d2/customplayerstatsv14B121-modern/l4d2_teaser.mp4"; // Welcome Intro Movie URL - Empty for only Welcome Message

// PLUGIN SETTING
$top3_site = "enabled"; // Top3 Ranking - Options: enabled, disabled

// Gameserver
$gameserver = "enabled"; // Gameserver Page - Options: enabled, disabled
$server1_ip = "l4d2"; $server1_port = "27015"; // Server 1 - IP:PORT
$server2_ip = "";$server2_port = ""; // Server 2 - IP:PORT
$server3_ip = "";$server3_port = ""; // Server 3 - IP:PORT
$server4_ip = "";$server4_port = ""; // Server 4 - IP:PORT
$server5_ip = "";$server5_port = ""; // Server 5 - IP:PORT
$server6_ip = "";$server6_port = ""; // Server 6 - IP:PORT
$server7_ip = "";$server7_port = ""; // Server 7 - IP:PORT
$server8_ip = "";$server8_port = ""; // Server 8 - IP:PORT
$server9_ip = "";$server9_port = ""; // Server 9 - IP:PORT
$server10_ip = "";$server10_port = ""; // Server 10 - IP:PORT
$server11_ip = "";$server11_port = ""; // Server 11 - IP:PORT
$server12_ip = "";$server12_port = ""; // Server 12 - IP:PORT
$server13_ip = "";$server13_port = ""; // Server 13 - IP:PORT
$server14_ip = "";$server14_port = ""; // Server 14 - IP:PORT
$server15_ip = "";$server15_port = ""; // Server 15 - IP:PORT

// YOUTUBE PLAYER
$youtube = "enabled"; // Youtube - Options: enabled, disabled
$youtube_title = "Youtube Player"; // Youtube Title Name
$yt_movie1_embed = "4KA9YSkM7VE"; // Youtube Movie 1 Embed Code
$yt_movie1_title = "Left 4 Dead 2: Intro (Full HD)"; // Youtube Movie 1 Title
$yt_movie2_embed = "Pn7NeE83418"; // Youtube Movie 2 Embed Code
$yt_movie2_title = "Left 4 Dead 2: Dead Center #1 - Full Campaign (Full HD)"; // Youtube Movie 2 Title
$yt_movie3_embed = "KWubAsMwRz4"; // Youtube Movie 3 Embed Code
$yt_movie3_title = "Left 4 Dead 2: Dark Carnival #2 - Full Campaign (Full HD)"; // Youtube Movie 3 Title
$yt_movie4_embed = "qUDUsq9Vzy4"; // Youtube Movie 4 Embed Code
$yt_movie4_title = "Left 4 Dead 2: Swamp Fever #3 - Full Campaign (Full HD)"; // Youtube Movie 4 Title
$yt_movie5_embed = "strvCrGZKUg"; // Youtube Movie 5 Embed Code
$yt_movie5_title = "Left 4 Dead 2: Hard Rain #4 - Full Campaign (Full HD)"; // Youtube Movie 5 Title
$yt_movie6_embed = "Btv51AOzAYw"; // Youtube Movie 6 Embed Code
$yt_movie6_title = "Left 4 Dead 2: The Parish #5 - Full Campaign (Full HD)"; // Youtube Movie 6 Title
$yt_movie7_embed = "vkHV3mdE65I"; // Youtube Movie 7 Embed Code
$yt_movie7_title = "Left 4 Dead 2: The Passing #6 - Full Campaign (Full HD)"; // Youtube Movie 7 Title
$yt_movie8_embed = "BAS7K3L6vks"; // Youtube Movie 8 Embed Code
$yt_movie8_title = "Left 4 Dead 2: The Sacrifice #7 - Full Campaign (Full HD)"; // Youtube Movie 8 Title
$yt_movie9_embed = "A4IK4C-j8X0"; // Youtube Movie 9 Embed Code
$yt_movie9_title = "Left 4 Dead 2: No Mercy #8 - Full Campaign (Full HD)"; // Youtube Movie 9 Title
$yt_movie10_embed = "gUGJbs_RCw0"; // Youtube Movie 10 Embed Code
$yt_movie10_title = "Left 4 Dead 2: Crash Course #9 - Full Campaign (Full HD)"; // Youtube Movie 10 Title
$yt_movie11_embed = "Su6P_rdLIM8"; // Youtube Movie 11 Embed Code
$yt_movie11_title = "Left 4 Dead 2: Death Toll #10 - Full Campaign (Full HD)"; // Youtube Movie 11 Title
$yt_movie12_embed = "CXDuINVjsAI"; // Youtube Movie 12 Embed Code
$yt_movie12_title = "Left 4 Dead 2: Dead Air #11 - Full Campaign (Full HD)"; // Youtube Movie 12 Title
$yt_movie13_embed = "j0UzDX38bAI"; // Youtube Movie 13 Embed Code
$yt_movie13_title = "Left 4 Dead 2: Blood Harvest #12 - Full Campaign (Full HD)"; // Youtube Movie 13 Title
$yt_movie14_embed = "0cEK5YXdDjI"; // Youtube Movie 14 Embed Code
$yt_movie14_title = "Left 4 Dead 2: Cold Stream #13 - Full Campaign (Full HD)"; // Youtube Movie 14 Title
$yt_movie15_embed = "vjozkivYqxg"; // Youtube Movie 15 Embed Code
$yt_movie15_title = "Left 4 Dead 2: The Last Stand #14 - Full Campaign (Full HD)"; // Youtube Movie 15 Title

/*
==================== DO NOT CHANGE ====================
*/

$site_template = "./";
$population_file = "../_source/population.csv";
$population_minkills = 12619;
$award_file = "awards.en.php";
$award_l4d2_file = "awards.l4d2.en.php";
$award_minplaytime = 60;
$award_minpointstotal = 0;
$award_minkills = 100;
$award_minheadshots = 100;
$award_minpoints = 1000;
$award_display_players = 5;
$award_cache_refresh = 60;
$lastonlineformat = "M d, Y g:ia";
$showplayerflags = 1;
$game_version = 0;

/*
==================== DO NOT CHANGE ====================
*/

?>
