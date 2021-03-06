module Strats exposing (..)

import String exposing (join, toLower, words)

import List.Nonempty as Nonempty

import Util exposing (fromJust)



type alias Strat =
  {
    name : String,
    desc : String,
    tags : List String
  }


slug : Strat -> String
slug { name } =
  let
    validChar x = List.member x (String.toList "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
  in
    join "_" (words (String.filter validChar (toLower name)))


getStrat : String -> Nonempty.Nonempty Strat -> Maybe Strat
getStrat s xs = List.head (List.filter (\x -> slug x == s) (Nonempty.toList xs))


removeStrat : String -> Nonempty.Nonempty Strat -> Nonempty.Nonempty Strat
removeStrat s xs =
  let
    remaining = Nonempty.fromList (List.filter (\x -> slug x /= s) (Nonempty.toList xs))
  in
    case remaining of
      Just r ->
        r
      Nothing ->
        strats


strats : Nonempty.Nonempty Strat
strats =
  fromJust (Nonempty.fromList [
    {
      name = "Curse of the Lefty",
      desc = "Use left-handed viewmodels.",
      tags = ["any_map", "viewmodel"]
    },
    {
      name = "Valve Server",
      desc = "Everyone plays Sniper or Spy.",
      tags = ["any_map", "sniper", "spy"]
    },
    {
      name = "Seppuku",
      desc = "If your medic dies, killbind.",
      tags = ["any_map", "killbind"]
    },
    {
      name = "Full Steam Ahead",
      desc = "Unbind your strafe keys.",
      tags = ["any_map", "unbind"]
    },
    {
      name = "Flawed",
      desc = "Unbind your jump key.",
      tags = ["any_map", "unbind"]
    },
    {
      name = "Straight Outta Degroot",
      desc = "You can only use Medieval loadouts.",
      tags = ["any_map", "loadout"]
    },
    {
      name = "High Stakes Gameplay",
      desc = "Every time you lose a control point, delete a cosmetic.",
      tags = ["any_map", "killbind"]
    },
    {
      name = "No Going Back",
      desc = "Bind 's' to killbind.",
      tags = ["any_map", "killbind"]
    },
    {
      name = "W + M1",
      desc = "Everyone Pyro, everyone Phlog.",
      tags = ["any_map", "pyro", "loadout"]
    },
    {
      name = "Facing Worlds",
      desc = "Everyone engineer. You can't use your weapons until you have a telefrag.",
      tags = ["any_map", "engineer", "teleporter"]
    },
    {
      name = "RNG",
      desc = "Random classes.",
      tags = ["any_map"]
    },
    {
      name = "Fat Scouts",
      desc = "All heavy, all shotgun only.",
      tags = ["any_map", "heavy", "loadout"]
    },
    {
      name = "Minefield",
      desc = "All Demoman, all Scottish Resistance, all Wee Booties.",
      tags = ["any_map", "demo", "loadout"]
    },
    {
      name = "To Attention",
      desc = "Stand up while playing.",
      tags = ["any_map", "irl"]
    },
    {
      name = "Weeb Medic",
      desc = "When healed, say \"Arigatou, Onii-chan!\".",
      tags = ["any_map", "mic"]
    },
    {
      name = "The Worst",
      desc = "Ignore objectives. Spawncamp to victory.",
      tags = ["any_map"]
    },
    {
      name = "The Octopus",
      desc = "One Heavy, everyone else Medic. Medics must keep their beams on the Heavy at all times.",
      tags = ["any_map", "heavy", "medic"]
    },
    {
      name = "Politeness",
      desc = "Say \"Exemplary\" every time a team-mate gets a kill.",
      tags = ["any_map", "mic"]
    },
    {
      name = "Guide Dogs",
      desc = "Medics must play with their monitors turned off, and be guided by the team.",
      tags = ["any_map", "mic", "irl"]
    },
    {
      name = "TFC",
      desc = "Everyone Sniper, everyone The Classic.",
      tags = ["any_map", "Sniper", "loadout"]
    },
    {
      name = "Rules of Engagement",
      desc = "No hurting medics unless they engage in battle.",
      tags = ["any_map"]
    },
    {
      name = "Ruse",
      desc = "Everyone Spy, disguised as friendly classes. Keep up the ruse as long as you can.",
      tags = ["any_map", "spy"]
    },
    {
      name = "The Blob",
      desc = "Everyone must stay touching at all times.",
      tags = ["any_map"]
    },
    {
      name = "FaZe Clan",
      desc = "Everyone Sniper, noscopes only. Scream \"Oooooooh!\" and play airhorns after every kill.",
      tags = ["any_map", "sniper", "mic"]
    },
    {
      name = "The Turtle",
      desc = "Everyone Engineer. Stay last and never leave.",
      tags = ["any_map", "engineer"]
    },
    {
      name = "Vomit Comet",
      desc = "Max DPI, sensitivity 6.",
      tags = ["any_map", "mouse"]
    },
    {
      name = "Red Light, Green Light",
      desc = "One player calls red light and green light. This determines the rest of the player's ability to move.",
      tags = ["any_map", "mic"]
    },
    {
      name = "Kill Confirmed",
      desc = "Whenever you get a kill, type \"KILL CONFIRMED\" into chat.",
      tags = ["any_map", "chat"]
    },
    {
      name = "The Slowpoke",
      desc = "Sensitivity 0.1.",
      tags = ["any_map", "mouse"]
    },
    {
      name = "Roger That",
      desc = "Communicate as if using a radio, for example saying \"Tango Down!\" or \"Target Spotted\". End anything you say with \"Over\".",
      tags = ["any_map", "mic"]
    },
    {
      name = "LEEEEEEEEROY",
      desc = "Everyone line up at a choke point. Shout \"LEEEEEEEEROY JEEEEEEEEEEEENNNNNKKKIIIINS!\" and charge into battle.",
      tags = ["any_map", "mic"]
    },
    {
      name = "The 360",
      desc = "Spin 360 degrees before shooting.",
      tags = ["any_map"]
    },
    {
      name = "The Legit 360",
      desc = "Spin 360 degrees in real life before shooting.",
      tags = ["any_map", "irl"]
    },
    {
      name = "Simon Says",
      desc = "The player with the highest score is Simon. Players must follow simon and do what he says",
      tags = ["any_map", "mic"]
    },
    {
      name = "GIT GUD",
      desc = "Every time you kill someone, say \"GIT GUD GET LMAOBOX\" in chat.",
      tags = ["any_map", "chat"]
    },
    {
      name = "I am Heavy Weapons Guy",
      desc = "Everyone Heavy. Never unrev your gun.",
      tags = ["any_map", "heavy"]
    },
    {
      name = "Swarm of Bees",
      desc = "Everyone Scout, everyone Bat. Everyone must move in a group while constantly attacking, and making buzzing noises over mic.",
      tags = ["any_map", "scout", "loadout", "mic"]
    },
    {
      name = "Blind Man's Bluff",
      desc = "One player must turn off their monitor, and rollout with the other player's help.",
      tags = ["any_map", "irl", "mic", "rollout"]
    },
    {
      name = "Gladiator",
      desc = "Only one player can leave spawn at a time.",
      tags = ["any_map"]
    },
    {
      name = "Winter",
      desc = "Everyone Demoman or Soldier, Jumper weapons and melee only.",
      tags = ["any_map", "loadout", "soldier", "demo"]
    },
    {
      name = "Permission",
      desc = "You must ask before you take a healthpack. Players must say \"Permission Granted\" or \"Permission Denied\" in response.",
      tags = ["any_map", "mic"]
    },
    {
      name = "Sorry, Ears",
      desc = "Everyone Scout, Frying Pans only.",
      tags = ["any_map", "loadout", "scout"]
    },
    {
      name = "Blood Price",
      desc = "Everyone Scout, Boston Basher only.",
      tags = ["any_map", "loadout", "scout"]
    },
    {
      name = "G'day!",
      desc = "Everyone Sniper. Never aim for the head, and taunt after every kill.",
      tags = ["any_map", "sniper"]
    },
    {
      name = "Bandit",
      desc = "Play with only one hand.",
      tags = ["any_map", "irl"]
    },
    {
      name = "W + M2",
      desc = "Everyone Pyro. Only yes the airblast.",
      tags = ["any_map", "pyro"]
    },
    {
      name = "Holiday Horror",
      desc = "Everyone Heavy. Punch enemies in the back, then try to get taunt kills.",
      tags = ["any_map", "loadout", "heavy"]
    },
    {
      name = "The Muselk",
      desc = "Only use loadouts in Muselk's top 10 loadout videos.",
      tags = ["any_map", "loadout"]
    },
    {
      name = "Kept you waiting, huh?",
      desc = "Instead of cloaking, use the Box Trot.",
      tags = ["any_map", "spy"]
    },
    {
      name = "Schadenfreude",
      desc = "Change your medic button to a killbind.",
      tags = ["any_map", "killbind"]
    },
    {
      name = "Slow Scout",
      desc = "Everyone Scout. Bind moving forward to mwheel up and backward to mwheel down. Move using the mouse wheel.",
      tags = ["any_map", "scout", "bind"]
    },
    {
      name = "High Value Target",
      desc = "Randomly choose one opponent. Your team must relentlessly focus them, and taunt upon killing them.",
      tags = ["any_map"]
    },
    {
      name = "MvM Scout",
      desc = "Everyone Scout. Use Fan-of-War and Mad Milk only.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Cheap Trading",
      desc = "Pick up any weapons you see.",
      tags = ["any_map"]
    },
    {
      name = "Aspiring Scout",
      desc = "Everyone Engineer. No building.",
      tags = ["any_map", "engineer"]
    },
    {
      name = "Reverso",
      desc = "Reverse your control bindings (forward = backwards, jump = crouch e.t.c.).",
      tags = ["any_map"]
    },
    {
      name = "Undercover",
      desc = "Wear typical F2P loadouts.",
      tags = ["any_map"]
    },
    {
      name = "Vice-Prez",
      desc = "One Soldier, everyone else Heavy. Soldier spends the round whipping the Heavies.",
      tags = ["any_map", "soldier", "heavy", "loadout"]
    },
    {
      name = "Baby Steps",
      desc = "Everyone Sniper, everyone The Classic. Constantly charge your shots.",
      tags = ["any_map", "sniper", "loadout"]
    },
    {
      name = "Spy Scout",
      desc = "Everyone Scout. Only use Bonk and Backscatter.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Death from Above",
      desc = "Everyone Soldier, use Airstrike and B.A.S.E. Jumper.",
      tags = ["any_map", "soldier", "loadout"]
    },
    {
      name = "TF:GO",
      desc = "Everyone Sniper, use SMG and Cleaner's Carbine.",
      tags = ["any_map", "sniper", "loadout"]
    },
    {
      name = "Slow and Steady",
      desc = "Crouch the whole time, no jumping.",
      tags = ["any_map"]
    },
    {
      name = "Medic Main Aim",
      desc = "Medics can only heal with crossbows.",
      tags = ["any_map", "medic"]
    },
    {
      name = "Deaf and Dumb",
      desc = "Mute the game audio and invert the mouse y-axis.",
      tags = ["any_map"]
    },
    {
      name = "Sticky Situation",
      desc = "Everyone Demoman, using two stickies to jump.",
      tags = ["any_map", "demoman"]
    },
    {
      name = "Invisible Army",
      desc = "Everyone Spy. Everyone use the Cloak and Dagger and hide on the control point.",
      tags = ["any_map", "spy", "loadout"]
    },
    {
      name = "Air Control",
      desc = "One person Soldier, everyone else Medic. Medics use the Quick-Fix and heal the Soldier.",
      tags = ["any_map", "soldier", "medic", "loadout"]
    },
    {
      name = "And my Favorite Class is the Spy",
      desc = "Everyone Spy, trickstabs only.",
      tags = ["any_map", "spy"]
    },
    {
      name = "Heavy Ammunition",
      desc = "Everyone Heavy using Brass Beast. No spinning down.",
      tags = ["any_map", "heavy", "loadout"]
    },
    {
      name = "Urine Trouble",
      desc = "Everyone Sniper. Use Sydney Sleeper, Jarate and Bushwacka.",
      tags = ["any_map", "sniper"]
    },
    {
      name = "Unlimited",
      desc = "Half the team medic, half the team engineer. Use Kritzkrieg and Widowmaker only.",
      tags = ["any_map", "engineer", "medic", "loadout"]
    },
    {
      name = "Steak and Bake",
      desc = "Everyone Heavy, using Steak, KGB and Brass Beast. Only use the Brass Beast with KGB crits.",
      tags = ["any_map"]
    },
    {
      name = "No Going Back",
      desc = "Unbind your backwards key.",
      tags = ["any_map", "unbind"]
    },
    {
      name = "Super Soaker",
      desc = "Only kill enemies soaked in Jarate or Mad Milk.",
      tags = ["any_map"]
    },
    {
      name = "Cheers, Love!",
      desc = "Everyone Scout, only use pistols.",
      tags = ["any_map", "scout"]
    },
    {
      name = "Uberchain",
      desc = "Everyone Medic. Do a Medic chain with ubersaws.",
      tags = ["any_map", "medic", "loadout"]
    },
    {
      name = "Tunnelvision",
      desc = "Shrink your FOV to 20.",
      tags = ["any_map", "fov"]
    },
    {
      name = "Stretch Armstrong",
      desc = "Increase your FOV to 130.",
      tags = ["any_map", "fov"]
    },
    {
      name = "Arrows",
      desc = "Rebind your movement keys to the arrow keys.",
      tags = ["any_map", "rebind"]
    },
    {
      name = "300",
      desc = "Everyone Sniper, Huntsman only. Synchronize your firing.",
      tags = ["any_map", "sniper", "loadout"]
    },
    {
      name = "Anti-Sixes",
      desc = "Do not use any 6s classes. Even Medic.",
      tags = ["any_map"]
    },
    {
      name = "Rift",
      desc = "Half the team Scout using Sun-on-a-Stick, half the team Pyro using Sharpened Volcano Fragment.",
      tags = ["any_map", "scout", "pyro", "loadout"]
    },
    {
      name = "Scattered Backs",
      desc = "Everyone Scout, using Bonk, Back Scatter and Boston Basher.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "1001 Demoknights",
      desc = "Everyone Demoman using Ali Baba Wee Booties, Splendid Screen and Persian Persuader.",
      tags = ["any_map", "sniper"]
    },
    {
      name = "Direct",
      desc = "Everyone Soldier or Demoman using Direct Hit or Loch-n-Load.",
      tags = ["any_map", "soldier", "demoman", "loadout"]
    },
    {
      name = "Crutch Party",
      desc = "Everyone Scout or Sniper using Sydney-Sleeper or Crit-a-Cola.",
      tags = ["any_map", "scout", "sniper", "loadout"]
    },
    {
      name = "Tag",
      desc = "You must melee someone before shooting them.",
      tags = ["any_map"]
    },
    {
      name = "Dance Like No One's Shooting At US",
      desc = "Rollout using moveable taunts.",
      tags = ["any_map"]
    },
    {
      name = "Scout's Honor",
      desc = "Everyone Scout, only play objectives and do not hurt the enemy.",
      tags = ["any_map", "scout"]
    },
    {
      name = "Appraisal",
      desc = "After killing an enemy, approach their corpse and say how much their loadout is worth in chat.",
      tags = ["any_map"]
    },
    {
      name = "Dubstep",
      desc = "Everyone medic, killbind any time you get 100% charge.",
      tags = ["any_map", "medic"]
    },
    {
      name = "2007scape",
      desc = "Vanilla loadouts.",
      tags = ["any_map"]
    },
    {
      name = "Schadenfreude",
      desc = "Taunt every time a teammate dies.",
      tags = ["any_map"]
    },
    {
      name = "i58",
      desc = "One player is the 'Kaidus'. He sits in spec and tells others what to do.",
      tags = ["any_map"]
    },
    {
      name = "Calcium",
      desc = "Everyone Scout, co-ordinate throwing Mad Milk at a single player all at once.",
      tags = ["any_map"]
    },
    {
      name = "Reversal",
      desc = "Bind your forward and backward movement keys to backward and forward respectively.",
      tags = ["any_map", "bind"]
    },
    {
      name = "Major League Gamer",
      desc = "Everyone Sniper, noscopes only.",
      tags = ["any_map"]
    },
    {
      name = "Flock of Eagles",
      desc = "Everyone Soldier, rocket jump around together.",
      tags = ["any_map", "soldier"]
    },
    {
      name = "An Elegant Weapon",
      desc = "Batsaber only.",
      tags = ["any_map"]
    },
    {
      name = "Russian Blood",
      desc = "Your team must share a single weapon, picking it up after teammates die.",
      tags = ["any_map"]
    },
    {
      name = "Mcree",
      desc = "Everyone Spy, everyone Ambassador.",
      tags = ["any_map", "spy"]
    },
    {
      name = "Moonwalker",
      desc = "Unbind all movement keys except your backwards movement key.",
      tags = ["any_map", "unbind", "bind"]
    },
    {
      name = "Allergic Reation",
      desc = "Spam your medic key, but killbind if you are healed by a Medic.",
      tags = ["any_map"]
    },
    {
      name = "Ambulophobia",
      desc = "Hold down crouch the entire game.",
      tags = ["any_map"]
    },
    {
      name = "Self Hatred",
      desc = "Focus players playing the same class as you exclusively.",
      tags = ["any_map"]
    },
    {
      name = "Kleptomania",
      desc = "Take health packs, ammo boxes and dropped weapons whenever possible.",
      tags = ["any_map"]
    },
    {
      name = "Why not Crab People?",
      desc = "Unbind your backwards and forwards movement keys.",
      tags = ["any_map", "bind", "unbind"]
    },
    {
      name = "Verbophobia",
      desc = "Rebind all of your voice and commands to killbind.",
      tags = ["any_map", "bind", "unbind"]
    },
    {
      name = "Sneaky Fatty",
      desc = "Everyone Heavy, everyone Tomislav. Keep your gun spun up at all times.",
      tags = ["any_map"]
    },
    {
      name = "Fingered",
      desc = "Switch your m1 and m2 binds.",
      tags = ["any_map", "bind"]
    },
    {
      name = "Consult a Doctor",
      desc = "Everyone Spy, everyone spycrab. When the time is right, strike.",
      tags = ["any_map"]
    },
    {
      name = "Divorced",
      desc = "Everyone Heavy, nobody use miniguns.",
      tags = ["any_map"]
    },
    {
      name = "Crusader Mentality",
      desc = "Everyone Medic, Crusader's Crossbow only.",
      tags = ["any_map"]
    },
    {
      name = "Born and Raised",
      desc = "During any match, try to get into a intelligent conversation, and when you do, repeatedly quote the Bel air Theme.",
      tags = ["any_map"]
    },
    {
      name = "DUI",
      desc = "Half of the Team as Demo, using the Sticky Jumper and Caber, the other Half as Medic with the Quick Fix.",
      tags = ["any_map", "Demoman", "Medic", "Loadout"]
    },
    {
      name = "Bunny",
      desc = "Everytime you jump in game, jump in real life.",
      tags = ["any_map"]
    },
    {
      name = "Demo Review",
      desc = "When you kill someone or you die, helpfully point out in chat what they could have done better.",
      tags = ["any_map"]
    },
    {
      name = "Critical Mass",
      desc = "Everyone Scout using Backscatter, Crit-a-Cola and Fan-o-War.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Genji",
      desc = "Everyone Soldier or Demoman, only use Half-Zatoichi.",
      tags = ["any_map", "demoman", "soldier", "loadout"]
    },
    {
      name = "Critical Mass",
      desc = "Everyone Scout using Backscatter, Crit-a-Cola and Fan-o-War.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Ambidextrous",
      desc = "Use the mouse with your non-dominant hand.",
      tags = ["any_map"]
    },
    {
      name = "Penetrator",
      desc = "Everyone Sniper, everyone Machina. Only fire with a fully-charged shot.",
      tags = ["any_map", "sniper", "loadout"]
    },
    {
      name = "Deadly Duck",
      desc = "Bind crouch key to killbind.",
      tags = ["any_map", "bind"]
    },
    {
      name = "Worst Case Scenario",
      desc = "Everyone Spy, only disguise as Heavy.",
      tags = ["any_map", "spy"]
    },
    {
      name = "Golden Sniper",
      desc = "Everyone Sniper, only kill players soaked in Jarate.",
      tags = ["any_map", "sniper", "loadout"]
    },
    {
      name = "Tarantino",
      desc = "Control the mouse with your foot.",
      tags = ["any_map"]
    },
    {
      name = "Team Fortress",
      desc = "Everyone Engineer, build a fort out of dispensers.",
      tags = ["any_map", "engineer"]
    },
    {
      name = "Planned Accidents",
      desc = "Kill enemies only with environmental hazards.",
      tags = ["any_map"]
    },
    {
      name = "Shark Infested Waters",
      desc = "Everyone Pyro, everyone Neon Annihilator, hide in the water.",
      tags = ["any_map", "pyro", "loadout"]
    },
    {
      name = "Dead Man Walking",
      desc = "Everyone Spy, everyone Your Eternal Reward and Dead Ringer.",
      tags = ["any_map", "spy", "loadout"]
    },
    {
      name = "Your Biggest Fan",
      desc = "Everyone Scout, everyone Fan o' War. Swarm one player constantly.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Medical Musician",
      desc = "Play Medic, heal only with the Amputator.",
      tags = ["any_map", "medic", "loadout"]
    },
    {
      name = "Uber Train",
      desc = "Everyone Medic, Ubersaw and Medigun only.",
      tags = ["any_map", "medic", "loadout"]
    },
    {
      name = "Revengineering",
      desc = "Everyone Medic and Engineer. Use Kritzkrieg and Widowmaker.",
      tags = ["any_map", "engineer", "medic", "loadout"]
    },
    {
      name = "mge me irl",
      desc = "cl_first_person_uses_world_model 1",
      tags = ["any_map", "console"]
    },
    {
      name = "Tank",
      desc = "Everyone Medic and Heavy. Use the Vaccinator and Fists of Steel to sponge as much damage as possible.",
      tags = ["any_map", "heavy", "medic", "loadout"]
    },
    {
      name = "Must be OP",
      desc = "Whenever you die, switch to the class that killed you.",
      tags = ["any_map"]
    },
    {
      name = "Like ster_ only different",
      desc = "Bind your forward movement key to killbind.",
      tags = ["any_map", "bind"]
    },
    {
      name = "Bastion",
      desc = "Everyone Heavy. Use Brass Beast, crouch and don't move.",
      tags = ["any_map", "heavy"]
    },
    {
      name = "Cyclone",
      desc = "+left in console",
      tags = ["any_map", "console"]
    },
    {
      name = "Bushido",
      desc = "Everyone Soldier or Demoman. Everyone Half-Zatoichi only.",
      tags = ["any_map", "demoman", "soldier", "loadout"]
    },
    {
      name = "Drop Dead and Give Me 20!",
      desc = "When you die do 20 pushups.",
      tags = ["any_map"]
    },
    {
      name = "Pathfinding",
      desc = "Never take the same route twice.",
      tags = ["any_map"]
    },
    {
      name = "The Floor is Lava",
      desc = "Stand on props, don't touch the floor. Because it's lava!",
      tags = ["any_map"]
    },
    {
      name = "Hard for Some",
      desc = "Killbind your taunt button for one whole week.",
      tags = ["any_map"]
    },
    {
      name = "Hearing Things",
      desc = "Wear your headphones backwards.",
      tags = ["any_map", "periphiel"]
    },
    {
      name = "OSU! is practice right?",
      desc = "Play using a graphics tablet, listening to anime music.",
      tags = ["any_map", "periphiel", "music"]
    },
    {
      name = "I'm walking 'ere!'",
      desc = "Everyone Scout, everyone Shortstop. Push enemies as much as possible!",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Dodgeball",
      desc = "Just don't get hit.",
      tags = ["any_map"]
    },
    {
      name = "Actual Loadouts",
      desc = "Use actual in game loadouts, like the Tankbuster.",
      tags = ["any_map"]
    },
    {
      name = "Silver Tongue",
      desc = "Talk the server into votekicking your buddy.",
      tags = ["any_map"]
    },
    {
      name = "i5X",
      desc = "Tryhard like you've never tried before!",
      tags = ["any_map"]
    },
    {
      name = "The Array7",
      desc = "Use Array7's loadouts.",
      tags = ["any_map"]
    },
    {
      name = "The Uncle",
      desc = "Use Uncle Dane's loadouts.",
      tags = ["any_map"]
    },
    {
      name = "Tracer",
      desc = "Everyone Scout, Pistol only.",
      tags = ["any_map", "scout", "loadout"]
    },
    {
      name = "Slenderclass",
      desc = "Only move when the enemy is not looking.",
      tags = ["any_map"]
    },
    {
      name = "Schmolt",
      desc = "Go Medic and keep dropping uber. When called out on it, claim that you meant to do it.",
      tags = ["any_map", "medic"]
    }
  ])
