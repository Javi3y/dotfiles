return {
  "echasnovski/mini.sessions",
  "echasnovski/mini.ai",
  "echasnovski/mini.starter",
  config = function()
    local session_dir = vim.fn.stdpath("data") .. "/sessions"

    if vim.fn.isdirectory(session_dir) == 0 then
      vim.fn.mkdir(session_dir, "p")
    end

    require("mini.sessions").setup({
      directory = session_dir,
      autoread = false, -- Prevent loading the last session automatically
      autowrite = true, -- Save sessions automatically on exit
      autosave = true, -- Autosave session when leaving Neovim
      verbose = { read = true, write = true },
    })

    local header_art = [[
  .-''-.                                                               .-''-.
 /      `'''--..                                                ..--'''`      \
|                '.                                            .'                |
|          ..''` '---.                                .---' `''..          |
|        .``          ''''\                       /''''          ``.        |
/'..  /`             /   /'     '\   \             `\  ..'\'
|   `:'   ___..  \  / /   \ \  / ..___           ':`   |
'____'__...---'':::::\ '-' ./     \. '-' \:::::''---...__'____'
  \::/\ \:::::::::::': ___/             \___ :':::::::::::/ /\::/
   \'| \ '-:::--'` .' /                 \ '. `''--:::-' / |'/
  /'|  \    ....''`__/                   \__`''....   /  |'\
  \ |   .  | .-'`                           `'-. |   .   | /
   \/::.'   | |                                  | |   '.::\/
   \':'_.---| |                                  | |---._':'/
    \\     | |                                  | |     //
    \\     | |                                  | |     //
     \\    | |                                  | |     //
     \\    | |                                  | |     //
      \\   |'                                    '|    //
]]

    local starter = require("mini.starter")
    starter.setup({
      items = {
        starter.sections.sessions(77, true),
        starter.sections.builtin_actions(),
      },
      content_hooks = {
        function(content)
          local blank_content_line = { { type = "empty", string = "" } }
          local section_coords = starter.content_coords(content, "section")
          for i = #section_coords, 1, -1 do
            table.insert(content, section_coords[i].line + 1, blank_content_line)
          end
          return content
        end,
        starter.gen_hook.adding_bullet("» "),
        starter.gen_hook.aligning("center", "center"),
      },
      header = header_art,
      footer = "Happy coding with Neovim!",
    })

    require("mini.ai").setup()

    vim.keymap.set("n", "<leader>ss", function()
      local sessions = require("mini.sessions")
      local active_session = vim.fn.input("Enter name for session > ")
      sessions.write(active_session)
    end, { desc = "Save current session" })

    local function delete_session()
      local session_dir = vim.fn.stdpath("data") .. "/sessions"
      local session_files = vim.fn.readdir(session_dir)
      if vim.tbl_isempty(session_files) then
        print("No sessions available to delete.")
        return
      end

      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local sorters = require("telescope.sorters")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      pickers.new({}, {
        prompt_title = "Delete Session",
        finder = finders.new_table {
          results = session_files,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            local session_file = session_dir .. "/" .. selection[1]
            local confirm = vim.fn.confirm("Delete session " .. selection[1] .. "?", "&Yes\n&No", 2)
            if confirm == 1 then
              vim.fn.delete(session_file)
              print("Deleted session: " .. selection[1])
            else
              print("Deletion cancelled")
            end
            actions.close(prompt_bufnr)
          end)
          return true
        end,
      }):find()
    end

    vim.keymap.set("n", "<leader>sd", delete_session, { desc = "Delete a session" })
  end,
}
