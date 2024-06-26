local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-sensible')
Plug('tpope/vim-surround')
Plug('tpope/vim-commentary')
Plug('tpope/vim-unimpaired')
Plug('junegunn/vim-easy-align')
Plug('alvan/vim-closetag')
Plug('tommcdo/vim-exchange')
Plug('raichoo/purescript-vim')
Plug('github/copilot.vim', { ['branch'] = 'release' })
Plug('nvim-lua/plenary.nvim')
Plug('CopilotC-Nvim/CopilotChat.nvim', { ['branch'] = 'canary' })
-- Plug('ludovicchabant/vim-gutentags')
Plug('christoomey/vim-conflicted')
Plug('jecxjo/rest-client.vim', { ['branch'] = 'main' })
Plug('freitass/todo.txt-vim')
if vim.fn.exists('g:vscode') == 0 then
    Plug('/opt/homebrew/opt/fzf')
    Plug('junegunn/fzf.vim')
    Plug('tpope/vim-fugitive')
    Plug('preservim/nerdtree')
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')
    Plug('airblade/vim-gitgutter', { ['branch'] = 'main' })
    Plug('neovim/nvim-lspconfig')
    Plug('hrsh7th/nvim-cmp', { ['branch'] = 'main' })
    Plug('hrsh7th/cmp-nvim-lsp', { ['branch'] = 'main' })
    Plug('hrsh7th/cmp-buffer', { ['branch'] = 'main' })
    Plug('hrsh7th/cmp-path', { ['branch'] = 'main' })
    Plug('williamboman/mason.nvim', { ['branch'] = 'main' })
    Plug('williamboman/mason-lspconfig.nvim', { ['branch'] = 'main' })
    Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'main' })
    Plug('mfussenegger/nvim-dap')
    Plug('rcarriga/nvim-dap-ui')
    Plug('jose-elias-alvarez/null-ls.nvim', { ['branch'] = 'main' })
    Plug('nvim-treesitter/nvim-treesitter')
    Plug('editorconfig/editorconfig-vim')
    -- Plug('puremourning/vimspector')
    Plug('stevearc/dressing.nvim')
    Plug('stevearc/overseer.nvim')
    Plug('nvim-telescope/telescope.nvim')
    Plug('rcarriga/nvim-notify')
end

-- Misc
Plug('vimwiki/vimwiki')

-- Themes
Plug('catppuccin/nvim', { ['branch'] = 'main', ['as'] = 'catppuccin' })

vim.call('plug#end')

require("plugins/rest-client")
require("plugins/prettier")
require("plugins/copilot-chat")
require("plugins/nvim-treesitter")
require("plugins/nerdtree")
require("plugins/fzf")
require("plugins/overseer")
