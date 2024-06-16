local h = require('helpers')

h.set.tabstop = 4
h.set.softtabstop = 4
h.set.shiftwidth = 4
h.set.expandtab = true
h.set.smarttab = true
h.set.autoindent = true
h.set.incsearch = true
h.set.ignorecase = true
h.set.smartcase = true
h.set.hlsearch = true
h.set.hidden = true
h.set.number = true
h.set.relativenumber = true
h.set.title = true
h.set.cursorline = true

h.o.wildmode = 'longest,list,full'
h.o.wilemenu = true

-- Languages
-- HTML / XML
h.filetype_autocmd('html', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('xml', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('css', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('scss', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('sass', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')

-- Javascript
h.filetype_autocmd('javascript', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('typescript', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('typescriptreact', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
h.filetype_autocmd('json', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')

-- Vue
h.filetype_autocmd('vue', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')

-- Python
h.filetype_autocmd('python', 'setlocal', 'shiftwidth=2 tabstop=2 softtabstop=2')
