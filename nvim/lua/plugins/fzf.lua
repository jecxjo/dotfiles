local h = require("helpers")

h.cmd([[
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!tags" --glob "!node_modules/*" --glob "!bower_components/*" --glob "!vendor/*" --glob "!*.min.js" --glob "!*.min.css"'
    let $FZF_DEFAULT_OPTS = '--ansi --layout=reverse --preview-window=right:60% --preview "bat --color=always --style=header,grid --line-range :500 {}"'
endif
]])
