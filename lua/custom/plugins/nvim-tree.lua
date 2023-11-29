return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "JMarkin/nvim-tree.lua-float-preview",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      local FloatPreview = require("float-preview")
      FloatPreview.attach_nvimtree(bufnr)
      local close_wrap = FloatPreview.close_wrap

      vim.keymap.set("n", "<C-]>", close_wrap(api.tree.change_root_to_node), opts("CD"))
      vim.keymap.set("n", "<C-e>", close_wrap(api.node.open.replace_tree_buffer), opts("Open: In Place"))
      vim.keymap.set("n", "<C-k>", close_wrap(api.node.show_info_popup), opts("Info"))
      vim.keymap.set("n", "<C-r>", close_wrap(api.fs.rename_sub), opts("Rename: Omit Filename"))
      vim.keymap.set("n", "<C-t>", close_wrap(api.node.open.tab), opts("Open: New Tab"))
      vim.keymap.set("n", "<C-v>", close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
      vim.keymap.set("n", "<C-x>", close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
      vim.keymap.set("n", "<BS>", close_wrap(api.node.navigate.parent_close), opts("Close Directory"))
      vim.keymap.set("n", "<CR>", close_wrap(api.node.open.edit), opts("Open"))
      vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts("Open Preview"))
      vim.keymap.set("n", ">", close_wrap(api.node.navigate.sibling.next), opts("Next Sibling"))
      vim.keymap.set("n", "<", close_wrap(api.node.navigate.sibling.prev), opts("Previous Sibling"))
      vim.keymap.set("n", ".", close_wrap(api.node.run.cmd), opts("Run Command"))
      vim.keymap.set("n", "-", close_wrap(api.tree.change_root_to_parent), opts("Up"))
      vim.keymap.set("n", "a", close_wrap(api.fs.create), opts("Create"))
      vim.keymap.set("n", "bmv", close_wrap(api.marks.bulk.move), opts("Move Bookmarked"))
      vim.keymap.set("n", "B", close_wrap(api.tree.toggle_no_buffer_filter), opts("Toggle No Buffer"))
      vim.keymap.set("n", "c", close_wrap(api.fs.copy.node), opts("Copy"))
      vim.keymap.set("n", "C", close_wrap(api.tree.toggle_git_clean_filter), opts("Toggle Git Clean"))
      vim.keymap.set("n", "[c", close_wrap(api.node.navigate.git.prev), opts("Prev Git"))
      vim.keymap.set("n", "]c", close_wrap(api.node.navigate.git.next), opts("Next Git"))
      vim.keymap.set("n", "d", close_wrap(api.fs.remove), opts("Delete"))
      vim.keymap.set("n", "D", close_wrap(api.fs.trash), opts("Trash"))
      vim.keymap.set("n", "E", close_wrap(api.tree.expand_all), opts("Expand All"))
      vim.keymap.set("n", "e", close_wrap(api.fs.rename_basename), opts("Rename: Basename"))
      vim.keymap.set("n", "]e", close_wrap(api.node.navigate.diagnostics.next), opts("Next Diagnostic"))
      vim.keymap.set("n", "[e", close_wrap(api.node.navigate.diagnostics.prev), opts("Prev Diagnostic"))
      vim.keymap.set("n", "F", close_wrap(api.live_filter.clear), opts("Clean Filter"))
      vim.keymap.set("n", "f", close_wrap(api.live_filter.start), opts("Filter"))
      vim.keymap.set("n", "g?", close_wrap(api.tree.toggle_help), opts("Help"))
      vim.keymap.set("n", "gy", close_wrap(api.fs.copy.absolute_path), opts("Copy Absolute Path"))
      vim.keymap.set("n", "H", close_wrap(api.tree.toggle_hidden_filter), opts("Toggle Dotfiles"))
      vim.keymap.set("n", "I", close_wrap(api.tree.toggle_gitignore_filter), opts("Toggle Git Ignore"))
      vim.keymap.set("n", "J", close_wrap(api.node.navigate.sibling.last), opts("Last Sibling"))
      vim.keymap.set("n", "K", close_wrap(api.node.navigate.sibling.first), opts("First Sibling"))
      vim.keymap.set("n", "m", close_wrap(api.marks.toggle), opts("Toggle Bookmark"))
      vim.keymap.set("n", "o", close_wrap(api.node.open.edit), opts("Open"))
      vim.keymap.set("n", "O", close_wrap(api.node.open.no_window_picker), opts("Open: No Window Picker"))
      vim.keymap.set("n", "p", close_wrap(api.fs.paste), opts("Paste"))
      vim.keymap.set("n", "P", close_wrap(api.node.navigate.parent), opts("Parent Directory"))
      vim.keymap.set("n", "q", close_wrap(api.tree.close), opts("Close"))
      vim.keymap.set("n", "r", close_wrap(api.fs.rename), opts("Rename"))
      vim.keymap.set("n", "R", close_wrap(api.tree.reload), opts("Refresh"))
      vim.keymap.set("n", "s", close_wrap(api.node.run.system), opts("Run System"))
      vim.keymap.set("n", "S", close_wrap(api.tree.search_node), opts("Search"))
      vim.keymap.set("n", "U", close_wrap(api.tree.toggle_custom_filter), opts("Toggle Hidden"))
      vim.keymap.set("n", "W", close_wrap(api.tree.collapse_all), opts("Collapse"))
      vim.keymap.set("n", "x", close_wrap(api.fs.cut), opts("Cut"))
      vim.keymap.set("n", "y", close_wrap(api.fs.copy.filename), opts("Copy Name"))
      vim.keymap.set("n", "Y", close_wrap(api.fs.copy.relative_path), opts("Copy Relative Path"))
      vim.keymap.set("n", "<2-LeftMouse>", close_wrap(api.node.open.edit), opts("Open"))
      vim.keymap.set("n", "<2-RightMouse>", close_wrap(api.tree.change_root_to_node), opts("CD"))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          error = "",
          warning = "",
          hint = "",
          info = "",
        },
      },
      sync_root_with_cwd = true,
      renderer = {
        full_name = true,
        highlight_git = true,
        highlight_diagnostics = true,
        highlight_opened_files = "name",
        highlight_modified = "name",
        highlight_bookmarks = "name",
        indent_markers = {
          enable = true,
        },
        icons = {
          web_devicons = {
            folder = {
              enable = true,
            },
          },
        },
      },
      modified = {
        enable = true,
      },
      view = {
        relativenumber = true,
        float = {
          enable = true,
          open_win_config = function()
            local HEIGHT_RATIO = 0.9 -- You can change this
            local WIDTH_RATIO = 0.3 -- You can change this too
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = math.floor((screen_w - window_w) / 8)
            local center_y = math.floor((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "single",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        -- width = function()
        --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        -- end,
        -- width = function()
        --   local resposive_width = math.floor(vim.o.columns * 0.15)
        --   if resposive_width < 25 then
        --     return 25
        --   else
        --     return resposive_width
        --   end
        -- end,
        centralize_selection = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filters = {
        custom = {
          "^.git$",
          "^.github$",
          "^.vscode$",
        },
        exclude = {
          ".env",
          ".env.local",
        },
      },
    })

    -- local api = require("nvim-tree.api")
    -- vim.keymap.set("n", "<C-g>", "<cmd>NvimTreeToggle<CR>", { noremap = true, desc = "Toggle NvimTree" })
    -- vim.keymap.set("i", "<C-g>", "<C-c>:NvimTreeToggle<CR>", { noremap = true, desc = "Toggle NvimTree" })

    -- api.events.subscribe(api.events.Event.FileCreated, function(file)
    --   vim.cmd("edit " .. file.fname)
    -- end)

    -- vim.api.nvim_create_autocmd("QuitPre", {
    --   callback = function()
    --     local tree_wins = {}
    --     local floating_wins = {}
    --     local wins = vim.api.nvim_list_wins()
    --     for _, w in ipairs(wins) do
    --       local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
    --       if bufname:match("NvimTree_") ~= nil then
    --         table.insert(tree_wins, w)
    --       end
    --       if vim.api.nvim_win_get_config(w).relative ~= "" then
    --         table.insert(floating_wins, w)
    --       end
    --     end
    --     if 1 == #wins - #floating_wins - #tree_wins then
    --       -- Should quit, so we close all invalid windows.
    --       for _, w in ipairs(tree_wins) do
    --         vim.api.nvim_win_close(w, true)
    --       end
    --     end
    --   end,
    -- })

    -- vim.api.nvim_create_autocmd('BufEnter', {
    --   -- pattern = 'NvimTree_*',
    --   callback = function(ev)
    --     print(vim.inspect(ev))
    --     print(vim.api.nvim_buf_get_name(0))
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd('BufLeave', {
    --   -- pattern = 'NvimTree_*',
    --   callback = function(ev)
    --     print(vim.inspect(ev))
    --     print(vim.api.nvim_buf_get_name(0))
    --   end,
    -- })

    local api = require("nvim-tree.api")
    local FloatPreview = require("float-preview")
    local close_wrap = FloatPreview.close_wrap
    vim.keymap.set({ "n", "v", "i" }, "<C-g>", function()
      close_wrap(api.tree.toggle())
    end, { noremap = true, silent = true, desc = "[] Explore files/folders" })
  end,
}
