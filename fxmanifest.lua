--[[
--------------------------------------------------

This file is part of DRIP.
You are free to use these files within your own resources.
Please retain the original credit and attached MIT license.
Support honest development.

Author: Case @ BOII Development
License: MIT (https://github.com/boiidevelopment/drip/blob/main/LICENSE)
GitHub: https://github.com/boiidevelopment/drip

--------------------------------------------------
]]

fx_version "cerulean"
games { "gta5", "rdr3" }

name "drip"
version "1.0.1"
description "A drawn interface pack for CFX platforms."
author "Case"
repository "https://github.com/boiidevelopment/drip"
lua54 "yes"

client_scripts {
    "drip/init.lua",
    "drip/components/*.lua"
}