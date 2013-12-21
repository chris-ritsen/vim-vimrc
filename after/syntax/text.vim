
" TODO: this file causes slower startup on large buffers
highlight clear SpellBad

" call TextEnableCodeSnip(  'c',   '@begin=c@',   '@end=c@', 'SpecialComment')
" call TextEnableCodeSnip('cpp', '@begin=cpp@', '@end=cpp@', 'SpecialComment')
" call TextEnableCodeSnip('css', '<style>', '</style>', 'SpecialComment')
" call TextEnableCodeSnip('javascript', '<script>', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('php', '<?=', '?>', 'SpecialComment')
" call TextEnableCodeSnip('php', '<?php', '?>', 'SpecialComment')
" call TextEnableCodeSnip('php', '<script type=\"application/php\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('php', '<script type=\"php\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('sql', '@begin=sql@', '@end=sql@', 'SpecialComment')
" call TextEnableCodeSnip('vim', '<script type=\"application/vim\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('apache', '<script type=\"application/apache\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('diff', '<script type=\"text/diff\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('haskell', '<script type=\"application/haskell\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('html', '<html>', '</html>', 'SpecialComment')
" call TextEnableCodeSnip('javascript', '<script type=\"application/javascript\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('json', '<script type=\"application/json\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('lisp', '<script type=\"application/lisp\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('ruby', '<script type=\"application/ruby\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('python', '<script type=\"application/python\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('sh', '<script type=\"application/bash\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('sql', '<script type=\"application/sql\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('sshconfig', '<script type=\"application/sshconfig\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('xf86conf', '<script type=\"application/xorg\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('zsh', '<script type=\"application/zsh\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('c', '<script type=\"text/x-c\">', '</script>', 'SpecialComment')
" call TextEnableCodeSnip('asm', '<script type=\"text/asm\">', '</script>', 'SpecialComment')

" highlight DateRegular term=underline ctermfg=173 guifg=#e5786d
highlight DateIso8601 term=underline ctermfg=173 guifg=#e5786d
highlight SpellBad cterm=underline ctermfg=9 
match DateIso8601 /....-..-..T..:..:..Z/
syntax region foldHTML start=+^<html+ end=+^</html[^>]*>+ transparent keepend fold
syntax region foldScripts start=+^<script+ end=+^</script[^>]*>+ transparent keepend fold

