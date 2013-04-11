function! AutoFormatRails()
  "Save cursor position
  let l:winview = winsaveview()

  "Remove trailing whitespace
  %s/\s\+$//e

  "Perform indentation
  norm gg=G

  "Remove blank lines after a comma
  %s/,\n\n*/,\r/e

  "Don't allow more than 3 consecutive newlines
  %s/\n\n\n\n*/\r\r\r/e

  "Ruby-file fixes
  if expand('%:e') == 'rb'
    "Remove extra lines after 'do'
    %s/ do\(\s*|.*|\)\n\n*/ do\1\r/e
    %s/ do\n\n*/ do\r/e

    "Remove extra lines after 'def'
    %s/^\(\s*def \)\(.*\)\n\n*/\1\2\r/e

    "Insert two newlines after any 'end'
    %s/end\n\n*/end\r\r/e

    "Remove all newlines before 'end'
    %s/^\n*\( *\)end/\1end/e

    "Remove all newlines before 'else'
    %s/^\n*\( *\)else/\1else/e
  endif

  "ERB-fixes
  if expand('%:e') == 'erb'
    "Always have one space after '<%=', '<%#', '<%-', or '<%'
    %s/<%\([=#-]\?\)\s*/<%\1 /e

    "Always have one space before '-%>' or '%>'
    %s/\s*\(-\?\)%>/ \1%>/e
  endif

  "Cucumber-file fixes
  if expand('%:e') == 'feature'
    "Standard indentation for scenarios
    %s/\n*  Scenario/\r\r  Scenario/e

    "Standard indentation for scenarios
    %s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/e
  endif

  "CSS-only fixes
  if expand('%:e') == 'css' || expand('%:e') == 'scss'
    "Insert a space after all non-selector colons
    %s/:\s*\(.*\)\s*;/: \1;/e

    "Always remove spaces before selector colons
    %s/\(\w*:\)\s*\(.*\)\s*{/\1\2 {/e

    "Always insert { character on same line as declaration
    %s/\s*\n*{/ {/e

    "Insert a return character after all }
    %s/\}\n*/}\r/e

    "Insert a second return character between } and other styles
    %s/\}\n*\(\s*[a-z#\.&\*\@]\)/}\r\r\1/e

    "Add a space above comment lines
    %s/\([;}]\)\n\(\s*\)\/\//\1\r\r\2\/\//e
  endif

  "Remove trailing newlines
  %s/\n*\%$//e

  "Remove highlighting
  nohls

  "Restore cursor position
  call winrestview(l:winview)
endfunction

" Call AutoFormat by typing \==
map <silent> <LocalLeader>== :silent call AutoFormatRails()<CR>
