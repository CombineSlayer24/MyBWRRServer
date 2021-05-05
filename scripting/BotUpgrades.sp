#include <sourcemod>
#include <tf2attributes>
#include <tf2>
#include <tf2_stocks>

public void OnPluginStart() {
	CreateTimer(1.0, Timer_AddAttribsToActiveWep, _, TIMER_REPEAT);
	HookEvent("player_builtobject", Event_PlayerBuiltObject);
}

public Action Timer_AddAttribsToActiveWep(Handle timer) {
	for (int i = 1; i < GetMaxClients(); i++)
		if (IsClientInGame(i) && IsFakeClient(i) && TF2_GetClientTeam(i) == TFTeam_Red)  {
			int wep = GetEntPropEnt(i, Prop_Send, "m_hActiveWeapon");

			//TF2Attrib_SetByName(wep, "dmg taken from bullets reduced", 0.80);
			//TF2Attrib_SetByName(wep, "dmg taken from fire reduced", 0.80);
			TF2Attrib_SetByName(wep, "dmg taken from crit reduced", 0.6);
			//TF2Attrib_SetByName(wep, "dmg taken from blast reduced", 0.80);
			TF2Attrib_SetByName(wep, "damage force reduction", 0.8);
			TF2Attrib_SetByName(wep, "max health additive bonus", 100.0);
			TF2Attrib_SetByName(wep, "move speed bonus", 1.12);
			TF2Attrib_SetByName(wep, "damage bonus", 3.25);
			TF2Attrib_SetByName(wep, "ammo regen", 1.5);
			TF2Attrib_SetByName(wep, "clip size bonus upgrade", 1.5);
			TF2Attrib_SetByName(wep, "fire rate bonus", 0.75);
			TF2Attrib_SetByName(wep, "mod rage on hit bonus", 1000.0);
			TF2Attrib_SetByName(wep, "Reload time decreased", 0.5);
			TF2Attrib_SetByName(wep, "heal on kill", 50.0);
			TF2Attrib_SetByName(wep, "health regen", 20.0);
			TF2Attrib_SetByName(wep, "maxammo primary increased", 5.0);
			TF2Attrib_SetByName(wep, "increased jump height", 1.15);

			switch (TF2_GetPlayerClass(i)) {
				case TFClass_Pyro: {
					TF2Attrib_SetByName(wep, "airblast pushback scale", 1.25);
					TF2Attrib_SetByName(wep, "mult airblast refire time", 0.9);
				}
				case TFClass_Engineer: {
					TF2Attrib_SetByName(wep, "engy sentry fire rate increased", 0.9);
					TF2Attrib_SetByName(wep, "engy building health bonus", 1.25);
					TF2Attrib_SetByName(wep, "engineer sentry build rate multiplier", 1.5);
					TF2Attrib_SetByName(wep, "engy dispenser radius increased", 1.25);
					TF2Attrib_SetByName(wep, "metal regen", 200.0);
					TF2Attrib_SetByName(wep, "maxammo metal increased", 1.5);
					TF2Attrib_SetByName(wep, "bidirectional teleport", 1.0);
				}
				case TFClass_Medic: {
					TF2Attrib_SetByName(wep, "ubercharge rate bonus", 1.25);
					//TF2Attrib_SetByName(wep, "generate rage on heal", 1.0);
					TF2Attrib_SetByName(wep, "heal rate bonus", 1.5);
					TF2Attrib_SetByName(wep, "overheal expert", 1.25);
					TF2Attrib_SetByName(wep, "healing mastery", 1.25);
					TF2Attrib_SetByName(wep, "heal rate bonus", 1.5); 
					TF2Attrib_SetByName(wep, "uber duration bonus", 1.5);
				}
				case TFClass_Spy: {
					TF2Attrib_SetByName(wep, "melee attack rate bonus", 0.8);
					TF2Attrib_SetByName(wep, "critboost on kill", 1.0);
					//TF2Attrib_SetByName(wep, "armor piercing", 3.0);
					//TF2Attrib_SetByName(wep, "robo sapper", 3.0);
				}
				case TFClass_Soldier: {
					TF2Attrib_SetByName(wep, "rocket specialist", 1.0);
					TF2Attrib_SetByName(wep, "clip size upgrade atomic", 8.0);
				}
				case TFClass_DemoMan: {
					TF2Attrib_SetByName(wep, "Projectile speed increased", 1.10);
					TF2Attrib_SetByName(wep, "clip size upgrade atomic", 6.0);
				}
				case TFClass_Heavy: {
					TF2Attrib_SetByName(wep, "projectile penetration heavy", 1.0);
					TF2Attrib_SetByName(wep, "attack projectiles", 1.0);
				}
				case TFClass_Scout: {
					TF2Attrib_SetByName(wep, "bullets per shot bonus", 1.65);		// +65% extra bullets per shot, finale stack should be [idfk, sue me]
					TF2Attrib_SetByName(wep, "scattergun knockback mult", 1.15);	// +15% knockback on a scattergun pellet, final stack should be +45%
					TF2Attrib_SetByName(wep, "move speed bonus", 1.25);			// +25% starting move speed, final stack should be %75 max speed. shet
				}
				case TFClass_Sniper: {
					TF2Attrib_SetByName(wep, "explosive sniper shot", 1.0);
					TF2Attrib_SetByName(wep, "projectile penetration", 1.0);
					TF2Attrib_SetByName(wep, "SRifle Charge rate increased", 1.20);
					//TF2Attrib_SetByName(wep, "sniper fires tracer", 1.0);
				}
			}
		}
}

public Action Event_PlayerBuiltObject(Handle event, const char[] name, bool dontBroadcast) {
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (IsFakeClient(client) && TF2_GetClientTeam(client) == TFTeam_Red) {
		int sentry = GetEventInt(event, "index");
		//SetEntProp(sentry, Prop_Send, "m_iUpgradeLevel", 3);
		SetEntProp(sentry, Prop_Send, "m_iAmmoShells", 9999999999); 
	}
}