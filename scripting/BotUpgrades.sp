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
		if (IsClientInGame(i) && IsFakeClient(i) &&  TF2_GetClientTeam(i) == TFTeam_Red)  {
			int Primary = GetPlayerWeaponSlot(i, TFWeaponSlot_Primary);
			int Secondary = GetPlayerWeaponSlot(i, TFWeaponSlot_Secondary);
			int Melee = GetPlayerWeaponSlot(i, TFWeaponSlot_Melee);
			
			/** Universal Attributes */
			TF2Attrib_SetByName(Melee, "critboost on kill", 4.0);									// Gain 4 seconds of Critical Hits after kill
			TF2Attrib_SetByName(Melee, "melee attack rate bonus", 0.6);								// +40% Faster swing speed
			TF2Attrib_SetByName(Melee, "heal on kill", 100.0);										// +100 HP per kill
			TF2Attrib_AddCustomPlayerAttribute(i, "health regen", 10.0);							// +4 Health regen per second
			TF2Attrib_AddCustomPlayerAttribute(i, "move speed bonus", 1.3);							// +30% Faster movement speed
			TF2Attrib_AddCustomPlayerAttribute(i, "increased jump height", 1.2);					// +20% Higher jump
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from bullets reduced", 0.25);			// +75% Dmg resistances from Bullets
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from fire reduced", 0.5);				// +50% Dmg resistances from Fire
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from crit reduced", 0.1);				// +90% Dmg resistances from Critical Hits
			TF2Attrib_AddCustomPlayerAttribute(i, "dmg taken from blast reduced", 0.75);			// +75% Dmg resistances from Blast
			TF2Attrib_AddCustomPlayerAttribute(i, "max health additive bonus", 25.0);				// +25 Additional health
			TF2Attrib_AddCustomPlayerAttribute(i, "ammo regen", 0.25);								// +25% Ammo regen
			
			switch (TF2_GetPlayerClass(i)) {
				case TFClass_Scout: {
					/** Scout Primary Attributes */
					TF2Attrib_SetByName(Primary, "damage bonus", 2.0);								// +100% Damage bonus
					TF2Attrib_SetByName(Primary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Primary, "faster reload rate", 0.4);						// +60% Faster reloading
					TF2Attrib_SetByName(Primary, "heal on kill", 25.0);								// +25 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					TF2Attrib_SetByName(Primary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					/** Scout Special Attributes */
					TF2Attrib_SetByName(Primary, "bullets per shot bonus", 1.25);					// +25% Extra bullets
					TF2Attrib_SetByName(Primary, "scattergun knockback mult", 1.8);					// +80% Knockback force
					TF2Attrib_SetByName(Primary, "heal on hit for rapidfire", 5.0);					// Gain 5 HP per hit w/ primary
					/** Scout Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.6);							// +40% Faster fire rate
				}
				case TFClass_Soldier: {
					/** Soldier Primary Attributes */
					TF2Attrib_SetByName(Primary, "damage bonus", 2.0);								// +100% Damage bonus
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Primary, "faster reload rate", 0.4);						// +60% Faster reloading
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					/** Soldier Special Attributes */
					TF2Attrib_SetByName(Primary, "rocket specialist", 2.0);							// +2 points of Rocket Specialist
					TF2Attrib_SetByName(Primary, "clip size upgrade atomic", 8.0);					// +8 Rockets (12 total)
					TF2Attrib_SetByName(Primary, "Projectile speed increased", 1.2);				// +20% Faster projectile speed
					/** Soldier Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Secondary, "faster reload rate", 0.4);						// +60% Faster reloading
				}
				case TFClass_Pyro: {
					/** Pyro Primary Attributes */
					TF2Attrib_SetByName(Primary, "damage bonus", 2.0);								// +100% Damage bonus
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					TF2Attrib_SetByName(Primary, "airblast pushback scale", 1.50);					// +50% Airblast force
					/** Pyro Special Attributes */
					TF2Attrib_SetByName(Primary, "mult airblast refire time", 0.8);					// +20% Faster Airblast charge
					/** Pyro Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Secondary, "faster reload rate", 0.4);						// +60% Faster reloading
				}
				case TFClass_DemoMan: {
					/** DemoMan Primary Attributes */
					TF2Attrib_SetByName(Primary, "damage bonus", 1.8);								// +80% Damage bonus
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Primary, "faster reload rate", 0.4);						// +60% Faster reloading
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					/** DemoMan Special Attributes */
					TF2Attrib_SetByName(Primary, "clip size upgrade atomic", 8.0);					// +8 Pills (12 total)
					TF2Attrib_SetByName(Primary, "Projectile speed increased", 1.1);				// +10% Faster projectile speed
					/** DemoMan Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "max pipebombs increased", 4.0);					// Additional +4 stickybomb placement for Sticky Launcher
					TF2Attrib_SetByName(Secondary, "damage bonus", 1.8);							// +80% Damage bonus
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.75);						// +25% Faster fire rate
					TF2Attrib_SetByName(Secondary, "faster reload rate", 0.4);						// +60% Faster reloading
				}
				case TFClass_Heavy: {
					/** HeavyWeapons Primary Attributes */
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					/** HeavyWeapons Special Attributes */
					TF2Attrib_SetByName(Primary, "attack projectiles", 2.0);						// +2 points of Attack projectiles
					TF2Attrib_SetByName(Primary, "projectile penetration heavy", 2.0);				// +2 points of Projectiles penetration
					TF2Attrib_SetByName(Primary, "minigun spinup time decreased", 0.8);				// +20% Faster minigun spin
					/** HeavyWEapons Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Secondary, "faster reload rate", 0.4);						// +60% Faster reloading
				}
				case TFClass_Engineer: {
					/** Engineer Primary Attributes */
					TF2Attrib_SetByName(Primary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Primary, "faster reload rate", 0.4);						// +60% Faster reloading
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					/** Engineer Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					/** Engineer Melee Attributes */
					TF2Attrib_SetByName(Melee, "critboost on kill", 4.0);							// Gain 4 seconds of Critical Hits after kill
					TF2Attrib_SetByName(Melee, "melee attack rate bonus", 0.6);						// +40% Faster swing speed
					TF2Attrib_SetByName(Melee, "heal on kill", 100.0);								// +100 HP per kill
					TF2Attrib_SetByName(Melee, "engy sentry fire rate increased", 0.7);				// +30% Faster Sentry fire
					TF2Attrib_SetByName(Melee, "engy building health bonus", 4.0);					// +300% Engy building health
					TF2Attrib_SetByName(Melee, "engineer sentry build rate multiplier", 1.5);		// +50% Faster sentry setup
					TF2Attrib_SetByName(Melee, "engy dispenser radius increased", 4.0);				// +300% Dispenser Range
					TF2Attrib_SetByName(Melee, "metal regen", 20.0);								// +20 Metal regen per 5 seconds
					TF2Attrib_SetByName(Melee, "maxammo metal increased", 2.0);						// +100% Max Metal
					TF2Attrib_SetByName(Melee, "bidirectional teleport", 1.0);						// 2-way Teleporter
				}
				case TFClass_Medic: {
					/** Medic Primary Attributes */
					TF2Attrib_SetByName(Primary, "clip size bonus upgrade", 3.0);					// +200% Clip size bonus
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.6);							// +40% Faster fire rate
					TF2Attrib_SetByName(Primary, "faster reload rate", 0.4);						// +60% Faster reloading
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					/** Medic Special Attributes */
					TF2Attrib_SetByName(Primary, "mad milk syringes", 1.0);							// Syringes shoot MadMilk
					/** Medic Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "ubercharge rate bonus", 2.0);					// +100% Faster Uber build-up
					TF2Attrib_SetByName(Secondary, "heal rate bonus", 1.5);							// +50% Faser heal rate
					TF2Attrib_SetByName(Secondary, "overheal expert", 3.0);							// +3 Points of Overheal Expert
					TF2Attrib_SetByName(Secondary, "healing mastery", 3.0);							// +3 Points of Healing Mastery
					TF2Attrib_SetByName(Secondary, "uber duration bonus", 6.0)						// +6 Extra seconds of Uber
				}
				case TFClass_Sniper: {
					/** Sniper Primary Attributes */
					TF2Attrib_SetByName(Primary, "damage bonus", 1.75);								// +75% Damage bonus
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo primary increased", 2.5);					// +150% Maximum Ammo
					TF2Attrib_SetByName(Primary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					/** Sniper Special Attributes */
					TF2Attrib_SetByName(Primary, "explosive sniper shot", 3.0);						// +3 Points of Explosive Headshots
					TF2Attrib_SetByName(Primary, "SRifle Charge rate increased", 1.5);				// +50% Faster scope charge
					/** Sniper Secondary Attributes */
					TF2Attrib_SetByName(Secondary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Secondary, "clip size bonus upgrade", 3.0);					// +200% Clip size bonus
					TF2Attrib_SetByName(Secondary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Secondary, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(Secondary, "fire rate bonus", 0.6);							// +40% Faster fire rate
				}
				case TFClass_Spy: {
					/** Spy Primary Attributes */
					TF2Attrib_SetByName(Primary, "damage bonus", 1.2);								// +20% Damage bonus
					TF2Attrib_SetByName(Primary, "fire rate bonus", 0.75);							// +25% Faster fire rate
					TF2Attrib_SetByName(Primary, "projectile penetration", 1.0);					// +1 point of Projectile Penetration
					TF2Attrib_SetByName(Primary, "heal on kill", 50.0);								// +50 HP per kill
					TF2Attrib_SetByName(Primary, "maxammo secondary increased", 2.5);				// +150% Maximum Ammo
					TF2Attrib_SetByName(Primary, "clip size bonus upgrade", 2.0);					// +100% Clip size bonus
					//TF2Attrib_SetByName(Primary, "faster reload rate", 0.4);						// +60% Faster reloading
					/** Spy Special Attributes */
					TF2Attrib_SetByName(Melee, "cloak consume rate decreased", 0.3);				// +70% Less cloak consumed
					TF2Attrib_SetByName(Secondary, "robo sapper", 3.0);								// +3 Points Robo Sapper
					TF2Attrib_SetByName(Secondary, "effect bar recharge rate increased", 0.6);		// +40% Faster recharge rate
				}
			}
			/** Sandman = Well, you know */
			int Sandman = -1;
			while ((Sandman = FindEntityByClassname(Sandman, "TF_WEAPON_BAT_WOOD")) != -1)
			{
				if (i == GetEntPropEnt(Sandman, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(Sandman, "effect bar recharge rate increased", 0.25);		// +75% Faster recharge rate
					TF2Attrib_SetByName(Sandman, "mark for death", 1.0);
				}
			}
			
			/** Drink = Crit-a-Cola or Bonk! Atomic Punch */
			//int Drink = -1;
			//while ((Sandman = FindEntityByClassname(Drink, "TF_WEAPON_LUNCHBOX_DRINK")) != -1)
			//{
				//if (i == GetEntPropEnt(Drink, Prop_Data, "m_hOwnerEntity"))
				//{
					//TF2Attrib_SetByName(Drink, "effect bar recharge rate increased", 0.25);		// +75% Faster recharge rate
				//}
			//}
			
			/** BuffBanner = Well, you know */
			int BuffBanner = -1;
			while ((BuffBanner = FindEntityByClassname(BuffBanner, "TF_WEAPON_BUFF_ITEM")) != -1)
			{
				if (i == GetEntPropEnt(BuffBanner, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(BuffBanner, "increase buff duration", 1.5);					// +50% Buff duration bonus
				}
			}
			
			/** Bow = Well, you know */
			int Bow = -1;
			while ((Bow = FindEntityByClassname(Bow, "TF_WEAPON_COMPOUND_BOW")) != -1)
			{
				if (i == GetEntPropEnt(Bow, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(Bow, "bleeding duration", 5.0);								// +5 Seconds bleeding
					TF2Attrib_SetByName(Bow, "faster reload rate", 0.4);							// +60% Faster reloading
				}
			}
			
			/** LunchBox = Heavy's Secondary editbles */
			//int LunchBox = -1;
			//while ((LunchBox = FindEntityByClassname(LunchBox, "TF_WEAPON_LUNCHBOX")) != -1)
			//{
				//if (i == GetEntPropEnt(LunchBox, Prop_Data, "m_hOwnerEntity"))
				//{
					//TF2Attrib_SetByName(LunchBox, "effect bar recharge rate increased", 0.35);	// +65% Faster recharge rate
				//}
			//}
			
			/** Jarate = Well, you know */
			int Jarate = -1;
			while ((Jarate = FindEntityByClassname(Jarate, "TF_WEAPON_JAR")) != -1)
			{
				if (i == GetEntPropEnt(Jarate, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(Jarate, "effect bar recharge rate increased", 0.4);			// +60% Faster recharge rate
					TF2Attrib_SetByName(Jarate, "applies snare effect", 0.65);						// -35% Speed on target 
				}
			}
			/** MadMilk = Well, you know */
			int MadMilk = -1;
			while ((MadMilk = FindEntityByClassname(MadMilk, "TF_WEAPON_JAR_MILK")) != -1)
			{
				if (i == GetEntPropEnt(MadMilk, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(MadMilk, "effect bar recharge rate increased", 0.4);		// +60% Faster recharge rate
					TF2Attrib_SetByName(MadMilk, "applies snare effect", 0.65);						// -35% Speed on target 
				}
			}
			/** GasPasser = Well, you know */
			int GasPasser = -1;
			while ((GasPasser = FindEntityByClassname(GasPasser, "TF_WEAPON_JAR_GAS")) != -1)
			{
				if (i == GetEntPropEnt(GasPasser, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(GasPasser, "effect bar recharge rate increased", 0.6);		// +40% Faster recharge rate
					TF2Attrib_SetByName(GasPasser, "explode_on_ignite", 1.0);						// Explodes enemies upon ignition
				}
			}
			/** CowMangler = Well, you know */
			int CowMangler = -1;
			while ((CowMangler = FindEntityByClassname(CowMangler, "TF_WEAPON_PARTICLE_CANNON")) != -1)
			{
				if (i == GetEntPropEnt(CowMangler, Prop_Data, "m_hOwnerEntity"))
				{
					TF2Attrib_SetByName(Primary, "damage bonus", 2.0);								// +100% Damage bonus
					TF2Attrib_SetByName(CowMangler, "clip size bonus upgrade", 3.0);				// +200% Clip size bonus
					TF2Attrib_SetByName(CowMangler, "heal on kill", 100.0);							// +100 HP per kill
					TF2Attrib_SetByName(CowMangler, "fire rate bonus", 0.6);						// +40% Faster fire rate
					TF2Attrib_SetByName(CowMangler, "faster reload rate", 0.4);						// +60% Faster reloading
				}
			}
			
			/** Flaregun = Well, you know */
			//int Flaregun = -1;
			//while ((Flaregun = FindEntityByClassname(Flaregun, "TF_WEAPON_FLAREGUN")) != -1)
			//{
				//if (i == GetEntPropEnt(Flaregun, Prop_Data, "m_hOwnerEntity"))
				//{
					//TF2Attrib_SetByName(Flaregun, "maxammo secondary increased", 2.5);			// +150% Maximum Ammo
					//TF2Attrib_SetByName(Flaregun, "heal on kill", 100.0);							// +100 HP per kill
					//TF2Attrib_SetByName(Flaregun, "fire rate bonus", 0.6);						// +40% Faster fire rate
					//TF2Attrib_SetByName(Flaregun, "faster reload rate", 0.4);						// +60% Faster reloading
				//}
			//}
			
			/** DemoShield = Demoman's Shields */
			//int DemoShield = -1;
			//while ((DemoShield = FindEntityByClassname(DemoShield, "TF_WEARABLE_DEMOSHIELD")) != -1)
			//{
				//if (i == GetEntPropEnt(DemoShield, Prop_Data, "m_hOwnerEntity"))
				//{
					//TF2Attrib_SetByName(DemoShield, "damage force reduction", 0.1);				// +90% Push force when charging
					//TF2Attrib_SetByName(DemoShield, "charge recharge rate increased", 4.0);		// +300% Shield recharge rate
				//}
			//}
		}
	}
