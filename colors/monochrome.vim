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
let s:black  = ['#0e1111', 16]
let s:bgray  = ['#101010', 233]
let s:lgray  = ['LightGray', 255]
let s:cgray  = ['#737373', 243]
let s:dgray  = ['DarkGray', 248]
let s:sblue  = ['#778899', 67]
let s:yellow = ['Yellow', 226]
let s:red    = ['#b6403a', 160]
let s:green  = ['#478226', 28]

let s:default_fg = s:lgray
let s:default_bg = s:black

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:underline = 'underline'
let s:none      = 'NONE'

let s:default_lst = []
let s:default_str = ''

if !exists("g:monochrome_italic_comments")
  let g:monochrome_italic_comments = 0
endif
let s:comment_attr = g:monochrome_italic_comments ? s:italic : s:none

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:default_str)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    if attr != s:default_str
        call add(cmd, 'gui='.attr)
        call add(cmd, 'cterm='.attr)
        call add(cmd, 'term='.attr)
    endif

    exec join(cmd, ' ')
endfunction

" Basic colors.
call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)

" Cursor line.
call s:hi('CursorLine', s:default_lst, s:bgray, s:default_str)
call s:hi('CursorLineNr', s:white, s:default_bg, s:bold)

" Color column.
call s:hi('ColorColumn', s:default_fg, s:bgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:dgray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:default_fg, s:default_bg, s:bold)

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

" Diffs
call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('diffAdded', s:green)
call s:hi('diffRemoved', s:red)

" vim-fugitive
call s:hi('gitcommitComment', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitOnBranch', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitBranch', s:sblue, s:default_bg, s:none)
call s:hi('gitcommitHeader', s:white, s:default_bg, s:bold)
call s:hi('gitcommitSelected', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscarded', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitSelectedType', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscardedType', s:default_fg, s:default_bg, s:none)

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
