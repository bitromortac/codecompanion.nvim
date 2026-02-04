local h = require("tests.helpers")

local new_set = MiniTest.new_set

local child = MiniTest.new_child_neovim()
local T = new_set({
  hooks = {
    pre_case = function()
      h.child_start(child)
      child.lua([[
        -- Setup test directory
        _G.TEST_CWD = vim.fn.tempname()
        _G.TEST_DIR = 'tests/stubs/reproduce_issue'
        _G.TEST_DIR_ABSOLUTE = vim.fs.joinpath(_G.TEST_CWD, _G.TEST_DIR)

        -- Create test directory structure
        vim.fn.mkdir(_G.TEST_DIR_ABSOLUTE, 'p')

        _G.TEST_TMPFILE = vim.fs.joinpath(_G.TEST_DIR_ABSOLUTE, "issue_repro.txt")

        h = require('tests.helpers')
        chat, tools = h.setup_chat_buffer()
      ]])
    end,
    post_case = function()
      child.lua([[
        pcall(vim.loop.fs_unlink, _G.TEST_TMPFILE)
        h.teardown_chat_buffer()
      ]])
    end,
    post_once = child.stop,
  },
})

T["Reproduction"] = new_set()

T["Reproduction"]["reproduces empty line issue with exact match containing empty lines"] = function()
  child.lua([[
    -- Create the file exactly as described
    -- "This is some text\n\nwith an empty line in between.\nThis is something else"
    local content = "This is some text\n\nwith an empty line in between.\nThis is something else"
    local ok = vim.fn.writefile(vim.split(content, "\n"), _G.TEST_TMPFILE)
    assert(ok == 0)

    local tool = {
      {
        ["function"] = {
          name = "insert_edit_into_file",
          arguments = string.format('{"filepath": "%s", "edits": [{"oldText": "This is some text\\n\\nwith an empty line in between.", "newText": ""}]}', _G.TEST_TMPFILE)
        },
      },
    }

    tools:execute(chat, tool)
    vim.wait(100)
  ]])

  local output = child.lua_get("vim.fn.readfile(_G.TEST_TMPFILE)")
  -- Expected behavior: Lines 1-3 deleted. Remaining: "This is something else"
  -- User reported behavior: Includes an empty line? Or "This is some text"?
  
  -- Let's assert what it *should* be and see if it fails
  h.eq(output, { "This is something else" }, "Content should be properly deleted")
end

return T
