Spider Infestation
---------
This is a proof of concept that **changes every single ground creature into a type of spider/crab**.  

It also drastically increases their speed, aggressiveness (changes all Prey & Passive to PlayerPredator), and Group Size...  That part isn't proof of concept, just fun.  

Modder Resource
---------
The why is not important, but the *how* is.
- Changed `CreatureType` in `\METADATA\SIMULATION\ECOSYSTEM\CREATUREDATATABLE.MBIN` to `SPIDER` instead of none
  - It's important to not that `SPIDER` is a new `CreatureType` I could've changed it to `JERRRYSEINFELD` it's a custom `CreatureType`
- Then I did a Find & Replace for all of the files in `\METADATA\SIMULATION\ECOSYSTEM\ROLEDESCRIPTIONTABLES\GROUND\`to change `<Property name="CreatureType" value="" />` to `<Property name="CreatureType" value="SPIDER" />`
- It's worth noting I tried replacing the `ForceID` value instead of the `CreatureType` value and it had no effect.
- It's also worth noting that in `GROUNDTABLEALLCOW` it still says `<Property name="ForceID" value="COW" />` but I haven't seen any *CowTypes* yet.  That could just be from lack of testing or `CreatureType` may override `ForceID` as `ForceID` didn't do anything when `CreatureType` was blank.  *This needs clarification and further testing**
- So, theoretically we could assign different CreatureTypes in the `CREATUREDATATABLE` to different categories and then define where those categories would show up using the `GROUNDTABLE`s
  - This will be utilized down the line in the Survival Mode mod as I build defined Biomes with noticeably different gameplay mechanics and challenges.
