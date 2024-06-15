local h = require('helpers')

h.g.vimspector_enable_mappings = 'HUMAN'
h.map('n', '<leader>di', '<Plug>VimspectorBalloonEval')
h.map('x', '<leader>di', '<Plug>VimspectorBalloonEval')
