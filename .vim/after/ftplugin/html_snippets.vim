" Latest Revision:  2008-11-11

if !exists('loaded_snippet') || &cp
	finish
endif

" {{{ vim functions
let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

function! SelectDoctype()
	let st = g:snip_start_tag
	let et = g:snip_end_tag
	let cd = g:snip_elem_delim
	let dt = inputlist(['Select doctype:',
				\ '1. HTML 4.01',
				\ '2. HTML 4.01 Transitional',
				\ '3. HTML 4.01 Frameset',
				\ '4. XHTML 1.0 Frameset',
				\ '5. XHTML Strict',
				\ '6. XHTML Transitional',
				\ '7. XHTML Frameset'])
	let dts = {1: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\n\"http://www.w3.org/TR/html4/strict.dtd\">\n".st.et,
				\ 2: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n\"http://www.w3.org/TR/html4/loose.dtd\">\n".st.et,
				\ 3: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"\n\"http://www.w3.org/TR/html4/frameset.dtd\">\n".st.et,
				\ 4: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">\n".st.et,
				\ 5: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n".st.et,
				\ 6: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n".st.et,
				\ 7: "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">\n".st.et}

	return dts[dt]
endfunction
" }}}
" {{{ Document type
exec "Snippet doct ``SelectDoctype()``"
exec "Snippet doctype <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"<CR><TAB>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et
exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"<CR>\"http://www.w3.org/TR/html4/strict.dtd\"><CR>".st.et
exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"<CR>\"http://www.w3.org/TR/html4/loose.dtd\"><CR>".st.et
exec "Snippet doc4f <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"<CR>\"http://www.w3.org/TR/html4/frameset.dtd\"><CR>".st.et
exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\"<CR>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><CR>".st.et
exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\"<CR>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><CR>".st.et
exec "Snippet docxf <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\"<CR>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et
" }}}
" {{{ Top-level Elements
" HTML document
exec "Snippet html <html><CR>".st.et."<CR></html>"

" Document head
exec "Snippet head <head><CR><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" /><CR><title>".st.et."</title><CR>".st.et."<CR></head><CR>".st.et

" Document body
exec "Snippet body <body><CR>".st.et."<CR></body>"
exec "Snippet bodyid <body id=\"".st.et."\" ".st.et."><CR>".st.et."<CR></body><CR>"
exec "Snippet bodycls <body class=\"".st.et."\" ".st.et."><CR>".st.et."<CR></body><CR>"
exec "Snippet bodyclass <body class=\"".st.et."\" ".st.et."><CR>".st.et."<CR></body><CR>"
" }}}
" {{{ Head Elements
" Document base URI
exec "Snippet base <base href=\"".st.et."\"".st.et." />".st.et

" Document relationship
exec "Snippet link <link rel=\"".st.et."\" href=\"".st.et."\" type=\"text/css\" media=\"".st.et."\" title=\"".st.et."\" charset=\"".st.et."\" />".st.et
exec "Snippet linkcss <link rel=\"stylesheet\" href=\"".st.et."\" type=\"text/css\" media=\"screen\" />".st.et

" Metadata
exec "Snippet meta <meta name=\"".st.et."\" content=\"".st.et."\" /><CR>".st.et

" Client-side script
exec "Snippet script <script type=\"text/javascript\" language=\"javascript\" charset=\"utf-8\"><CR>// <![CDATA[<CR><TAB>".st.et."<CR>// ]]><CR></script><CR>".st.et
exec "Snippet scriptsrc <script src=\"".st.et."\" type=\"text/javascript\" language=\"".st.et."\" charset=\"".st.et."\"></script><CR>".st.et

" Embedded stype sheet
exec "Snippet style <style type=\"text/css\" media=\"screen\"><CR>/* <![CDATA[ */<CR>".st.et."<CR>/* ]]> */<CR></style><CR>".st.et

" Document title
exec "Snippet title <title>".st.et."</title>"
" }}}
" {{{ Generic Block-level Elements
" Address
exec "Snippet address <address>".st.et."</address>".st.et

" Block quotation
exec "Snippet block <blockquote>".st.et."</blockquote>".st.et
exec "Snippet blockid <blockquote id=\"".st.et."\">".st.et."</blockquote>".st.et
exec "Snippet blockcls <blockquote class=\"".st.et."\">".st.et."</blockquote>".st.et
exec "Snippet blockclass <blockquote class=\"".st.et."\">".st.et."</blockquote>".st.et
exec "Snippet blockquote <blockquote>".st.et."</blockquote>".st.et
exec "Snippet blockquoteid <blockquote id=\"".st.et."\">".st.et."</blockquote>".st.et
exec "Snippet blockquotecls <blockquote class=\"".st.et."\">".st.et."</blockquote>".st.et
exec "Snippet blockquoteclass <blockquote class=\"".st.et."\">".st.et."</blockquote>".st.et

" Deleted text
exec "Snippet del <del>".st.et."</del>".st.et

" Generic block-level container
exec "Snippet div <div ".st.et."><CR>".st.et."<CR></div><CR>".st.et

" Heading
exec "Snippet h1 <h1>".st.et."</h1>".st.et
exec "Snippet h1id <h1 id=\"".st.et."\">".st.et."</h1>".st.et
exec "Snippet h1cls <h1 class=\"".st.et."\">".st.et."</h1>".st.et
exec "Snippet h1class <h1 class=\"".st.et."\">".st.et."</h1>".st.et

exec "Snippet h2 <h2>".st.et."</h2>".st.et
exec "Snippet h2id <h2 id=\"".st.et."\">".st.et."</h2>".st.et
exec "Snippet h2cls <h2 class=\"".st.et."\">".st.et."</h2>".st.et
exec "Snippet h2class <h2 class=\"".st.et."\">".st.et."</h2>".st.et

exec "Snippet h3 <h3>".st.et."</h3>".st.et
exec "Snippet h3id <h3 id=\"".st.et."\">".st.et."</h3>".st.et
exec "Snippet h3cls <h3 class=\"".st.et."\">".st.et."</h3>".st.et
exec "Snippet h3class <h3 class=\"".st.et."\">".st.et."</h3>".st.et

exec "Snippet h4 <h4>".st.et."</h4>".st.et
exec "Snippet h4id <h4 id=\"".st.et."\">".st.et."</h4>".st.et
exec "Snippet h4cls <h4 class=\"".st.et."\">".st.et."</h4>".st.et
exec "Snippet h4class <h4 class=\"".st.et."\">".st.et."</h4>".st.et

exec "Snippet h5 <h5>".st.et."</h5>".st.et
exec "Snippet h5id <h5 id=\"".st.et."\">".st.et."</h5>".st.et
exec "Snippet h5cls <h5 class=\"".st.et."\">".st.et."</h5>".st.et
exec "Snippet h5class <h5 class=\"".st.et."\">".st.et."</h5>".st.et

exec "Snippet h6 <h6>".st.et."</h6>".st.et
exec "Snippet h6id <h5 id=\"".st.et."\">".st.et."</h6>".st.et
exec "Snippet h6cls <h6 class=\"".st.et."\">".st.et."</h6>".st.et
exec "Snippet h6class <h6 class=\"".st.et."\">".st.et."</h6>".st.et

" Horizonatal rule
exec "Snippet hr <hr />".st.et
exec "Snippet hrid <hr id=\"".st.et."\" ".st.et." />".st.et
exec "Snippet hrcls <hr class=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet hrclass <hr class=\"".st.et."\" ".st.et."/>".st.et

" Inserted text
exec "Snippet ins <ins>".st.et."</ins>".st.et

" Alternate script content
exec "Snippet noscript <noscript>".st.et."</noscript>".st.et

" Paragraph
exec "Snippet para <p>".st.et."</p>".st.et
exec "Snippet paraid <p id=\"".st.et."\" ".st.et.">".st.et."</p>".st.et
exec "Snippet paracls <p class=\"".st.et."\" ".st.et.">".st.et."</p>".st.et
exec "Snippet paraclass <p class=\"".st.et."\" ".st.et.">".st.et."</p>".st.et

" Preformatted text
exec "Snippet pre <pre>".st.et."</pre>".st.et
exec "Snippet preformat <pre>".st.et."</pre>".st.et
" }}}
" {{{ Lists
" List item
exec "Snippet li <li>".st.et."</li><CR>".st.et
exec "Snippet liid <li id=\"".st.et."\" ".st.et.">".st.et."</li><CR>".st.et
exec "Snippet licls <li class=\"".st.et."\" ".st.et.">".st.et."</li><CR>".st.et
exec "Snippet liclass <li class=\"".st.et."\" ".st.et.">".st.et."</li><CR>".st.et

" Unordered list
exec "Snippet ul <ul type=\"".st.et."\"><CR>".st.et."<CR></ul>".st.et
exec "Snippet ulid <ul id=\"".st.et."\"><CR>".st.et."<CR></ul>".st.et
exec "Snippet ulcls <ul class=\"".st.et."\"><CR>".st.et."<CR></ul>".st.et
exec "Snippet ulclass <ul class=\"".st.et."\"><CR>".st.et."<CR></ul>".st.et

" Ordered list
exec "Snippet ol <ol type=\"".st.et."\"><CR>".st.et."<CR></ol>".st.et
exec "Snippet olid <ol id=\"".st.et."\"><CR>".st.et."<CR></ol>".st.et
exec "Snippet olcls <ol class=\"".st.et."\"><CR>".st.et."<CR></ol>".st.et
exec "Snippet olclass <ol class=\"".st.et."\"><CR>".st.et."<CR></ol>".st.et
" }}}
" {{{ Tables
" Table
exec "Snippet table <table border=\"".st.et."\" cellspacing=\"".st.et."\" cellpadding=\"".st.et."\" width=\"".st.et."\"".st.et."><CR>".st.et."<CR></table>".st.et
exec "Snippet tableid <table id=\"".st.et."\"><CR>".st.et."<CR></table>".st.et
exec "Snippet tablecls <table class=\"".st.et."\"><CR>".st.et."<CR></table>".st.et
exec "Snippet tableclass <table class=\"".st.et."\"><CR>".st.et."<CR></table>".st.et

" Table caption
exec "Snippet caption <caption>".st.et."</caption>".st.et

" Table Column group
exec "Snippet colgroup <colgroup span=\"".st.et."\" width=\"".st.et."\"".st.et." />".st.et

" Table column
exec "Snippet col <col span=\"".st.et."\" width=\"".st.et."\"".st.et." />".st.et

" Table head
exec "Snippet thead <thead><CR>".st.et."<CR></thead>".st.et

" Table foot
exec "Snippet tfoot <tfoot><CR>".st.et."<CR></tfoot>".st.et

" Table body
exec "Snippet tbody <tbody><CR>".st.et."<CR></tbody>".st.et

" Table row
exec "Snippet tr <tr><CR>".st.et."<CR></tr>".st.et
exec "Snippet trid <tr id=\"".st.et."\"><CR>".st.et."<CR></tr>".st.et
exec "Snippet trcls <tr class=\"".st.et."\"><CR>".st.et."<CR></tr>".st.et
exec "Snippet trclass <tr class=\"".st.et."\"><CR>".st.et."<CR></tr>".st.et

" Table header cell
exec "Snippet th <th>".st.et."</th>".st.et
exec "Snippet thid <th id=\"".st.et."\">".st.et."</th>".st.et
exec "Snippet thcls <th class=\"".st.et."\">".st.et."</th>".st.et
exec "Snippet thclass <th class=\"".st.et."\">".st.et."</th>".st.et

" Table data cell
exec "Snippet td <td>".st.et."</td>".st.et
exec "Snippet tdid <td id=\"".st.et."\">".st.et."</td>".st.et
exec "Snippet tdcls <td class=\"".st.et."\">".st.et."</td>".st.et
exec "Snippet tdclass <td class=\"".st.et."\">".st.et."</td>".st.et

" }}}
" {{{ Forms
" Interactive form
exec "Snippet form <form action=\"".st.et."\" method=\"".st.et."\"><CR>".st.et."<CR></form><CR>".st.et
" exec "Snippet form <form action=\"".st.et."\" method=\"".st.et."\"><CR>".st.et."<CR><CR><p><input type=\"submit\" value=\"Continue &rarr;\" /></p><CR></form><CR>".st.et

" Button
exec "Snippet button <button type=\"".st.et."\" name=\"".st.et."\" value=\"".st.et."\"><CR>".st.et."<CR></button>".st.et

" Form input
exec "Snippet input <input type=\"".st.et."\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet text <input type=\"text\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet radio <input type=\"radio\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet checkbox <input type=\"checkbox\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet submit <input type=\"submit\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet reset <input type=\"reset\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et

" Form field label
exec "Snippet label <label for=\"".st.et."\" accesskey=\"".st.et."\">".st.et."</label>".st.et

" Option selector
exec "Snippet select <select name=\"".st.et."\"><CR>".st.et."<CR></select>".st.et

" Menu option
exec "Snippet option <option value=\"".st.et."\">".st.et."</option>".st.et

" Multi-line text input
exec "Snippet textarea <textarea name=\"".st.et."\" rows=\"".st.et."\" cols=\"".st.et."\">".st.et."</textarea><CR>".st.et
" }}}
" {{{ Special Inline Elements
" Anchor
exec "Snippet ahref <a href=\"".st.et."\">".st.et."</a>".st.et
exec "Snippet aname <a name=\"".st.et."\">".st.et."</a>".st.et
exec "Snippet mailto <a href=\"mailto:".st.et."?subject=".st.et."\">".st.et."</a>".st.et

" Line break
exec "Snippet br <br />".st.et

" Font change
exec "Snippet font <font ".st.et.">".st.et."</font>".st.et

" Image map
exec "Snippet img <img src=\"".st.et."\" alt=\"".st.et."\" width=\"".st.et."\" height=\"".st.et."\" ".st.et."/>".st.et

" Object
exec "Snippet movie <object width=\"".st.et."\" height=\"".st.et."\"<CR>classid=\"clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\"<CR>codebase=\"http://www.apple.com/qtactivex/qtplugin.cab\"><CR><param name=\"src\"<CR>value=\"".st.et."\" /><CR><param name=\"controller\" value=\"".st.et."\" /><CR><param name=\"autoplay\" value=\"".st.et."\" /><CR><embed src=\"".st.et."\"<CR>width=\"".st.et."\" height=\"".st.et."\"<CR>controller=\"".st.et."\" autoplay=\"".st.et."\"<CR>scale=\"tofit\" cache=\"true\"<CR>pluginspage=\"http://www.apple.com/quicktime/download/\"<CR>/><CR></object><CR>".st.et

" Subscript
exec "Snippet sub <sub>".st.et."</sub>".st.et

" Superscript
exec "Snippet sup <sup>".st.et."</sup>".st.et
" }}}
" {{{ Phrase Elements
" Computer code
exec "Snippet code <code>".st.et."</code>".st.et
exec "Snippet codeid <code id=\"".st.et."\">".st.et."</code>".st.et
exec "Snippet codecls <code class=\"".st.et."\">".st.et."</code>".st.et
exec "Snippet codeclass <code class=\"".st.et."\">".st.et."</code>".st.et

" Emphasis
exec "Snippet em <em>".st.et."</em>".st.et
" }}}
" {{{ Font Style Elements
" Bold text
exec "Snippet bold <b>".st.et."</b>".st.et

" Large text
exec "Snippet big <big>".st.et."</big>".st.et

" Italic text
exec "Snippet italic <i>".st.et."</i>".st.et

" Small text
exec "Snippet small <small>".st.et."</small>".st.et

" Strike-through text
exec "Snippet strike <strike>".st.et."</strike>".st.et

" Underlined text
exec "Snippet underline <u>".st.et."</u>".st.et
" }}}
" {{{ Frames
" Frameset
exec "Snippet frameset <frameset rows=\"".st.et."\" cols=\"".st.et."\"".st.et."><CR>".st.et."<CR></frameset>"

" Frame
exec "Snippet frame <frame name=\"".st.et."\" src=\"".st.et."\" title=\"".st.et."\"".st.et."\>".st.et
" }}}

" vim: set foldmethod=marker: set fenc=utf-8:
