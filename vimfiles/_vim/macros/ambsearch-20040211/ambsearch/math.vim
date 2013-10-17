" key_exchange.pl generate this file.  Don't edit.
if !exists('*AmbsearchAdd') | finish | endif
scriptencoding cp932
call AmbsearchAdd('+', 'Å}')
call AmbsearchAdd('-', 'Å}')
call AmbsearchAdd('<', 'ÅÖ')
call AmbsearchAdd('=', 'ÅÇÅÖÅÜ')
call AmbsearchAdd('>', 'ÅÜ')
