#include <sourcemod>
#include <tf2attributes>
#include <tf2>
#include <tf2_stocks>
#include <sdktools_functions>

public Plugin myinfo = 
{
	name = "[TF2] MvM Bot Upgrades",
	author = "Pyri",
	description = "Gives TFBots (Fake Clients) on RED team upgrades suitable for Mann Vs Machine.",
	version = "1.0",
	url = "N/A"
};

public void OnPluginStart() {
	CreateTimer(1.0, Timer_AddAttribsToWeapons, _, TIMER_REPEAT);
}

public Action Timer_AddAttribsToWeapons(Handle timer) {
	for (int i = 1; i < GetMaxClients(); i++)
		if (IsClientInGame(i) && TF2_GetClientTeam(i) == TFTeam_Red)  {
			int Primary = GetPlayerWeaponSlot(i, TFWeaponSlot_Primary);
			int Secondary = GetPlayerWeaponSlot(i, TFWeaponSlot_Secondary);
			int Melee = GetPlayerWeaponSlot(i, TFWeaponSlot_Melee);
			
			TF2Attrib_SetByName(Melee, "critboost on kill", 4.0);
			TF2Attrib_SetByName(Melee, "melee attack rate bonus", 0.6);
			TF2Attrib_AddCustomPlayerAttribute(i, "health regen", 10.0);
			TF2Attrib_AddCustomPlayerAttribute(i, "move speed bonus", 1.3);
			TF2Attrib_AddCustomPlayerAttribute(i, "increased jump height", 1.2);
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from bullets reduced", 0.25);
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from fire reduced", 0.25);
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from crit reduced", 0.1);
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from blast reduced", 0.25);
			TF2Attrib_AddCustomPlayerAttribute(i, "max health additive bonus", 150.0);
			
			switch (TF2_GetPlayerClass(i)) {
				case TFClass_Scout: {
					TF2Attrib_SetByName(Primary, "damage bonus", 2.0);
					TF2Attrib_SetByName(Primary, "ammo regen", 1.1);
					TF2Attrib_SetByName(Primary, "clip size bonus upgrade", 1.5);
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);
					TF2Attrib_SetByName(Primary, "Reload time decreased", 0.6);
					TF2Attrib_SetByName(Primary, "heal on kill", 20.0);
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 5.0);

					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 3.0);
					TF2Attrib_SetByName(Primary, "bullets per shot bonus", 1.25);
					TF2Attrib_SetByName(Primary, "scattergun knockback mult", 1.8);
					TF2Attrib_SetByName(Primary, "heal on hit for rapidfire", 5.0);
				}
				case TFClass_Soldier: {
					TF2Attrib_SetByName(Primary, "rocket specialist", 2.0);
					TF2Attrib_SetByName(Primary, "clip size upgrade atomic", 8.0);
					TF2Attrib_SetByName(Primary, "Projectile speed increased", 1.2);
				}
				case TFClass_Engineer: {
					TF2Attrib_SetByName(Melee, "engy sentry fire rate increased", 0.9);
					TF2Attrib_SetByName(Melee, "engy building health bonus", 1.25);
					TF2Attrib_SetByName(Melee, "engineer sentry build rate multiplier", 1.5);
					TF2Attrib_SetByName(Melee, "engy dispenser radius increased", 1.6);
					TF2Attrib_SetByName(Melee, "metal regen", 20.0);
					TF2Attrib_SetByName(Melee, "maxammo metal increased", 1.5);
					TF2Attrib_SetByName(Melee, "bidirectional teleport", 1.0);
				}
				case TFClass_Spy: {
					TF2Attrib_SetByName(Melee, "cloak consume rate decreased", 0.3);
				}
			}
			
			int Sandman = -1;
			while ((Sandman = FindEntityByClassname(Sandman, "TF_WEAPON_BAT_WOOD")) != -1)
			{
				if (i == GetEntPropEnt(Sandman, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(Sandman, "effect bar recharge rate increased", 0.25);
				}
			}
			
			int BuffBanner = -1;
			while ((BuffBanner = FindEntityByClassname(BuffBanner, "TF_WEAPON_BUFF_ITEM")) != -1)
			{
				if (i == GetEntPropEnt(BuffBanner, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(BuffBanner, "increase buff duration", 2.5);
				}
			}
			
			int LunchBox = -1;
			while ((LunchBox = FindEntityByClassname(LunchBox, "TF_WEAPON_LUNCHBOX")) != -1)
			{
				if (i == GetEntPropEnt(LunchBox, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(LunchBox, "effect bar recharge rate increased", 0.25);
				}
			}
			
			int Jarate = -1;
			while ((Jarate = FindEntityByClassname(Jarate, "TF_WEAPON_JAR")) != -1)
			{
				if (i == GetEntPropEnt(Jarate, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(Jarate, "effect bar recharge rate increased", 0.25);
				}
			}
		}
	}