local h = require("tests.helpers")

local new_set = MiniTest.new_set
local T = new_set()

local child = MiniTest.new_child_neovim()
T = new_set({
  hooks = {
    pre_case = function()
      h.child_start(child)
      child.lua([[
        codecompanion = require("codecompanion")
        h = require('tests.helpers')
        _G.chat, _G.tools = h.setup_chat_buffer()
      ]])
    end,
    post_case = function()
      child.lua([[h.teardown_chat_buffer()]])
    end,
    post_once = child.stop,
  },
})

T["Chat Injection"] = new_set()

T["Chat Injection"]["injects message immediately when idle"] = function()
  child.lua([[
    _G.chat.status = "idle"
    _G.chat:inject_message("Hello World")
  ]])

  local messages = child.lua_get([[_G.chat.messages]])
  -- System prompt is index 1
  h.eq("user", messages[2].role)
  h.eq("Hello World", messages[2].content)
end

T["Chat Injection"]["queues message when running"] = function()
  child.lua([[
    _G.chat.status = "running"
    _G.chat:inject_message("Queued Message")
  ]])

  local queue = child.lua_get([[_G.chat.injection_queue]])
  h.eq(1, #queue)
  h.eq("Queued Message", queue[1].content)
  h.eq("user", queue[1].role)

  -- Verify it's NOT in messages yet (only system prompt)
  local messages = child.lua_get([[_G.chat.messages]])
  h.eq(1, #messages)
end

T["Chat Injection"]["drains queue when tools are done"] = function()
  child.lua([[
    _G.chat.status = "running"
    _G.chat:inject_message("Delayed Message")
    
    -- Simulate tools finishing and calling the drain logic
    -- We assume tools_done or similar will be called, or we manually call a drain method if we expose one.
    -- For now, let's assume we implement a drain_queue method or verify behavior via tools_done.
    -- The plan says "Lifecycle Hook: Modify tools_done ... to drain the queue".
    -- Let's assume we can trigger the draining manually for the test or call tools_done.
    
    -- For the test, we'll implement check_injection_queue() in the class as a helper/public method?
    -- Or we can just call tools_done() if it's safe. 
    -- Let's try calling check_injection_queue which seems like a good name for the internal method, 
    -- but usually we want to test the public API.
    
    -- We'll assume the implementation will put this in a method we can call.
    -- Let's stick to the plan: "Modify tools_done".
    -- But tools_done might be complex to mock fully.
    
    -- Let's assume we can call `chat:check_injection_queue()` 
    -- (I will implement this method as part of the lifecycle integration).
    
    _G.chat:check_injection_queue()
  ]])

  local messages = child.lua_get([[_G.chat.messages]])
  local queue = child.lua_get([[_G.chat.injection_queue]])
  
  -- Should be moved from queue to messages
  h.eq(0, #queue)
  h.eq("user", messages[2].role)
  h.eq("Delayed Message", messages[2].content)
end

return T
