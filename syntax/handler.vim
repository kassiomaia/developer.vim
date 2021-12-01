" syntax/handler.vim
if exists('b:current_syntax')
  finish
end

syntax keyword handlerTodos TODO FIXME NOTE WARNING
syntax keyword handlerKeyword
  \ objType
  \ branch
  \ touch

syntax region handlerString start=/"/ skip=/\\"/ end=/"/ oneline contains=handlerInterpolatedWrapper
syntax region handlerInterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=handlerString contains=handlerInterpolatedString
syntax match handlerInterpolatedString "\v\w+(\(\))?" contained containedin=handlerInterpolatedWrapper

highlight default link handlerTodos Todo
highlight default link handlerKeyword Keyword
highlight default link handlerString String
highlight default link handlerInterpolatedWrapper Delimiter
