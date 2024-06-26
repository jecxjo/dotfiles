local vim = vim
-- Snippets
-- imports
vim.api.nvim_set_keymap('ia', 'imp@', 'import X from \'Y\';', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'impn@', 'import { X } from \'Y\';', { noremap = true, silent = true })

-- functions
vim.api.nvim_set_keymap('ia', 'func@', 'function X() {\n/* TODO */\n}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'efunc@', 'export function X() {\n/* TODO */\n}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'afunc@', '() => { /* TODO */ }', { noremap = true, silent = true })

-- classes
vim.api.nvim_set_keymap('ia', 'class@', 'class X {\n/* Member Variables */\n\nconstructor() {\n/* TODO */\n}\n}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'eclass@', 'export class X {\n/* Member Variables */\n\nconstructor() {\n/* TODO */\n}\n}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'comp@', '@Component({\ntag: \'x-comp\',\nassetDirs: [],\nformAssociated: false,\nscoped: false,\nshadow: false,\nstyleUrl: \'x-comp.css\',\nstyleUrls: [],\nstyles: \'\'\n})\nexport class X {\n/* Private Vars */\n\n/* Props */\n\n/* State */\n\n/* Event Emitters */\n\n componentWillLoad() { }\n\ncomponentDidLoad() { }\n\nrender() {\nreturn <div />;\n}\n}', { noremap = true, silent = true })

-- if
vim.api.nvim_set_keymap('ia', 'if@', 'if ( /* TEST */ ) {\n/* BODY */\n}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'ife@', 'if ( /* TEST */ ) {\n/* BODY */\n} else {\n/* BODY */\n}', { noremap = true, silent = true })

-- arrays
vim.api.nvim_set_keymap('ia', 'foreach@', '.forEach((v: any) => { })', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'map@', '.map((v: any) => { })', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'filter@', '.filter((v: any) => { })', { noremap = true, silent = true })
vim.api.nvim_set_keymap('ia', 'find@', '.find((v: any) => { })', { noremap = true, silent = true })
