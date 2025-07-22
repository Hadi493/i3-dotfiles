-- Emacs key bindings converted to Neovim
-- These mappings replicate your Emacs configuration key bindings

local function map(mode, key, cmd, opts)
    opts = opts or { noremap = true, silent = true }
    vim.keymap.set(mode, key, cmd, opts)
end

-- ========== File Operations ==========
-- Find file at point (Emacs: C-x C-g)
map('n', '<C-x><C-g>', 'gf', { desc = "Find file at point" })

-- Imenu equivalent (Emacs: C-c i m) - using LSP symbols
map('n', '<leader>im', ':lua require("fzf-lua").lsp_document_symbols()<CR>', { desc = "Document symbols (imenu)" })

-- ========== Text Manipulation ==========
-- Duplicate line (Emacs: C-,)
map('n', '<C-,>', function()
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, row, row, false, {line})
    vim.api.nvim_win_set_cursor(0, {row + 1, col})
end, { desc = "Duplicate current line" })

-- Unfill paragraph (Emacs: C-c M-q) - join lines
map('n', '<C-c><M-q>', 'vip:join<CR>', { desc = "Unfill paragraph (join lines)" })

-- Move text up/down (already exists as M-p and M-n in main config)
-- These are equivalent to move-text in Emacs

-- ========== Clipboard Operations ==========
-- Insert timestamp (Emacs: C-x p d)
map('n', '<C-x>pd', function()
    local timestamp = os.date("(%Y-%m-%d %H:%M:%S)")
    vim.api.nvim_put({timestamp}, 'c', true, true)
end, { desc = "Insert timestamp" })

-- Copy file path to clipboard (custom function in Emacs)
map('n', '<leader>cp', function()
    local filepath = vim.fn.expand('%:p')
    vim.fn.setreg('+', filepath)
    print('Copied to clipboard: ' .. filepath)
end, { desc = "Copy file path to clipboard" })

-- Copy buffer name to clipboard (custom function in Emacs)
map('n', '<leader>cb', function()
    local bufname = vim.fn.expand('%:t')
    vim.fn.setreg('+', bufname)
    print('Copied to clipboard: ' .. bufname)
end, { desc = "Copy buffer name to clipboard" })

-- ========== Search and Replace ==========
-- Recursive grep on selected text (Emacs: C-x p s)
map('v', '<C-x>ps', function()
    local function get_visual_selection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})
        text = string.gsub(text, "\n", "")
        if #text > 0 then
            return text
        else
            return ''
        end
    end
    local selected_text = get_visual_selection()
    if selected_text ~= '' then
        require('fzf-lua').grep({ search = selected_text })
    end
end, { desc = "Grep selected text" })

-- ========== Magit equivalent (Git operations) ==========
-- Magit status (Emacs: C-c m s)
map('n', '<C-c>ms', ':lua require("fzf-lua").git_status()<CR>', { desc = "Git status" })

-- Magit log (Emacs: C-c m l)
map('n', '<C-c>ml', ':lua require("fzf-lua").git_commits()<CR>', { desc = "Git log" })

-- ========== Multiple Cursors (Emacs style) ==========
-- Note: These would need a multiple cursors plugin for Neovim
-- For now, using built-in alternatives
map('n', '<C-S-c><C-S-c>', ':s/\\v/&/g<Left><Left><Left>', { desc = "Edit multiple occurrences" })
map('n', '<C->', '*N', { desc = "Mark next like this" })
map('n', '<C-<', '#N', { desc = "Mark previous like this" })

-- ========== Helm equivalent (Fuzzy finding) ==========
-- Helm find files (already covered by fzf-lua in main config)
map('n', '<C-c>ht', ':lua require("fzf-lua").files()<CR>', { desc = "Find files" })
map('n', '<C-c>hgg', ':lua require("fzf-lua").git_files()<CR>', { desc = "Git files" })
map('n', '<C-c>hr', ':lua require("fzf-lua").oldfiles()<CR>', { desc = "Recent files" })

-- ========== Org-mode equivalent ==========
-- Org agenda (Emacs: C-x a) - using TODO comments or external tools
map('n', '<C-x>a', ':lua require("fzf-lua").grep({ search = "TODO\\|FIXME\\|NOTE" })<CR>', { desc = "Find TODOs (agenda)" })

-- Org capture equivalent (Emacs: C-c c) - create new note
map('n', '<C-c>c', function()
    local filename = vim.fn.input("Note filename: ")
    if filename ~= "" then
        vim.cmd('edit ~/Documents/Notes/' .. filename .. '.md')
        local timestamp = os.date("# %Y-%m-%d %H:%M:%S")
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {timestamp, "", "## TODO", ""})
        vim.api.nvim_win_set_cursor(0, {4, 0})
    end
end, { desc = "Create note (org capture)" })

-- ========== Development ==========
-- Compile (common in Emacs development)
map('n', '<C-c><C-c>', ':make<CR>', { desc = "Compile/Make" })

-- Eval expression (Emacs: C-c C-j for Lisp) - using Lua in Neovim
map('n', '<C-c><C-j>', ':lua ', { desc = "Eval Lua expression" })

-- ========== Window and Frame ==========
-- Transparency toggle (custom function from Emacs config)
map('n', '<leader>tt', function()
    if vim.g.transparency_enabled then
        vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
        vim.cmd('hi NonText guibg=NONE ctermbg=NONE')
        vim.g.transparency_enabled = false
        print("Transparency disabled")
    else
        vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
        vim.cmd('hi NonText guibg=NONE ctermbg=NONE')
        vim.g.transparency_enabled = true
        print("Transparency enabled")
    end
end, { desc = "Toggle transparency" })

-- ========== Paredit-like operations for code ==========
-- These work with treesitter for structured editing
map('n', '<M-(>', 'i()<Esc>l', { desc = "Insert parentheses" })
map('n', '<M-[>', 'i[]<Esc>l', { desc = "Insert brackets" })
map('n', '<M-{>', 'i{}<Esc>l', { desc = "Insert braces" })

-- ========== Whitespace ==========
-- Delete trailing whitespace (automatic in your Emacs config)
map('n', '<leader>dw', ':%s/\\s\\+$//e<CR>', { desc = "Delete trailing whitespace" })

-- ========== Company mode equivalent ==========
-- Completion is handled by nvim-cmp, but manual trigger:
map('i', '<C-SPC>', '<C-x><C-o>', { desc = "Manual completion" })

-- ========== Quick access to config ==========
-- Edit init file (common Emacs pattern)
map('n', '<leader>ei', ':edit ~/.config/nvim/init.lua<CR>', { desc = "Edit init.lua" })

-- ========== Custom utility functions ==========
-- Kill autoloads buffers equivalent - close hidden buffers
map('n', '<leader>ka', function()
    vim.cmd('bufdo if buflisted(bufnr("%")) == 0 | bd | endif')
    print("Killed hidden buffers")
end, { desc = "Kill hidden buffers" })

-- Pretty print XML (from Emacs config)
map('v', '<leader>px', '!xmllint --format -<CR>', { desc = "Pretty print XML" })

-- ========== Smex equivalent ==========
-- Command palette (M-x equivalent) - already using which-key
-- Enhanced command mode
map('n', '<M-x>', ':lua require("fzf-lua").commands()<CR>', { desc = "Command palette (M-x)" })

print("Emacs-style key bindings loaded!")
