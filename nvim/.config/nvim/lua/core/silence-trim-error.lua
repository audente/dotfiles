
-- Permanent silence for "Overriding existing directive trim!" – works 100%
local function silence_trim_error()
  local chunk = [[
    local query = require("vim.treesitter.query")
    local old_add = query.add_directive
    query.add_directive = function(name, ...)
      if name == "trim!" or name == "trim" then
        return  -- skip silently
      end
      return old_add(name, ...)
    end
  ]]

  -- Hook into require to patch BEFORE the error happens
  table.insert(package.loaders, 1, function(modname)
    if modname == "nvim-treesitter.query_predicates" then
      return function(...)
        local ok, err = pcall(function()
          local status, predicates = pcall(require, "nvim-treesitter.query_predicates")
          if status then
            vim.schedule(function()
              load(chunk)()
            end)
          end
          return predicates
        end)
        if not ok then error(err) end
      end
    end
  end)
end

silence_trim_error()


