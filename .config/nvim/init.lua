-- pre-requisite
-- DONE: install tree-sitter-cli

-- clear neovim cache
-- DONE: use `rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim`

-- how to get help
-- DONE: `:help` or `:h`

-- supported languages
-- ?? bash
-- C / C++
-- dart / flutter
-- DONE: lua
-- PHP
-- python

-- operators
-- `c` for changing
-- `y` for yanking
-- `p` for pasting after cursor
-- `P` for pasting before cursor
-- `d` for delete
-- `x` for delete character under cursor
-- `X` for delete character before cursor
-- `r` for replace character under cursor
-- `R` for repace successive characters
-- `f` for find

-- motions
-- `e` till the end of word under cursor
-- `$` for end of line
-- `0` for start of line
-- `^` for first character of the line
-- `l` for character
-- `%` find matching parenthesis
-- `t` for till
-- `i` for inside

-- moves
-- `w` next word
-- `W` next word with space as separator
-- `G` bottom of file
-- `[count]G` jump to exact line
-- `ctrl u` half page up
-- `ctrl d` half page down
-- `ctrl o` / `ctrl i` to go back / forward in neovim documentation

-- core settings / options
do
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	vim.o.mouse = "a"
	vim.o.confirm = true
	vim.o.undofile = true

	vim.o.number = true
	vim.o.relativenumber = true

	-- UI
	vim.opt.termguicolors = true
	vim.o.cursorline = true
	vim.o.ruler = false
	vim.o.scrolloff = 16
	vim.o.showmode = false
	vim.o.pumheight = 100
	vim.o.pummaxwidth = 100
	vim.o.signcolumn = "yes"
	vim.o.splitright = true
	vim.o.splitbelow = true

	vim.g.have_nerd_font = true

	vim.o.breakindent = true
	vim.o.autoindent = true
	vim.o.smartindent = true
	vim.o.wrap = false

	vim.o.expandtab = true
	vim.o.shiftwidth = 4
	vim.o.tabstop = 4

	-- fold
	-- see `:h fold-commands`
	vim.o.foldlevel = 10
	vim.o.foldmethod = "indent"
	vim.o.foldtext = ""

	-- search
	vim.o.ignorecase = true
	vim.o.smartcase = true
	vim.o.incsearch = true

	-- ?? set matching bracket
end

-- utils
---@param repo string
---@return string
local function gh(repo)
	return "https://github.com/taftadj/" .. repo
end

-- auto commands
do
	-- highlight yank
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "highlight when yanking",
		group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
		callback = function(_)
			vim.hl.on_yank()
		end,
	})

	-- on lsp attach
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event) end,
	})
end

-- keymaps
do
	-- splits, splits navigation
	-- key: splits
	-- key: close split
	-- navigation between splits
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "move focus to the upper window" })

	-- easy insert of `,;`
	-- better escape
	-- DONE: yank / paste
	-- save / quit / close buffers
	-- DONE: fold (`zM` fold all) / unfold (`zR` unfold all, `zA` unfold under cursor)
	-- DONE: undo (`u`, `U` for all changes on a line) / redo (`ctrl r`)
	-- DONE: repeat last command `.`
	-- ?? open nvim config from anywhere

	-- == search & replace
	-- disable search highlight
	-- DONE: `/searchTerm` to search forward
	-- DONE: `/searchTerm\c` case insensitive search forward
	-- DONE: `?searchTerm` to search backward
	-- DONE: `n` next occurrence
	-- DONE: `N` previous occurrence
	-- DONE: `*` search term under cursor
	-- DONE:     can be paired with `:%s//newTerm/g` to replace all
	-- DONE: `:nohlsearch` clear highlight
	-- DONE: `:s/old/new` to search & replace on one line
	-- DONE: `:s/old/new/g` to search & replace all occurrence on one line
	-- DONE: `:#,#s/old/new/g` to search & replace all occurrence between 2 lines

	-- == run shell commands
	-- DONE: use `:! commands args`
end

-- core & UI plugins
do
	-- color scheme
	-- DONE: transparent background
	vim.pack.add({ gh("tokyonight.nvim") })
	require("tokyonight").setup({
		transparent = true,
		styles = {
			sidebars = "transparent",
		},
		on_highlights = function(hl, _)
			hl.CursorLine = { bg = "none" }
			hl.NeoTreeCursorLine = { bg = "none" }
		end,
	})
	vim.cmd.colorscheme("tokyonight-night")

	-- code understanding
	-- use treesitter plugin

	-- auto pairs
	vim.pack.add({ gh("nvim-autopairs") })
	require("nvim-autopairs").setup({})

	-- git
	-- key: jump between changes
	-- key: revert changes
	-- ?? run git commands
	vim.pack.add({ gh("gitsigns.nvim") })
	local gitsigns = require("gitsigns")
	gitsigns.setup({
		signs = {
			add = { text = "+" }, ---@diagnostic disable-line: missing-fields
			change = { text = "~" }, ---@diagnostic disable-line: missing-fields
			delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
			topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
			changedelete = { text = "~" }, ---@diagnostic disable-line: missing-fields
		},
	})

	-- file / buffers navigation
	-- key: next / previous buffers
	-- ?? work with harpoon
end

-- file explorer
-- key: toggle file explorer
-- ?? open at current file
do
	vim.pack.add({
		{ src = gh("neo-tree.nvim"), version = vim.version.range("*") },
		gh("plenary.nvim"),
		gh("nui.nvim"),
		gh("nvim-web-devicons"),
	})
	vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>", { desc = "NeoTree reveal", silent = true })

	require("neo-tree").setup({
		close_if_last_window = true,
		default_component_configs = {
			git_status = {
				symbols = {
					added = "✚",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
			},
		},
		window = {
			-- position = "right",
			width = 40,
			auto_expand_width = true,
			mappings = {
				["O"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						if vim.ui.open then
							vim.ui.open(path)
						end
					end,
					desc = "Open with system default app",
				},
			},
		},
	})
end

-- language server protocol
do
	vim.pack.add({
		gh("nvim-lspconfig"),
		gh("mason.nvim"),
		gh("mason-lspconfig.nvim"),
		gh("mason-tool-installer.nvim"),
	})

	local servers = {
		stylua = {},
		lua_ls = {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					format = { enable = false },
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		},
	}

	require("mason").setup({})
	require("mason-lspconfig").setup({
		automatic_enable = false,
	})

	local ensure_installed = vim.tbl_keys(servers or {})
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	for name, server in pairs(servers) do
		vim.lsp.config(name, server)
		vim.lsp.enable(name)
	end

	-- DONE: use `K` on any word to see documentation
	-- key: rename
	-- DONE: diagnostics
	-- key: code actions
	-- functions signature
	-- ?? go to definition
	-- ?? go to declaration
	-- ?? go to implementation
	-- ?? find symbols
	-- ?? find references
end

-- diagnostic
do
	vim.diagnostic.config({
		virtual_text = true,
		virtual_lines = false,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "󰌵",
			},
		},
	})

	-- key: jump between errors / warning
end

-- format
do
	vim.pack.add({ gh("conform.nvim") })
	require("conform").setup({
		format_on_save = function(bufnr)
			local enabled_filetypes = {
				lua = true,
			}

			if not enabled_filetypes[vim.bo[bufnr].filetype] then
				return nil
			end

			return { timeout_ms = 500 }
		end,
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
		},
	})
	vim.keymap.set("n", "<leader>f", function()
		require("conform").format({ async = true })
	end, { desc = "format buffer" })
end

-- completion
-- TODO: remove this plugin as i only need to use lsp completion
do
	-- DONE: next (`ctrl n`) / previous (`ctrl p`)
	-- DONE: complete / confirm (`<C-y>`)
	-- DONE: cancel (`<C-e>`)
	-- key: show (or auto show) / hide docs
	-- key: scroll docs

	vim.pack.add({ { src = gh("blink.cmp"), version = vim.version.range("1.*") } })
	require("blink.cmp").setup({
		keymap = {
			preset = "default",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		sources = {
			default = { "lsp" },
		},
		signature = { enabled = true },
	})
end

--====================================================

-- == fuzzy find
-- ?? find text under cursor
-- ?? find files

-- ?? symbols
-- ?? snippets
-- ?? dap
-- ?? tmux
-- ?? database tools
-- ?? rest api tools
-- ?? linting
-- ?? how to use quickfix list
-- ?? what & how to use operators / motions / modes / text, object / register / macros
