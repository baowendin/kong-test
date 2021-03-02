-- Extending the Base Plugin handler is optional, as there is no real
-- concept of interface in Lua, but the Base Plugin handler's methods
-- can be called from your child implementation and will print logs
-- in your `error.log` file (where all logs are printed).
local BasePlugin = require "kong.plugins.base_plugin"
local counter = ngx.shared.temp_counter

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
  ngx.log(ngx.ERR, "in preread")

  -- Implement any custom logic here
end

function StreamTestHandler:preread()
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    StreamTestHandler.super.preread(self)
    ngx.log(ngx.ERR, "in preread")
  
    -- Implement any custom logic here
  end


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
  counter:incr("counter", 1)

  -- Implement any custom logic here
end

-- This module needs to return the created table, so that Kong
-- can execute those functions.
return StreamTestHandler