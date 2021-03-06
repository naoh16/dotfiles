if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

"Snippet !env #!/usr/bin/env ${1:${TM_SCOPE/(?:source|.*)\\.(\\w+).*/$1/}}
exec "Snippet if if [[ ".st."condition".et." ]]; then<CR>".st.et."<CR>fi".st.et
exec "Snippet elif elif [[ ".st."condition".et." ]]; then<CR>".st.et
exec "Snippet for for (( ".st."i".et." = ".st.et."; ".st."i".et." ".st.et."; ".st."i".et.st.et." )); do<CR>".st.et."<CR>done".st.et

" My snippets
exec "Snippet getopts while getopts \"ab:\" flag; do<CR>case $flag in<CR>\\?) OPT_ERROR=1; break;;<CR>a) opt_a=true;;<CR>b) opt_b=\"$OPTARG\";;<CR>esac<CR>done<CR><CR>shift $(( $OPTIND - 1 ))<CR><CR>if [ $OPT_ERROR ]; then<CR>exit 1<CR>fi<CR><CR>"
exec "Snippet case case $".st."var".et." in<CR>a) ;;<CR>*);; # default<CR>esac<CR>"
exec "Snippet for2 for i in 1 2 3 4 5; do<CR>;<CR>done<CR>"
