" Vim color scheme
"
" Name:       monochrome.vim
" Maintainer: Xavier Noria <fxn@hashref.com>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'monochrome'

let s:white  = ['White', 15]
let s:black  = ['Black', 16]
let s:bgray  = ['#101010', 233]
let s:lgray  = ['LightGray', 255]
let s:cgray  = ['#737373', 243]
let s:dgray  = ['DarkGray', 248]
let s:sblue  = ['#778899', 67]
let s:yellow = ['Yellow', 226]

let s:default_fg = s:lgray
let s:default_bg = s:black

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:underline = 'underline'
let s:none      = 'NONE'

if !exists("g:monochrome_italic_comments")
  let g:monochrome_italic_comments = 0
endif
let s:comment_attr = g:monochrome_italic_comments ? s:italic : s:none

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:none)

    let cmd = ['hi', group]
    call add(cmd, 'guifg='.fg[0])
    call add(cmd, 'guibg='.bg[0])
    call add(cmd, 'gui='.attr)
    call add(cmd, 'ctermfg='.fg[1])
    call add(cmd, 'ctermbg='.bg[1])
    call add(cmd, 'cterm='.attr)
    call add(cmd, 'term='.attr)

    exec join(cmd, ' ')
endfunction

" Basic colors.
call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)

" Cursor line.
call s:hi('CursorLine', s:default_fg, s:bgray)
call s:hi('CursorLineNr', s:white, s:default_bg, s:bold)

" Color column.
call s:hi('ColorColumn', s:default_fg, s:bgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:dgray)

" Main groups for programming languages.
call s:hi('Statement', s:white, s:default_bg, s:bold)
call s:hi('PreProc', s:white, s:default_bg, s:bold)
call s:hi('String', s:sblue)
call s:hi('Comment', s:cgray, s:default_bg, s:comment_attr)
call s:hi('Constant')
call s:hi('Type', s:white, s:default_bg, s:bold)
call s:hi('Function', s:white)
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:black, s:lgray)

" Ruby.
call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:cgray)
call s:hi('rubyStringDelimiter', s:sblue)
call s:hi('rubyStringEscape', s:sblue)
call s:hi('rubyRegexpEscape', s:sblue)
call s:hi('rubyRegexpAnchor', s:sblue)
call s:hi('rubyRegexpSpecial', s:sblue)

" Perl.
call s:hi('perlSharpBang', s:cgray)
call s:hi('perlStringStartEnd', s:sblue)
call s:hi('perlStringEscape', s:sblue)
call s:hi('perlMatchStartEnd', s:sblue)

" Python.
call s:hi('pythonEscape', s:sblue)

" JavaScript.
call s:hi('javaScriptFunction', s:white, s:default_bg, s:bold)

" Elixir.
call s:hi('elixirDelimiter', s:sblue)
call s:hi('elixirDocTest', s:cgray, s:default_bg, s:comment_attr)

" VimL.
call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
call s:hi('vimCommentTitle', s:cgray)

" Search.
call s:hi('Search', s:white, s:sblue)
call s:hi('Visual', s:white, s:sblue)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:dgray)

" File browsers.
call s:hi('Directory', s:white, s:default_bg, s:bold)

" Markup
call s:hi('Title', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:white, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:sblue, s:default_bg, s:underline)

" Notes.
call s:hi('Todo', s:black, s:yellow, s:bold)

" Popup menu.
call s:hi('Pmenu', s:white, s:sblue)
call s:hi('PmenuSel', s:sblue, s:white)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:sblue, s:default_bg, s:underline)
call s:hi('helpNote')

" NeoMake
call s:hi('NeomakeMessageSign')
call s:hi('NeomakeWarningSign', s:sblue)
call s:hi('NeomakeErrorSign', s:yellow)
call s:hi('NeomakeInfoSign')
call s:hi('NeomakeError', s:yellow)
call s:hi('NeomakeInfo', s:default_fg, s:default_bg, s:bold)
call s:hi('NeomakeMessage')
call s:hi('NeomakeWarning', s:yellow)
