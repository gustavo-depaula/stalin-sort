function! s:StalinSort(list)
  if empty(a:list)
    return []
  endif
  let l:return = [a:list[0]]
  for x in a:list
    if x > l:return[-1]
      call add(l:return, x)
    endif
  endfor
  return l:return
endfunction

echo "Result: " . join(s:StalinSort([7, 8, 10, 3, 1, 11, 9, 20]), ",")

