:skull: NMS Survival Mode Mod :skull:
=====================
Survival Mode has reached 1.0!  It is still in BETA but should be okay to use for most players.  **It will still require extensive tweaking so _I NEED FEEDBACK_**  Please report Issues using the [Issue tab on my Github](https://github.com/theFisher86/_mod.SurvivalMode/issues) or send me a DM on [Discord](http://discordapp.com) my user name is theFisher86.

This is an overhaul of as many systems and stats that I could get my hands on aimed at making the game much harder and forcing the player to explore planets on foot more.

:star2: Features
-----
- Reduced number of buildings
- Reduced Resources and Crystals
- More animals are Predators and they're after you!
- Faster Predators
- Creatures can get BIGGER
- Weather is dramatically more dangerous.  This is probably the change you'll notice first.  Exploring alien planets is now dangerous.  You'll have a hard time.
- Ship Launcher requires dramatically more resources and should only be able to take off twice before being refilled.
- Ship shields hold more shield resources so you don't need to recharge them mid-battle as much.  However you can't charge them with just Iron anymore.  You'll need to make Shield Resources
- Environmental shields now only increase your damage reduction but now the higher shield level the more charge the shield can hold.
- Scanner is dramatically weakened in it's default state.  If you want the scanner to serve any purpose at all you'll need to upgrade it and sacrifice the inventory space.
- Pretty much everything does more damage now except for you.  Player damage modifiers are unchanged.
- Contains the 10x version of [Denser Forests](http://nomansskymods.com/mods/denser-forests-packed/) built in so as not to create compatibility issues.
- Customized Intro and Title Screens
- All tech can be deconstructed (you can break down the hyperdrive, shields, etc and move it around now)
- 
:computer: Install
-----
If you were directed here from NoMansSkyMods.com then you probably just want to download (right-click the file above and click "Save As") the .pak file and save it into your PCBANKS folder.  If you don't know what that means this mod is probably *wayy* to unpolished for you just yet.  Wait until version 1.0 comes out and there'll be a direct download. 

## :heavy_check_mark: ToDo
- [ ] Further tweaks across the board to add polish to everything.  The damage and stats increases right now were made with very little playability testing, basically just to see if it would work.
  - **Requires Feedback from Community**
- [ ] Spend more time making space battles epic.  I have personally spent most of my in-game time on planets exploring.  I'll need to get into more space battles and tweak those stats more.
- [ ] Increase the amount of Sentinels that spawn when you piss them off.
- [ ] Once we're able to change more stuff with how the Scanner finds stuff I want to heavily edit that.
  - Looks like we can decompile the tables in `\METADATA\SIMULATION\SCANNING` now!  Should happen sooner than later!
- [ ] Make Wanted Level stick around longer.
- [ ] Make Sentinels call for re-enforcements sooner.
- [ ] Ultimately I would like the Sentinels that spawn when you illegally mine resources or kill animals to be an actual deterrent from doing so.  You should be scared to harvest Plutonium with a drone hovering nearby.
- [ ] AI Improvements *far-off*
 
Spider Infestation
---------
This is a proof of concept that changes every single ground creature into a type of spider/crab.  The why is not important, but the *how* is.
- Changed `CreatureType` in `\METADATA\SIMULATION\ECOSYSTEM\CREATUREDATATABLE.MBIN` to `SPIDER` instead of none
  - It's important to not that `SPIDER` is a new `CreatureType` I could've changed it to `JERRRYSEINFELD` it's a custom `CreatureType`
- Then I did a Find & Replace for all of the files in `\METADATA\SIMULATION\ECOSYSTEM\ROLEDESCRIPTIONTABLES\GROUND\`to change `<Property name="CreatureType" value="" />` to `<Property name="CreatureType" value="SPIDER" />`
- It's worth noting I tried replacing the `ForceID` value instead of the `CreatureType` value and it had no effect.
- It's also worth noting that in `GROUNDTABLEALLCOW` it still says `<Property name="ForceID" value="COW" />` but I haven't seen any *CowTypes* yet.  That could just be from lack of testing or `CreatureType` may override `ForceID` as `ForceID` didn't do anything when `CreatureType` was blank.  *This needs clarification and further testing**
- So, theoretically we could assign different CreatureTypes in the `CREATUREDATATABLE` to different categories and then define where those categories would show up using the `GROUNDTABLE`s
  - This will be utilized down the line in the Survival Mode mod as I build defined Biomes with noticeably different gameplay mechanics and challenges.

:memo: Changelog
---------
_8/29/2016_
- Added startup logo and title.
- Prepared for beta release.
_8/27/2016_
- Reduced total number of buildings with the PlanetBuildingTable
- Received permission from madvillain5 to add in [Denser Forests](http://nomansskymods.com/mods/denser-forests-packed/) so added the 10x version of his mod.
- Also reduced the total appearance of crystals by about 1/2 and appearance of resources by 1/3
- Updated Creature generation settings to make predators faster, increase the maximum size of most animals (but not force extra large) and make swarms faster pretty much across the board.
- Redid weather system and enviro damage.
_8/26/2016_
- Changed all CreatureRoles in GROUND and UNDERWATER to PlayerPredator.  Everything should try to kill you now pretty much. :warning: this is temporary.  Won't leave it so *everything* is trying to kill you, just most things.
_8\25\16_
