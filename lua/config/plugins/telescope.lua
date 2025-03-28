return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local tsactions = require("telescope.actions")
    local fbactions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      defaults = {
        mappings = {
          ["n"] = {
            ["e"] = tsactions.move_selection_next,
            ["i"] = tsactions.move_selection_previous,
          },
        },
      },
      pickers = {
        buffers = {
          initial_mode = "normal",
          mappings = {
            ["n"] = {
              ["x"] = tsactions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        file_browser = {
          initial_mode = "normal",
          hijack_netrw = true,
          cwd_to_path = true,
          theme = "dropdown",
          mappings = {
            ["n"] = {
              ["s"] = tsactions.toggle_selection + tsactions.move_selection_worse,
              ["."] = fbactions.toggle_hidden,
              ["m"] = fbactions.create_from_prompt,
              ["v"] = fbactions.move,
              ["<S-X>"] = fbactions.remove,
            },
          },
        },
      },
    })

    require("telescope").load_extension("file_browser")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>gS", builtin.grep_string, { desc = "Grep string" })
    vim.keymap.set("n", "<leader>lb", builtin.buffers, { desc = "Buffer browser" })
    vim.keymap.set(
      "n",
      "<leader>lf",
      [["zy<cmd>exec 'Telescope file_browser path=%:p:h select_buffer=true no_ignore=true'<CR>]],
      { desc = "File browser" }
    )
    vim.keymap.set(
      "x",
      "<leader>sh",
      [["zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr><esc>]],
      { desc = "Grep for highlighted text" }
    )
  end,
}
