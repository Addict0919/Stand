****************************
 LeFix' Speedometer v1.3
****************************

Overview:
1. Description
2. Installation
3. Known Bugs
4. Changelog
5. Credits
6. Links

****************
 1. Description
****************

Features:
-Analogue speedos for all vehicles
-Engine damage indicator
-RPM gauge and gear indicator (cars and motorcycles)
-Vertical speed gauge (planes and helicopters)

(External Mods Compatibility)
-Simple Fuel
-Manual Transmission

Changes in the mod menu have an instant effect on the hud.
(Provided that you're in the same vehicle type as the hud you're changing)

Open it with F10 (Default)
and navigate with:
-arrow keys, enter + esc
-numpad 2468,  5   +  0 
-Gamepad DPad, A   +  B

All settings can changed in the .ini files manually.


*****************
 2. Installation
*****************

1. Install the latest version of ScriptHookV by Alexander Blade

2. Extract the .rar into your GTA V main folder

   It should contain now:
    -LeFixSpeedo.asi
    -"LeFixSpeedo" folder

3. Edit the settings to your preferences!
    -Most settings using the ingame mod menu (F10)
    -Advanced settings by editing the .ini files manually
 
-----------------

Notes:
You can edit/replace any image.
(The filenames and the ratio have to be unchanged to work properly.)

The needle rotation is defined in the settingsExtended.ini for each speedo background.

***************
 3. Known Bugs
***************
-Sometimes the primary vehicle color in game looks slightly different than the color returned by the native method
    ->using the "primary vehicle color as needle color" feature, both colors won't match sometimes.
-There are some random chrashes which I couldn't solve so far, any hints when exactly you got a crash are welcome.

**************
 4. Changelog
**************

v1.3
-New Menu
-Updated memory addresses for 'Gun Running' DLC

v1.2.6
-four new DLC cars added 
-much more vehicles(rpm) are now listed (Sentric@GTA5Mods)

v1.2.5
-added three new brand pictures
-much more vehicles(brand) are now listed (Sentric@GTA5Mods)

v1.2.4
-reworked gear display for ikt transmission mod
(better flickering, top gear slightly red)
-mod menu info is now always visible (can be disabled)

v1.2.3e
-bugfix: GTA V update changed rpm/gear addresses
-better compatibility with ikt's Manual Transmission Mod (gear display matches 100%)
-handbrake notification as 'N' on gear display togglable now

v1.2.3d
-bugfix: speedo disappeared while driving with mouse
-bugfix: improved characterwheel detection (no more bugs using dpad)

v1.2.3c
-changed name of fuel hud pictures
(now matches the decorator name)
-fuel hud will be visible if at least one of the three decorators is modified by an external mod

v1.2.3b
-minor bugfix: 'Use high speedo' isn't saved correctly

v1.2.3a
-bugfix: didn't fade out hud when using mobile phone in helis/planes
-bugfix: HUD fades out with ikt's update of 'Manual Transmission' mod installed.
-Removed fuel setting. Auto-detects if external fuel mod shares its data.

v1.2.3
-bugfix: didn't switched to next speedo background if max velocity is reached
-added shift up/down indicator (pictures and flashing gear/leds)
-got rid of gameversion setting

v1.2.2c
-bugfix: acceleration time not displayed properly
 (digit gap wasn't indepent of screen resolution)
-bugfix: gear shows desired gear
 (almost always same value as current gear)

v1.2.2b
-gear isn't an estimation anymore

v1.2.2a
-updated to latest version of ScriptHookV 
-added fuel test.asi and source 
-bugfix: only deacceleration test has worked 

v1.2.2
-added acceleration test 

v1.2.1a
-bugfix: white damage indicator

v1.2.1
-added fuel gauge for external fuel mods
(values of these mods can be shown on the speedo hud)

v1.2.0b
-added three real life brands as example
-changed size of brand images (same as speedo background now)

v1.2.0a
-more brand logos 
-bugfix: couldn't navigate in 'Toggle HUD' 
-bugfix: wrong needle rotation 
-changed default background of muscle cars back to 180mph

v1.2
-brand logo added
-cleaned mod menu
-finished reorganisation of inis
-better support for vehicle mods

v1.1.4
-fixed minor bugs
-added ingame menu info
-prepared optional brand logo
-reworked settings behavior and files
-fixed interchanged names in settings.ini

v1.1.3
-reworked the menu (reduced lines of code and improved GUI)
-slow cars (trucks/offroad etc. will use low speedo background)
-using rpm leds won't disable the gear indicator anymore
-optional fadeout as passenger
-renamed INI file and moved to LeFixSpeedo folder (!)

v1.1.2b
-bugfix: no velocity needle in planes when vertical speed is shown
-bugfix: doesn't save extra gauge position correctly

v1.1.2a
-gameversion setting more understandable (text changed)

v1.1.2
-Added optional RPM LEDs (F1 like)
-Added hint if gameversion is set wrong
-Correct fade out while using the internet
-Improved code for needle color (primary vehicle color)

v1.1.1
-added train support (J10/Pearson's mod recommended: https://www.gta5-mods.com/scripts/railroad-engineer)

v1.1
-added mod menu (with gamepad support)
-reorganized picture folder
-added vertical speed gauge for planes/helicopters

v1.0.8a
-Revised the readme.

v1.0.8
-bigger range of valid values for hud offset and hud size supporting ultrawidescreen and very high resolution

v1.0.7
-added a speedfactor, default is 1.0 like before
 e.g. Increase it in planes so the speedo shows more realistic values for planes
 e.g. Decrease it in cars in order to show the speed it actually looks like

v1.0.6a
-fixed static needle in boats in case of 'useHighSpeedo' set to true/1

v1.0.6
-added plane specific speedo (up to the maximum speed of the gameengine)
-now boat actually uses slower background if game is not modified
-removed optional anchor, completely independ mod now

v1.0.5
-added options to set the intensity and freqency of the damage indicator
-damage indicator is now optional
-only reloads settings.ini when pressing F10 twice (outdated)
-changed images need game restart (outdated)

v1.0.4
-added option to use vehicles primary color for the needle
-Removed small gear bug. No longer jumps between two gears. (Gamepad users)

v1.0.3
-much more accurate shifts for gamepad users (50% throttle etc.)
-small loss of accuracy on keyboard :/

v1.0.2
-added boat anchor

v1.0.1
-changed some graphics
-added the toggle key setting again
-display N while using handbrake
-donwshifting is way more accurate
-changed the damage indicator slightly

v1.0
-rewritten the majority of code
-added gear indicator

v0.9.1
-added slightly lower speedo for slower cars

v0.9
-added damage indicator
-added optional FPV fadeout

v0.8.1
-improved rpm gauge
-added boat speedo (horizontal speed)
-added options to enable/disable speedo in different types of vehicle

v0.8
-added bicycle speedo
-Better opacity during day/night cycle

v0.7.2
-more realistic rpm values
-added color setting for needles

v0.7.1
-added gameversion setting to fix RPM

v0.7
-HUD is correct on every screenratio and sreenresolution
-RPM works

v0.6.1
-HUD is now resizable
-Chooseable key to toggle the mod

v0.6
-added adjustable background
-few code optimizations

v0.5
-new/better graphcis
-added rpm gauge
-added placement settings
-F9 to activate/refresh and F10 deactivate the mod


v0.4
-basic ini settings implemented
-easier installation

v0.3
-added MPH Version

v0.2
-fixed FPS loss


************
 5. Credits
************

Thanks to:

-Alexender Blade
 for ScriptHookV and his speedo sample I started with

-XMOD
 for helping me to read specific values of vehicles from the memory

-machine4578
 for testing dozens of times and giving feedback

-ikt
 for sharing important informations about the gear offset and values
 and other code stuff

**********
 6. Links
**********

Check for updates on
https://de.gta5-mods.com/scripts/speedometer-improvedalexbladeversion

Questions or suggestions?
->Contact me with an email:
gaming@die-optimisten.net


Thanks for reading.

LeFix