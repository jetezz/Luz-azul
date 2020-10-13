##-----------------------------LICENSE NOTICE------------------------------------
##  This file is part of CPCtelera: An Amstrad CPC Game Engine 
##  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU Lesser General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##------------------------------------------------------------------------------
############################################################################
##                        CPCTELERA ENGINE                                ##
##                 Automatic image conversion file                        ##
##------------------------------------------------------------------------##
## This file is intended for users to automate image conversion from JPG, ##
## PNG, GIF, etc. into C-arrays.                                          ##
############################################################################

##
## NEW MACROS
##

## 16 colours palette
#PALETTE=0 1 2 3 5 6 9 11 15 18 19 20 21 22 24 26
PALETTE=0 5 15 1 10 19 3 16 7 4 5 25 17 13 6 26

## Default values
#$(eval $(call IMG2SP, SET_MODE        ,0                  ))  #{ 0, 1, 2 }
#$(eval $(call IMG2SP, SET_MASK        , none               ))  { interlaced, none }
$(eval $(call IMG2SP, SET_FOLDER      , src/sprites/               ))
#$(eval $(call IMG2SP, SET_EXTRAPAR    ,                    ))
#$(eval $(call IMG2SP, SET_IMG_FORMAT  , sprites            ))	{ sprites, zgtiles, screen }
#$(eval $(call IMG2SP, SET_OUTPUT      , c                  ))  { bin, c }
$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
#$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), g_palette ))
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Principal.png , 8,8 , Character_Principal, PALETTE, Character_Principal)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move1_G.png , 8,8 , Block_Move1_G, Block_Move1_GPALETTE, Block_Move1_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move1_B.png , 8,8 , Block_Move1_B, Block_Move1_BPALETTE, Block_Move1_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static1_G.png , 8,8 , Block_Static1_G, Block_Static1_GPALETTE, Block_Static1_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static1_B.png , 8,8 , Block_Static1_B, Block_Static1_BPALETTE, Block_Static1_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static2_G.png , 8,8 , Block_Static2_G, Block_Static2_GPALETTE, Block_Static2_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static2_B.png , 8,8 , Block_Static2_B, Block_Static2_BPALETTE, Block_Static2_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static3_G.png , 8,8 , Block_Static3_G, Block_Static3_GPALETTE, Block_Static3_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static3_B.png , 8,8 , Block_Static3_B, Block_Static3_BPALETTE, Block_Static3_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static4_G.png , 8,8 , Block_Static4_G, Block_Static4_GPALETTE, Block_Static4_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static4_B.png , 8,8 , Block_Static4_B, Block_Static4_BPALETTE, Block_Static4_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move2_G.png , 8,8 , Block_Move2_G, Block_Move2_GPALETTE, Block_Move2_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move2_B.png , 8,8 , Block_Move2_B, Block_Move2_BPALETTE, Block_Move2_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PortalWall.png , 8,8 , PortalWall, PortalWallPALETTE, PortalWall)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PortalDoor_G.png , 8,8 , PortalDoor_G, PortalDoor_GPALETTE, PortalDoor_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PortalDoor_B.png , 8,8 , PortalDoor_B, PortalDoor_BPALETTE, PortalDoor_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Door_G.png , 8,8 , Door_G, Door_GPALETTE, Door_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Door_B.png , 8,8 , Door_B, Door_BPALETTE, Door_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Hole.png , 8,8 , Block_Hole, Block_HolePALETTE, Block_Hole)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/LuzAzul.png , 8,8 , LuzAzul, LuzAzulPALETTE, LuzAzul)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Brother.png , 8,8 , Character_Brother, Character_BrotherPALETTE, Character_Brother)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Sister.png , 8,8 , Character_Sister, Character_SisterPALETTE, Character_Sister)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Mother.png , 8,8 , Character_Mother, Character_MotherPALETTE, Character_Mother)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Father.png , 8,8 , Character_Father, Character_FatherPALETTE, Character_Father)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Amstrad.png , 8,8 , Amstrad, AmstradPALETTE, Amstrad)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_Tape.png , 8,8 , PrinceOfPersia_Tape, PrinceOfPersia_TapePALETTE, PrinceOfPersia_Tape)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_PJ_G.png , 8,8 , PrinceOfPersia_PJ_G, PrinceOfPersia_PJ_GPALETTE, PrinceOfPersia_PJ_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_PJ_B.png , 8,8 , PrinceOfPersia_PJ_B, PrinceOfPersia_PJ_BPALETTE, PrinceOfPersia_PJ_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_ENE_G.png , 8,8 , PrinceOfPersia_ENE_G, PrinceOfPersia_ENE_GPALETTE, PrinceOfPersia_ENE_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_ENE_B.png , 8,8 , PrinceOfPersia_ENE_B, PrinceOfPersia_ENE_BPALETTE, PrinceOfPersia_ENE_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_COVER.png , 8,8 , PrinceOfPersia_COVER, PrinceOfPersia_COVERPALETTE, PrinceOfPersia_COVER)) #8x16










































#Tiles
$(eval $(call IMG2SP, SET_FOLDER      , src/mapa/               ))
$(eval $(call IMG2SP, SET_IMG_FORMAT  , zgtiles            ))	
$(eval $(call IMG2SP, CONVERT         , tiles.png , 8, 8, tiles, PALETTE2, tiles))



##
## OLD MACROS (For compatibility)
##

## Example firmware palette definition as variable in cpct_img2tileset format

#PALETTE={0 1 3 4 7 9 10 12 13 16 19 20 21 24 25 26}

## AUTOMATED IMAGE CONVERSION EXAMPLE (Uncomment EVAL line to use)
##
##    This example would convert img/example.png into src/example.{c|h} files.
##    A C-array called pre_example[24*12*2] would be generated with the definition
##    of the image example.png in mode 0 screen pixel format, with interlaced mask.
##    The palette used for conversion is given through the PALETTE variable and
##    a pre_palette[16] array will be generated with the 16 palette colours as 
##	  hardware colour values.

#$(eval $(call IMG2SPRITES,tiles.png,0,g,8,8,$(PALETTE),zgtiles,src/,hwpalette))



############################################################################
##              DETAILED INSTRUCTIONS AND PARAMETERS                      ##
##------------------------------------------------------------------------##
##                                                                        ##
## Macro used for conversion is IMG2SPRITES, which has up to 9 parameters:##
##  (1): Image file to be converted into C sprite (PNG, JPG, GIF, etc)    ##
##  (2): Graphics mode (0,1,2) for the generated C sprite                 ##
##  (3): Prefix to add to all C-identifiers generated                     ##
##  (4): Width in pixels of each sprite/tile/etc that will be generated   ##
##  (5): Height in pixels of each sprite/tile/etc that will be generated  ##
##  (6): Firmware palette used to convert the image file into C values    ##
##  (7): (mask / tileset / zgtiles)                                       ##
##     - "mask":    generate interlaced mask for all sprites converted    ##
##     - "tileset": generate a tileset array with pointers to all sprites ##
##     - "zgtiles": generate tiles/sprites in Zig-Zag pixel order and     ##
##                  Gray Code row order                                   ##
##  (8): Output subfolder for generated .C/.H files (in project folder)   ##
##  (9): (hwpalette)                                                      ##
##     - "hwpalette": output palette array with hardware colour values    ##
## (10): Aditional options (you can use this to pass aditional modifiers  ##
##       to cpct_img2tileset)                                             ##
##                                                                        ##
## Macro is used in this way (one line for each image to be converted):   ##
##  $(eval $(call IMG2SPRITES,(1),(2),(3),(4),(5),(6),(7),(8),(9), (10))) ##
##                                                                        ##
## Important:                                                             ##
##  * Do NOT separate macro parameters with spaces, blanks or other chars.##
##    ANY character you put into a macro parameter will be passed to the  ##
##    macro. Therefore ...,src/sprites,... will represent "src/sprites"   ##
##    folder, whereas ...,  src/sprites,... means "  src/sprites" folder. ##
##                                                                        ##
##  * You can omit parameters but leaving them empty. Therefore, if you   ##
##  wanted to specify an output folder but do not want your sprites to    ##
##  have mask and/or tileset, you may omit parameter (7) leaving it empty ##
##     $(eval $(call IMG2SPRITES,imgs/1.png,0,g,4,8,$(PAL),,src/))        ##
############################################################################
