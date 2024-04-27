
local M = {}

-- Function to open files referenced as [[<string>]] under cursor
function M.open_bracketed_file()
  local text = vim.api.nvim_get_current_line()

  -- Match the string between square brackets
  local pattern = '%[%[.+%]%]'

  -- Use string.match to find the first capture
  local captured_string = string.match(text, pattern)

  if captured_string then
    -- Access the captured string (inside [[ ]])
    captured_string = string.sub(captured_string, 3, -3)
    print(captured_string)
  else
    print 'No string found within double square brackets'
  end

  -- Build and execute the edit command
  vim.api.nvim_command(':e ' .. captured_string .. '.md')
end

-- vim.keymap.set('n', '<leader>o', open_bracketed_file)
return M
