local BasePlugin = require "kong.plugins.base_plugin"
local pool = ngx.shared.ip_pool
local FairBalanceHandler = BasePlugin:extend()


FairBalanceHandler.PRIORITY = 2000

function FairBalanceHandler:new()
    FairBalanceHandler.super.new(self, "fair-balance")
end

-- In init_worker(), we should initalize the shared dict and input some IPs into it
function FairBalanceHandler:init_worker()
    FairBalanceHandler.super.init_worker(self)

    local number, err = pool:get("ip_number")
    if number then
        return 
    end

    -- TODO: Error Detect for all
    local success, err, forcible = pool:set("ip_number", 3)
    
    local success, err, forcible = pool:set("1", "127.0.1.1")
    local success, err, forcible = pool:set("2", "127.0.1.2")
    local success, err, forcible = pool:set("3", "127.0.1.3")

    local success, err, forcible = pool:set("127.0.1.1", 0)
    local success, err, forcible = pool:set("127.0.1.2", 0)
    local success, err, forcible = pool:set("127.0.1.3", 0)
end

function FairBalanceHandler:preread(config)
    FairBalanceHandler.super.preread(config)
    --TODO: nginx function to redirect
    local count, err = pool:get("ip_number") 
    if not count then
        ngx.log(ngx.ERR, "Can't get ip number!")
    end
    for i = 1,ip_number,1 do
        local ip, err = pool:get(tostring(i))
        ngx.log(ngx.err, "The "..i.."'s ip is:"..ip)
    end
end

return FairBalanceHandler