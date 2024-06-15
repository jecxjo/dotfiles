function! s:LoadEnvFile()
    let l:env_file = findfile('http-client.env.json', '.;')
    if l:env_file == ''
        return {}
    endif
    let l:env_json = system('cat ' . l:env_file)
    let l:env_dict = json_decode(l:env_json)
    return l:env_dict
endfunction

function! s:ReplacePlaceholders(text, env_vars)
    let l:text = a:text
    for [l:key, l:value] in items(a:env_vars)
        let l:text = substitute(l:text, '{{' . l:key . '}}', l:value, 'g')
    endfor
    return l:text
endfunction

function! s:ExtractHttpRequest()
    let l:start = search('###', 'bnW')
    let l:end = search('###', 'nW')
    if l:end == 0
        let l:end = line('$')
    endif
    let l:lines = getline(l:start, l:end)
    let l:lines = filter(l:lines, 'v:val !~ "^#"')
    return l:lines
endfunction

function! s:ParseHttpRequest()
    let l:lines = s:ExtractHttpRequest()

    let l:methods =  ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'OPTIONS', 'CONNECT', 'TRACE']
    let l:method = split(l:lines[0], ' ')[0]
    if index(l:methods, l:method) == -1
        echo 'Invalid HTTP method'
        return
    endif

    let l:path = split(l:lines[0], ' ')[1]

    let l:headers = []
    let l:i = 1
    while l:i < len(l:lines) && l:lines[l:i] != ''
        call add(l:headers, l:lines[l:i])
        let l:i += 1
    endwhile

    let l:body_lines = filter(l:lines[l:i:], 'v:val != ""')
    let l:body = join(l:body_lines, "\n")

    return {
                \ 'method': l:method,
                \ 'path': l:path,
                \ 'headers': l:headers,
                \ 'body': l:body
                \ }
endfunction

function! s:HttpRun(env_name)
    let l:env_dict = s:LoadEnvFile()
    let l:env_vars = get(l:env_dict, a:env_name, {})

    let l:res = s:ParseHttpRequest()
    let l:method = l:res['method']
    let l:path = s:ReplacePlaceholders(l:res['path'], l:env_vars)
    let l:headers = map(copy(l:res['headers']), {_, v -> s:ReplacePlaceholders(v, l:env_vars)})
    let l:body = s:ReplacePlaceholders(l:res['body'], l:env_vars)

    let l:cmd = 'curl -s -X ' . l:method . ' "' . l:path . '"'
    for l:header in l:headers
        let l:cmd .= ' -H "' . l:header . '"'
    endfor
    if l:body != ''
        let l:cmd .= " -d '" . l:body . "'"
    endif

    echo l:cmd
    let l:output = system(l:cmd)
    enew
    put =l:output
    setlocal nomodifiable
    setlocal buftype=nofile
endfunction

command! -nargs=? HttpRun call s:HttpRun(<q-args>)
