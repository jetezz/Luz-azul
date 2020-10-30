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
PALETTE=0 23 17 5 1 14 26 2 9 13 3 10 23 23 12 

## Default values
#$(eval $(call IMG2SP, SET_MODE        ,0                  ))  #{ 0, 1, 2 }
#$(eval $(call IMG2SP, SET_MASK        , none               ))  { interlaced, none }
$(eval $(call IMG2SP, SET_FOLDER      , src/sprites/               ))
#$(eval $(call IMG2SP, SET_EXTRAPAR    ,                    ))
#$(eval $(call IMG2SP, SET_IMG_FORMAT  , sprites            ))	{ sprites, zgtiles, screen }
#$(eval $(call IMG2SP, SET_OUTPUT      , c                  ))  { bin, c }
$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
#$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), g_palette ))
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Principal.png , 8,8 , Character_Principal )) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Principal_2.png , 8,8 , Character_Principal_2 )) #8x16

$(eval $(call IMG2SP, CONVERT         , sprites/muerte1.png , 8,8 , muerte1 )) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/muerte2.png , 8,8 , muerte2 )) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/muerte3.png , 8,8 , muerte3 )) #8x16


$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move1_G.png , 8,8 , Block_Move1_G  )) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move1_B.png , 8,8 , Block_Move1_B )) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move0_G.png , 8,8 , Block_Move0_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move0_B.png , 8,8 , Block_Move0_B)) #8x16

$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static1_G.png , 8,8 , Block_Static1_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static1_B.png , 8,8 , Block_Static1_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static2_G.png , 8,8 , Block_Static2_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static2_B.png , 8,8 , Block_Static2_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static3_G.png , 8,8 , Block_Static3_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static3_B.png , 8,8 , Block_Static3_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static4_G.png , 8,8 , Block_Static4_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static4_B.png , 8,8 , Block_Static4_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static5_G.png , 8,8 , Block_Static5_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static5_B.png , 8,8 , Block_Static5_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static6_G.png , 8,8 , Block_Static6_G,)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static6_B.png , 8,8 , Block_Static6_BB)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static7_G.png , 8,8 , Block_Static7_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static7_B.png , 8,8 , Block_Static7_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static8_G.png , 8,8 , Block_Static8_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static8_B.png , 8,8 , Block_Static8_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static9_G.png , 8,8 , Block_Static9_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Static9_B.png , 8,8 , Block_Static9_B)) #8x16









$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move2_G.png , 8,8 , Block_Move2_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Block_Move2_B.png , 8,8 , Block_Move2_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PortalWall.png , 8,8 , PortalWall)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PortalDoor_G.png , 8,8 , PortalDoor_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PortalDoor_B.png , 8,8 , PortalDoor_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Wall_Dust_B.png , 8,8 , Wall_Dust_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Wall_Solid1.png , 8,8 , Wall_Solid1)) #8x16


$(eval $(call IMG2SP, CONVERT         , sprites/Door_G.png , 8,8 , Door_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Door_B.png , 8,8 , Door_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/StairUp1_G.png , 8,8 , StairUp1_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/StairUp1_B.png , 8,8 , StairUp1_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/StairDown1_G.png , 8,8 , StairDown1_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/StairDown1_B.png , 8,8 , StairDown1_B)) #8x16





$(eval $(call IMG2SP, CONVERT         , sprites/Block_Hole.png , 8,8 , Block_Hole, Block_HolePALETTE)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Hole_1.png , 8,8 , Hole_1)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Hole_2.png , 8,8 , Hole_2)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Hole_3.png , 8,8 , Hole_3)) #8x16

$(eval $(call IMG2SP, CONVERT         , sprites/LuzAzul.png , 8,8 , LuzAzul)) #8x16

$(eval $(call IMG2SP, CONVERT         , sprites/Character_Brother.png , 8,8 , Character_Brother)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Sister.png , 8,8 , Character_Sister)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Mother.png , 8,8 , Character_Mother)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Character_Father.png , 8,8 , Character_Father)) #8x16

$(eval $(call IMG2SP, CONVERT         , sprites/Enemy_01.png , 8,8 , Enemy_01)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Enemy_02.png , 8,8 , Enemy_02)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/Enemy_03.png , 8,8 , Enemy_03)) #8x16


$(eval $(call IMG2SP, CONVERT         , sprites/zul1_1.png , 8,8 , zul1_1)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/zul1_2.png , 8,8 , zul1_2)) #8x16



$(eval $(call IMG2SP, CONVERT         , sprites/Amstrad.png , 8,8 , Amstrad)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_Tape.png , 8,8 , PrinceOfPersia_Tape)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_PJ_G.png , 8,8 , PrinceOfPersia_PJ_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_PJ_B.png , 8,8 , PrinceOfPersia_PJ_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_ENE_G.png , 8,8 , PrinceOfPersia_ENE_G)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_ENE_B.png , 8,8 , PrinceOfPersia_ENE_B)) #8x16
$(eval $(call IMG2SP, CONVERT         , sprites/PrinceOfPersia_COVER.png , 8,8 , PrinceOfPersia_COVER)) #8x16

$(eval $(call IMG2SP, CONVERT         , sprites/MenuSelector.png , 4,4 , MenuSelector)) #4x8

$(eval $(call IMG2SP, CONVERT         , sprites/mapa1.png , 34,15 , mapa1)) #34x30
$(eval $(call IMG2SP, CONVERT         , sprites/mapa2.png , 34,15 , mapa2)) #34x30
$(eval $(call IMG2SP, CONVERT         , sprites/mapa3.png , 34,15 , mapa3)) #34x30
$(eval $(call IMG2SP, CONVERT         , sprites/mapa4.png , 34,15 , mapa4)) #34x30











$(eval $(call IMG2SP, SET_OUTPUT      , bin                ))  
$(eval $(call IMG2SP, SET_IMG_FORMAT  , screen            ))	


$(eval $(call IMG2SP, CONVERT         , sprites/Menu3.png , 0,0,menu)) 
$(eval $(call IMG2SP, CONVERT         , sprites/Controls.png , 0,0,Controls)) 



$(eval $(call IMG2SP, SET_OUTPUT      , c                  ))  
$(eval $(call IMG2SP, SET_IMG_FORMAT  , sprites            ))	


































#Tiles
$(eval $(call IMG2SP, SET_FOLDER      , src/mapa/               ))
$(eval $(call IMG2SP, SET_IMG_FORMAT  , zgtiles            ))	
$(eval $(call IMG2SP, CONVERT         , mapas/Walls.png , 8, 8, tiles))






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
