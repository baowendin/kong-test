-- Extending the Base Plugin handler is optional, as there is no real
-- concept of interface in Lua, but the Base Plugin handler's methods
-- can be called from your child implementation and will print logs
-- in your `error.log` file (where all logs are printed).
local BasePlugin = require "kong.plugins.base_plugin"

local StreamTestHandler = BasePlugin:extend()


StreamTestHandler.VERSION  = "1.0.0"
StreamTestHandler.PRIORITY = 10


-- Your plugin handler's constructor. If you are extending the
-- Base Plugin handler, it's only role is to instantiate itself
-- with a name. The name is your plugin name as it will be printed in the logs.
function StreamTestHandler:new()
  StreamTestHandler.super.new(self, "my-custom-plugin")
end

function StreamTestHandler:init_worker()
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.init_worker(self)
  kong.log.err("in init")

  -- Implement any custom logic here
end


function StreamTestHandler:preread(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.preread(self)
  ngx.log(ngx.ERR, addr)
  -- Implement any custom logic here
end

--[[function StreamTestHandler:preread()
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    StreamTestHandler.super.preread(self)
    ngx.log(ngx.ERR, "in preread")
    local backend = "127.0.0.3"
    local port = "13333"
    local balancer = require "ngx.balancer"
    if blancer == nil then
      ngx.log(ngx.ERR, "balancer is nil")
      local backend_name = ngx.var.proxy_upstream_name
      ngx.log(ngx.ERR, string.format("not balancer %s", backend_name))
      return
    end

    local ok, err = ngx.balancer.set_current_peer(backend, port)
    if not ok then
        ngx.log(ngx.ERR, "failed to set the current peer: ", err)
    else 
      ngx.log(ngx.DEBUG, "current peer ", backend, ":", port)
    end 
  
    -- Implement any custom logic here
  end--]]


function StreamTestHandler:certificate(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.certificate(self)
  kong.log.err("in certificate")

  -- Implement any custom logic here
end

function StreamTestHandler:rewrite(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.rewrite(self)
  kong.log.err("in rewrite")

  -- Implement any custom logic here
end

function StreamTestHandler:access(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.access(self)
  kong.log.err("in access")


  -- Implement any custom logic here
end

function StreamTestHandler:header_filter(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.header_filter(self)
  kong.log.err("in head_filter")
  -- Implement any custom logic here
end

function StreamTestHandler:body_filter(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.body_filter(self)
  kong.log.err("in body_filter")

  -- Implement any custom logic here
end

function StreamTestHandler:log(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  StreamTestHandler.super.log(self)
  kong.log.err("in log")
  -- Implement any custom logic here
end

-- This module needs to return the created table, so that Kong
-- can execute those functions.
return StreamTestHandler
