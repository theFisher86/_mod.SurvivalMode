:skull: NMS Survival Mode Mod :skull:
=====================
If you're reading this and you aren't me then you probably don't want this yet.  This is **very much** a work in progress mod for *No Man's Sky.*

Notes
-----

## :umbrella: Weather Damage
- Might want to get rid of most of the `HazardTable` changes and just mess with the `TriggerValue` in `HazardTable` (maybe the `Increases` thing too if you can figure out how it works).  Then use the different WeatherValues from `\METADATA\SIMULATION\SOLARSYSTEM\WEATHER\` and my [weather table](https:\\drive.google.com\open?id=1uFutA2O6o5lY_qkIYukqoCL2Sp227v41eKzXbehU8B4) to change the temps, toxs, & rads of each weather style.  I feel like this would be the *better* way to go about it than just arbitrarily changing the `HAZARDTABLE` values. 

- Looks like the way this whole weather damage thing works is this:
  1. The weather file in `\METADATA\SIMULATION\SOLARSYSTEM\WEATHER\` defines the temp, tox & rad levels of the particular weather feature (5 features in each planet type).
  2. the `HAZARDTABLE` defines at what point the temp, tox or rad levels start actually dealing damage.
    - This would be the `TriggerValue`
	- Need to figure out what the items below do in `HAZARDTABLE`
	- [ ] ProtectionTime
	- [ ] DamageRate
	- [ ] WoundRate
	- [ ] Increases
	- [ ] CriticalValue
  3. Then once the `TriggerValue` is hit the `DAMAGETABLE` kicks in and deals the amount of damage for the type.
    - This might only happen once the `HAZARDTABLE` reaches it's `CriticalValue`


:memo: Changelog
---------
_8/26/2016_
- Changed all CreatureRoles in GROUND and UNDERWATER to PlayerPredator.  Everything should try to kill you now pretty much.
_8\25\16_

###Make Ship Launcher use more resources to prevent overuse.
* NMS_REALITY_GCTECHNOLOGYTABLE.exml *
  - Ship_Launcher
    - Raised ChargeAmount to 1000 (from 600)
    - Raised Ship_Launcher_TakeOffCost to 500 (from 150)
    - Added COMMODITY6 (Antimatter) as a charge source
    - [ ] TODO: Need to add this to the Description
      - This also required editing NMS_REALITY_GCPRODUCTTABLE.exml
	  - Increased ChargeValue of COMMODITY6 to 500 (from 0)
				
###Make Ship Shields hold dramatically more charge so you're not recharging your ship shields mid-battle all the time.  Can't charge shields with just plain Iron.
-  Will need to craft it into a Shield Fuel product or use Titanium or Zinc.  However Iron is now inefficient when crafting into fuel (125FE = 100 charge, 250FE = 200 charge, etc).	 This makes inventory efficiency have some differences (most efficient woudl be TI or ZN as they are worth 2x charge and can hold 250 (500 charge) in an exosuit slot).
- [ ] TODO: All of this needs added to the descriptions and language files.
* NMS_REALITY_GCTECHNOLOGYTABLE.exml *
-SHIPSHIELD
  - Increased ChargeAmount to 800 so that shields can hold more charge.  Also makes Shield products essentially double the shield output when used. 
  -Added SHIELDFUEL1, SHIELDFUEL2, SHIELDFUEL3, COMRARE1 & COMUNCOMMON1 to ChargeBy
    - Changed NMS_REALITY_GCPRODUCTTABLE.exml 
      - SHIELDFUEL1 now requires 125 COM1 (iron) but produces 100 charge
      - SHIELDFUEL2 now requires 250 COM1 (iron) but produces 200 charge
      - SHIELDFUEL3 now requires 500 COM1 (iron) but produces 400 charge
		
###Environmental Shields hold more charge as they're upgraded.
- [ ] TODO: Add to language files.	
- COLD2, HOT2, RAD2 & TOX2 ChargeAmount increased to 150
- COLD3, HOT3, RAD3 & TOX3 ChargeAmount increased to 250
	
###Weaken the Scanner dramatically.  Make the Scanner much less powerful so that if you want the scanner to actually be useful you need both of the upgrades for it (thus sacrificing inventory space).
* NMS_REALITY_GCTECHNOLOGYTABLE.exml *
- Reduce Weapon_Scan_Radius of Scan1 to 0.2 (from 1)
- Reduce Weapon_Scan_Radius of Scan2 to 0.8 (from 1.4)
- Reduce Weapon_Scan_Radius of Scan3 to 1.5 (from 1.8)
		
###Increase the overall damage done by everything
- Enviromental Damage increased to 56 (from 28) on EXTREMEHEATDMG, EXTREMECOLDDMG, TOXICGASDMG & RADIATIONDMG
- No oxygen damage doubled (from 10 to 20)
- Impact Damage increased to 15 (from 10) and PushForce of 10 added so it knocks you down.
- RobotGunDMG increased to 15 (from 3!!!) and a PushForce of 10 was added, so Sentinels are a legit problem now.
- LaserDamage increased to 30 (from 4!!!) and a PushForce of 20 was added, pretty sure this applies to Sentinel elite forces.
- SmallCreatureDmg increased to 30 (from 20), PushForce unchanged.
- MedCreatureDmg increased to 50 (from 30), PushForce upped to 15 (from 10)
- LrgCreatureDmg increased to 85 (from 50), PushForce upped to 20 (from 15).
- HugeCreatureDmg increased to 100 (from 80), PushForce upped to 35 (from 20)
- PlayerPredDmg increased to 65 (from 40), PushForce unchanged
- PlantDmg increased to 50 (from 7), PushForce upped to 25 (from 0)
- WalkerLaser increased to 15 (from 5), PushForce unchanged
	
###Messing with Robots and Animals
* ROBOTDATATABLE.exml *
- Increased Drone MaxScale to 2 (from 1) hopefully this will change the size of the drones flying around (big ones could generate)
- [ ] TODO: If the above works there's QUAD and WALKER files in ROBOTDATATABLE which could be edited too!
	
* CAVETABLECOMMON.exml *
- Changed CreatureRole to PlayerPredator for Blobs & Spiders, Rodents are just Predators now (previously Blobs & Rodents were Prey and Spiders were Predators).
- Increased MaxGroupScale for Blobs to 2.8 (from 1.8)
- Upped MinGroupSize to 5 (from 1) and MaxGroupSize to 12 (from 3)for Blobs
- Increased ProbablityOfBeingEnabled to 1.25 (from 0.25)
	
###HazardTable Edits
* EXTREMEHEATDMG, EXTREMECOLDDMG, TOXICGASDMG & RADIATIONDMG *
  -Changed Increase to True
  -CapValue up to 200 (from 100), except on EXTREMECOLDDMG it was changed to -200
  -DAMAGERATE X increased to 75 (from 50) and y increased to 30 (from 20)for EXTREMEHEATDMG & EXTREMECOLDDMG
  -WOUNDRATE X increased to 75 (from 50) and y increased to 30 (from 20) for TOXICGASDMG & RADIATIONDMG
	
		
