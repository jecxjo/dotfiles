local h = require('helpers')

-- File exploration
h.map('n', '<leader>p', ':Telescope find_files<CR>')

-- Git Stuff
h.map('n', '<leader>gg', ':Git<Cr>')
h.map('n', '<leader>ga', ':Gwrite<Cr>')
h.map('n', '<leader>gl', ':Git log<Cr>')
h.map('n', '<leader>gcc', ':Git commit<Cr>')
h.map('n', '<leader>gca', ':Git commit --amend<Cr>')
h.map('n', '<leader>gpp', ':Git push<Cr>')
h.map('n', '<leader>gpo', ':Git push -u origin HEAD<Cr>')
