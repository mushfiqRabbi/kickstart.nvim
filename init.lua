--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g['python3_host_prog'] = '/home/mushfiq/.pyenv/versions/py3nvim/bin/python'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.tabstop = 2
-- vim.opt.smartindent = true
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = true
-- vim.g['rooter_cd_cmd'] = 'lcd'
-- vim.g['rooter_change_directory_for_non_project_files'] = 'current'
vim.opt.scrolloff = 7
vim.o.cursorline = true

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

-- vim.o.shell = 'C:\\"Program Files"\\PowerShell\\7\\pwsh.exe'
-- vim.o.shell = '/usr/bin/zsh'
-- vim.o.shellcmdflag = '-command'
-- vim.o.shellquote = '"'
-- vim.o.shellxquote = ''

-- vim.cmd [[
-- set shell=pwsh.exe
-- set shellcmdflag=-command
-- set shellquote=\"
-- set shellxquote=
-- ]]

vim.keymap.set('n', '<C-s>', '<cmd>update<CR>', { noremap = true, silent = true })
-- vim.keymap.set('v', '<C-s>', '<C-c><cmd>update<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<cmd>update<CR>', { noremap = true, silent = true })
-- vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { noremap = true })

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { '*' },
})

vim.cmd [[
    " let g:VM_maps = {}
    " let g:VM_maps['Find Under'] = '<C-m>'
    " let g:VM_maps['Find Subword Under'] = '<C-m>'
    let g:VM_mouse_mappings = 1
    ]]

-- vim.filetype.add {
--   pattern = {
--     ['.env.*'] = 'sh',
--   },
-- }

-- vim.cmd [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END
-- ]]

-- vim.cmd [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd User FormatterPre lua print "Formatting..."
--   autocmd User FormatterPost lua print "Format complete."
-- augroup END
--   ]]

vim.keymap.set('i', '<C-w>', '<C-c><C-w>', { noremap = true })

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        -- component_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '|', right = '|' },
        theme = 'onedark',
        -- theme = 'tokyonight',
      },
    },
  },

  {
    -- 'lukas-reineke/indent-blankline.nvim',
    -- main = 'ibl',
    -- opts = {},
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    -- commit = 'cf847b587ac058cf2edcc2131daaef4ae9e8bf18',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Make relative line numbers default
vim.wo.rnu = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<CR>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<backspace>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-v>', '<Nop>', { silent = true })
-- vim.keymap.set({ 'n', 'v', 'i' }, '<C-t>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
--
-- local layout_config = {}
--
--
-- if vim.fn.hostname() == 'DESKTOP-QP9KQE3' then
--   layout_config = {
--     height = 0.9,
--     width = 0.7,
--     preview_width = 0.65,
--   }
-- elseif vim.fn.hostname() == 'DESKTOP-CKMOCDG' then
--   layout_config = {
--     height = 0.95,
--     width = 0.8,
--     preview_width = 0.6,
--   }
-- end

local previewers = require 'telescope.previewers'
local Job = require 'plenary.job'
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      -- local mime_type = vim.split(j:result()[1], '/')[1]
      local is_preview = false
      if string.match(j:result()[1], 'text') then
        is_preview = true
      elseif string.match(j:result()[1], 'json') then
        is_preview = true
      elseif string.match(j:result()[1], 'jpg') then
        is_preview = true
      elseif string.match(j:result()[1], 'jpeg') then
        is_preview = true
      elseif string.match(j:result()[1], 'png') then
        is_preview = true
      end
      if is_preview then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end,
  }):sync()
end

require('telescope').setup {
  defaults = {
    buffer_previewer_maker = new_maker,
  },
}

require('telescope').setup {
  defaults = {
    preview = {
      mime_hook = function(filepath, bufnr, opts)
        local is_image = function(filepath)
          local image_extensions = { 'png', 'jpg' } -- Supported image formats
          local split_path = vim.split(filepath:lower(), '.', { plain = true })
          local extension = split_path[#split_path]
          return vim.tbl_contains(image_extensions, extension)
        end
        if is_image(filepath) then
          local term = vim.api.nvim_open_term(bufnr, {})
          local function send_output(_, data, _)
            for _, d in ipairs(data) do
              vim.api.nvim_chan_send(term, d .. '\r\n')
            end
          end
          vim.fn.jobstart({
            'catimg',
            filepath, -- Terminal image viewer command
          }, { on_stdout = send_output, stdout_buffered = true, pty = true })
        else
          require('telescope.previewers.utils').set_preview_message(bufnr, opts.winid, 'Binary cannot be previewed')
        end
      end,
    },
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.9,
      height = 0.95,
      preview_width = 0.65,
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim', -- add this value
    },
    mappings = {
      n = {
        ['<C-c>'] = require('telescope.actions').close,
        ['<C-e>'] = function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          local dir
          if not selection.path then
            dir = selection.value
          else
            dir = vim.fn.fnamemodify(selection.path, ':p:h')
          end
          require('telescope.actions').close(prompt_bufnr)
          -- Depending on what you want put `cd`, `lcd`, `tcd`
          vim.cmd(string.format('Oil %s', dir))
          -- vim.cmd(string.format('lua MiniFiles.open(%s)', dir))
          -- MiniFiles.open(dir, false)
        end,
        ['cd'] = function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          local dir
          if not selection.path then
            dir = selection.value
          else
            dir = vim.fn.fnamemodify(selection.path, ':p:h')
          end
          require('telescope.actions').close(prompt_bufnr)
          -- Depending on what you want put `cd`, `lcd`, `tcd`
          vim.cmd(string.format('silent lcd %s', dir))
        end,
      },
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-e>'] = function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          local dir
          if not selection.path then
            dir = selection.value
          else
            dir = vim.fn.fnamemodify(selection.path, ':p:h')
          end
          require('telescope.actions').close(prompt_bufnr)
          -- Depending on what you want put `cd`, `lcd`, `tcd`
          vim.cmd(string.format('Oil %s', dir))
          -- MiniFiles.open(dir, false)
        end,
        ['<C-w>'] = function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          local dir = vim.fn.fnamemodify(selection.path, ':p:h')
          require('telescope.actions').close(prompt_bufnr)
          -- Depending on what you want put `cd`, `lcd`, `tcd`
          vim.cmd(string.format('silent lcd %s', dir))
        end,
      },
    },
  },
  pickers = {
    find_files = {
      wrap_results = true,
      find_command = {
        'fd',
        '--type',
        'f',
        '--hidden',
        '--follow',
        '--absolute-path',
        '--exclude',
        '.git',
        '--exclude',
        '.vscode',
      },
    },
    oldfiles = {
      wrap_results = true,
    },
    buffers = {
      wrap_results = true,
    },
    git_files = {
      wrap_results = true,
    },
    current_buffer_fuzzy_find = {
      wrap_results = true,
    },
    help_tags = {
      wrap_results = true,
    },
    grep_string = {
      wrap_results = true,
    },
    live_grep = {
      wrap_results = true,
    },
    diagnostics = {
      wrap_results = true,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'yank_history')
pcall(require('telescope').load_extension, 'projects')
pcall(require('telescope').load_extension, 'ascii')
pcall(require('telescope').load_extension 'undo')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = '[F]ind recently [O]pened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[] Find  buffers' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Fuzzy find inside current buffer' })

vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = '[F]ind [G]it files' })
vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files(  )<cr>", { desc = '[F]ind [G]it files' })
-- vim.keymap.set(
--   'n',
--   '<leader>ff',
--   "<cmd>lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git'})<cr>",
--   { desc = '[F]ind [F]iles in CWD' }
-- )
-- vim.keymap.set('n', '<leader>ff', "<CMD>lua require'telescope-config'.project_files()<CR>", { desc = '[F]ind [F]iles in CWD' })
vim.keymap.set(
  'n',
  '<leader>fd',
  "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.env.HOME, find_command = { 'fd', '-td', '-tl', '-uu' }, previewer = false })<cr>",
  { desc = '[F]ind [D]irectory' }
)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp tags' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').grep_string, { desc = '[F]ind [S]tring under cursor' })
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, { desc = '[L]ive [G]rep' })
vim.keymap.set('n', '<leader>fe', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>rs', require('telescope.builtin').resume, { desc = '[R]esume [S]earch' })
vim.keymap.set('n', '<leader>fy', ':Telescope yank_history<CR>', { desc = '[F]ind [Y]ank from history' })
vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { desc = '[F]ind [P]roject' })
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { desc = '[F]ind [U]ndo from history' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'lua', 'vimdoc', 'vim', 'javascript', 'typescript', 'tsx', 'json', 'regex' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>ca', ':CodeActionMenu<CR>', '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  --   vim.lsp.buf.format()
  -- end, { desc = 'Format current buffer with LSP' })
  --
  -- vim.api.nvim_create_autocmd('BufWritePost', {
  --   pattern = '{[^.]????*,[^o]???*,[^i]??*,[^l]*,[^:]*}',
  --   command = 'Format',
  -- })
end

-- document existing key chains
-- require('which-key').register {
-- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
-- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
-- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
-- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
-- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
-- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
-- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
-- }

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  --
  tsserver = {},

  lua_ls = {

    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  emmet_language_server = {},

  jsonls = {},

  custom_elements_ls = {},

  tailwindcss = {},

  eslint = {},

  bashls = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
})

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

local lspkind = require 'lspkind'
cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      symbol_map = { Codeium = '' },

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function(entry, vim_item)
      --   return vim_item
      -- end,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_locally_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.locally_jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'codeium' },
    -- { name = 'path' },
    -- {
    --   name = 'spell',
    --   option = {
    --     keep_all_entries = false,
    --     enable_in_context = function()
    --       return true
    --     end,
    --   },
    -- },
    -- { name = 'calc' },
    -- {
    --   name = 'emoji',
    --   option = {
    --     insert = true,
    --   },
    -- },
  },
}

cmp.setup.cmdline({ '/', '?' }, {
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})
cmp.setup.cmdline(':', {
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  mapping = cmp.mapping.preset.cmdline {},
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  callback = function(args)
    -- if args.data.filetype ~= 'help' then
    --   vim.wo.number = true
    -- elseif args.data.bufname:match '*.csv' then
    --   vim.wo.wrap = false
    -- end
    vim.wo.number = true
    vim.wo.wrap = true
  end,
})

local signs = {
  --   JetBrains friendly icons
  -- Error = ' ',
  -- Warn = ' ',
  -- Hint = ' ',
  -- Info = ' ',

  -- CaskaydiaCove friendly icons
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' ',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.keymap.set('n', '<leader>rll', '<cmd>LspRestart<CR>', { noremap = true, desc = '[R]estart [L]SP server' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
