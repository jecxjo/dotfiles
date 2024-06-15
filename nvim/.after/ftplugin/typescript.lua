-- ftplugin/typescript.lua

local root_files = {'tsconfig.json', 'jsconfig.json'}
local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

print('typescript ftplugin loaded')


if root_dir then
    vim.lsp.start({
        name = 'typescript-language-server',
        cmd = { 'typescript-language-server', '--stdio' },
        root_dir = root_dir,
    })
end
