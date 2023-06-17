-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args)
    if args.data.filetype ~= "help" then
      vim.bo.number = true
    elseif args.data.bufname:match("*.csv") then
      vim.bo.wrap = false
    end
  end,
})

-- find and get prompt buffer
TP = function()
  local prompt_buf = vim.tbl_filter(function(b)
    return vim.bo[b].filetype == "TelescopePrompt"
  end, vim.api.nvim_list_bufs())[1]
  return TelescopeGlobalState[prompt_buf].picker
end

require('telescope').setup {
  extensions = {
    file_browser = {
      grouped = true,
      initial_browser = "tree",
      auto_depth = true,
      depth = 1,
      hijack_netrw = true,
    },
  },
  defaults = {
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    layout_strategy = "vertical",
    layout_config = {
      height = 0.999,
      width = 0.999,
      prompt_position = "top",
      preview_height = 0.40,
    },
    prompt_prefix = "  ",
    sorting_strategy = "ascending",
    cache_picker = {
      num_pickers = 20,
    },
    dynamic_preview_title = true,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      n = {
        ['<C-]>'] = require("telescope.actions.layout").toggle_preview
      }
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require("telescope").load_extension, "file_browser")


-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
