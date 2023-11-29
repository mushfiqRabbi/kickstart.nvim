return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "JMarkin/nvim-tree.lua-float-preview",
      lazy = true,
      config = function()
        require("float-preview").setup({
          window = {
            wrap = true,
            open_win_config = function()
              local HEIGHT_RATIO = 0.9 -- You can change this
              local WIDTH_RATIO = 0.5 -- You can change this too
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = math.floor((screen_w - (screen_w * 0.3)) / 8) + (screen_w * 0.3) + 2
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
        })
      end,
    },
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- api.config.mappings.default_on_attach(bufnr)

      local FloatPreview = require("float-preview")

      FloatPreview.attach_nvimtree(bufnr)
      local close_wrap = FloatPreview.close_wrap

      -- ...
      vim.keymap.set("n", "<C-t>", close_wrap(api.node.open.tab), opts("Open: New Tab"))
      vim.keymap.set("n", "<C-v>", close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
      vim.keymap.set("n", "<C-s>", close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
      vim.keymap.set("n", "<CR>", close_wrap(api.node.open.edit), opts("Open"))
      vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts("Open"))
      vim.keymap.set("n", "o", close_wrap(api.node.open.edit), opts("Open"))
      vim.keymap.set("n", "O", close_wrap(api.node.open.no_window_picker), opts("Open: No Window Picker"))
      vim.keymap.set("n", "a", close_wrap(api.fs.create), opts("Create"))
      vim.keymap.set("n", "d", close_wrap(api.fs.remove), opts("Delete"))
      vim.keymap.set("n", "r", close_wrap(api.fs.rename), opts("Rename"))

      -- local api = require("nvim-tree.api")
      -- local function opts(desc)
      --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      -- end
      -- api.config.mappings.default_on_attach(bufnr)
      --
      --
      -- local FloatPreview = require("float-preview")
      -- FloatPreview.attach_nvimtree(bufnr)
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
        indent_markers = {
          enable = true,
        },
      },
      view = {
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
  end,
}
