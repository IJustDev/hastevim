function! s:haste_save_request(content)
    let l:command = "sh -c \"curl -s -XPOST -H 'Content-Type: text/plain' https://hastebin.com/documents --data '".a:content."'\""

    let l:json = system(l:command)
    let l:data = json_decode(l:json)

    return l:data["key"]
endfunction!

function! s:append_to_qflist(key)
    let l:qflist = getqflist()
    let l:bufnr = bufnr("%")
    call add(l:qflist, {"bufnr": l:bufnr, "lnum": 1, "text": "hastebin.com/".a:key})
    call setqflist(l:qflist)
    :copen
endfunction

function! s:haste_save()
    let l:lines = getline("0", "$")
    let l:content = join(lines, "\n")

    let l:key = s:haste_save_request(l:content)
    call s:append_to_qflist(l:key)
endfunction

function! <SID>HasteSave()
    call s:haste_save()
endfunction

command! HasteSave :call <SID>HasteSave()
