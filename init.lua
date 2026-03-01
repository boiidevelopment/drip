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

--- @script init
--- @description Main initialization file

--- @section Bootstrap

drip = setmetatable({}, { __index = _G })

--- @section Namespace Protection

SetTimeout(250, function()
    setmetatable(drip, {
        __newindex = function(_, key)
            error("Attempted to modify locked namespace", 2)
        end
    })
    
    print("[drip] namespace locked and ready")
end)