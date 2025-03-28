local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Import additional plugins from your custom configuration
  { import = "config.plugins" },
  { import = "config.plugins.lsp" },
  { import = "config.plugins.lang" },

  -- Add LazyVim but only import selected LazyExtra plugins
  --{
  --  "LazyVim/LazyVim",
  --  event = "VeryLazy",
  --  opts = {
  --    spec = {
  --      { import = "LazyExtra.lang.typescript" },
  --      { import = "LazyExtra.lang.json" },
  --    }
  --  }
  --}
}, {
  install = {
    colorscheme = { "kanagawa" },
  },
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
    frequency = 3600,
  },
  ui = {
    border = "rounded",
    backdrop = 100,
  },
})

-- local inScope = require("mini.indentscope")

local miniIndentConfig = {
  draw = {
    -- in ms between event start and drawing of indicator
    delay = 10,

    -- rules for scope drawing.
    -- given total step numbers, returns wait time in ms.
    -- see |MiniIndentscope.gen_animation()| for options.
    animaiton = "quadraticIn",
    duration = 10,
  },

  mappings = {
    object_scope = "ii",
    object_scope_with_border = "ai",

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = "[i",
    goto_bottom = "]i",
  },

  -- Options which control computation of scope. Buffer local values can be
  -- supplied in buffer variable `vim.b.miniindentscope_options`.
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = "both",

    -- Whether to use cursor column when computing reference indent. Useful to
    -- see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = false,
  },

  -- Which character to use for drawing scope indicator
  symbol = "│",
}

-- inScope.setup(miniIndentConfig)
