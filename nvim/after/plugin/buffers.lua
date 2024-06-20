vim.cmd([[
    if !exists(':Telescope')
        nnoremap <leader>b :ls<CR>
    else
        function! ListBuffers()
            :Telescope buffers
        endfunction
        nnoremap <leader>b :call ListBuffers()<CR>
    endif
]])
