-- DONE: install tree-sitter-cli

-- == file explorer
-- key: toggle file explorer
-- ?? open at current file

-- == independant keys
-- easy insert of `,;`
-- DONE: yank / paste
-- save / quit / close buffers
-- fold / unfold
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

-- == auto commands
-- highlight on yank

-- == options
-- line number & relative number
-- syntax highlighting
-- search options(ignore case, case sensitivity, smart seach)
-- ?? set matching bracket

-- == fuzzy find
-- key: find text under cursor
-- key: find files
-- ?? symbols

-- == language server protocol
-- hover information
-- key: rename
-- diagnostics
-- key: code actions
-- functions signature
-- ?? go to definition
-- ?? go to declaration
-- ?? go to implementation
-- ?? find symbols
-- ?? find references

-- == format
-- key: format manually
-- format on save

-- == diagnostics
-- key: jump between errors / warning

-- == completion
-- key: next (`ctrl n`) / previous (`ctrl p`)
-- key: complete / confirm
-- key: show docs
-- key: scroll docs

-- == file / buffers navigation
-- key: next / previous buffers
-- ?? work with harpoon

-- == splits
-- key: splits
-- key: navigation between splits
-- key: close split

-- == git
-- key: jump between changes
-- key: revert changes
-- ?? run git commands

-- == color scheme
-- transparent background

-- == code understanding
-- use treesitter plugin

-- == clear neovim cache
-- DONE: use `rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim`

-- == how to get help
-- DONE: use `K` on any word to see documentation
-- DONE: `:help` or `:h`

-- == supported languages
-- ?? bash
-- C / C++
-- dart / flutter
-- lua
-- PHP
-- python

-- == operators
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

-- == motions
-- `e` till the end of word under cursor
-- `$` for end of line
-- `0` for start of line
-- `^` for first character of the line
-- `l` for character
-- `%` find matching parenthesis
-- `t` for till
-- `i` for inside

-- == moves
-- `w` next word
-- `W` next word with space as separator
-- `G` bottom of file
-- `[count]G` jump to exact line
-- `ctrl u` half page up
-- `ctrl d` half page down
-- `ctrl o` / `ctrl i` to go back / forward in neovim documentation

-- ?? snippets
-- ?? dap
-- ?? tmux
-- ?? database tools
-- ?? rest api tools
-- ?? linting
-- ?? how to use quickfix list
-- ?? what & how to use operators / motions / modes / text, object / register / macros
