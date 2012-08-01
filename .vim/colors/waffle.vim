

" Vim color file
" Maintainer: blah
" Last Change: blah 

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="waffle"

" syntax highlighting groups ----------------------------------------

hi Pmenu      ctermbg=68 ctermfg=0
hi PmenuSel   ctermbg=17 ctermfg=68
hi PmenuSbar  ctermbg=248
hi PmenuThumb cterm=reverse

hi NonText ctermfg=61

hi LineNr ctermfg=237 ctermbg=232

hi TabLine     ctermbg=25
hi TabLineFill ctermfg=25
hi StatusLine  cterm=NONE ctermfg=0 ctermbg=60

hi Folded       ctermfg=66 ctermbg=232
hi FoldColumn   ctermfg=23 ctermbg=232

hi Normal	   ctermfg=252  ctermbg=232
hi Comment    ctermfg=244
hi Constant   ctermfg=176
"hi Identifier ctermfg=173
hi Identifier ctermfg=176
hi Statement  ctermfg=147
hi PreProc    ctermfg=105
hi Type       ctermfg=231
hi special    ctermfg=117   cterm=none
hi Underlined ctermfg=63    cterm=bold
hi Ignore     ctermfg=239
hi Error      ctermfg=124
hi Todo       ctermfg=226   ctermbg=124
hi Operator   ctermfg=39    ctermbg=none
hi Function   ctermfg=33
hi String     ctermfg=68    ctermbg=None
hi Boolean    ctermfg=114

hi link Character Constant
hi link Number    Constant
hi link Boolean   Constant
hi link Float   Number
hi link Conditional Statement
hi link Label   Statement
hi link Keyword   Statement
hi link Exception Statement
hi link Repeat    Statement
hi link Include   PreProc
hi link Define    PreProc
hi link Macro   PreProc
hi link PreCondit PreProc
hi link StorageClass  Type
hi link Structure Type
hi link Typedef   Type
hi link Tag   Special
hi link Delimiter Special
hi link SpecialComment  Special
hi link Debug   Special
hi link FoldColumn  Folded

"- end of colorscheme -----------------------------------------------	
