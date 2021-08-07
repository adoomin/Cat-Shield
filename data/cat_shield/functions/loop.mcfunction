#스코어 보드 설정
scoreboard objectives add CatShield dummy
scoreboard players add @p[nbt={SelectedItem:{id:"minecraft:shield",tag:{CustomModelData:CatShield}}}] CatShield 1
execute if score @p[nbt={SelectedItem:{id:"minecraft:shield",tag:{CustomModelData:CatShield}}}] CatShield matches 1.. run scoreboard players set @p[nbt={SelectedItem:{id:"minecraft:shield",tag:{CustomModelData:CatShield}}}] CatShield 1
execute if score @p[nbt=!{SelectedItem:{id:"minecraft:shield",tag:{CustomModelData:CatShield}}}] CatShield matches 1.. run scoreboard players set @p[nbt=!{SelectedItem:{id:"minecraft:shield",tag:{CustomModelData:CatShield}}}] CatShield 0

#방패를 들었을 때

##소환##
execute as @p[scores={CatShield=1..},tag=!handedCatShield] at @s run summon minecraft:armor_stand ~ ~2 ~ {Tags:["center"],NoGravity:1,Invisible:1}
execute as @p[scores={CatShield=1..},tag=!handedCatShield] at @s as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["cat0"],Passengers:[{id:"minecraft:cat",NoGravity:1b,Sitting:1b,CatType:0,Tags:["e_cat0"],DeathLootTable:"minecraft:empty"}]}
execute as @p[scores={CatShield=1..},tag=!handedCatShield] at @s as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["cat1"],Passengers:[{id:"minecraft:cat",NoGravity:1b,Sitting:1b,CatType:1,Tags:["e_cat1"],DeathLootTable:"minecraft:empty"}]}
execute as @p[scores={CatShield=1..},tag=!handedCatShield] at @s as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["cat2"],Passengers:[{id:"minecraft:cat",NoGravity:1b,Sitting:1b,CatType:2,Tags:["e_cat2"],DeathLootTable:"minecraft:empty"}]}
execute as @p[scores={CatShield=1..},tag=!handedCatShield] at @s as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Tags:["cat3"],Passengers:[{id:"minecraft:cat",NoGravity:1b,Sitting:1b,CatType:3,Tags:["e_cat3"],DeathLootTable:"minecraft:empty"}]}
execute as @p[scores={CatShield=1..},tag=!handedCatShield] at @s run playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 1 1

tag @p[scores={CatShield=1..},tag=!handedCatShield] add handedCatShield
tag @p[scores={CatShield=1..},tag=!handedCatShield] remove handedCatShield

##소환 후 동작##
execute as @p[scores={CatShield=1..}] at @s run tp @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] ~ ~2 ~
execute as @p[scores={CatShield=1..}] at @s run execute as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] at @s run teleport @s ~ ~ ~ ~5 ~
execute as @p[scores={CatShield=1..}] at @s run execute as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] at @s run tp @e[type=minecraft:armor_stand,nbt={Tags:["cat0"]}] ^2 ^-2.5 ^
execute as @p[scores={CatShield=1..}] at @s run execute as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] at @s run tp @e[type=minecraft:armor_stand,nbt={Tags:["cat1"]}] ^ ^-2.5 ^-2
execute as @p[scores={CatShield=1..}] at @s run execute as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] at @s run tp @e[type=minecraft:armor_stand,nbt={Tags:["cat2"]}] ^-2 ^-2.5 ^
execute as @p[scores={CatShield=1..}] at @s run execute as @e[type=minecraft:armor_stand,nbt={Tags:["center"]}] at @s run tp @e[type=minecraft:armor_stand,nbt={Tags:["cat3"]}] ^ ^-2.5 ^2

#방패를 들지 않았을 때
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:armor_stand,nbt={Tags:["center"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:armor_stand,nbt={Tags:["cat0"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:armor_stand,nbt={Tags:["cat1"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:armor_stand,nbt={Tags:["cat2"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:armor_stand,nbt={Tags:["cat3"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:cat,nbt={Tags:["e_cat0"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:cat,nbt={Tags:["e_cat1"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:cat,nbt={Tags:["e_cat2"]}]
execute as @p[scores={CatShield=0}] at @s run kill @e[type=minecraft:cat,nbt={Tags:["e_cat3"]}]

tag @p[scores={CatShield=0}] remove handedCatShield