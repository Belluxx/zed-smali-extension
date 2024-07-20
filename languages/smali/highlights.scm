;The MIT License (MIT)
;
;Copyright (c) 2023 Yotam Nachum <me@yotam.net>, Amaan Qureshi <amaanq12@gmail.com>
;
;Permission is hereby granted, free of charge, to any person obtaining a copy
;of this software and associated documentation files (the "Software"), to deal
;in the Software without restriction, including without limitation the rights
;to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;copies of the Software, and to permit persons to whom the Software is
;furnished to do so, subject to the following conditions:
;
;The above copyright notice and this permission notice shall be included in all
;copies or substantial portions of the Software.
;
;THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;SOFTWARE.

; Types

(class_identifier
  (identifier) @type)

(primitive_type) @type.builtin

((class_identifier
   . (identifier) @_first @type.builtin
   (identifier) @type.builtin)
  (#any-of? @_first "android" "dalvik" "java" "kotlinx"))

((class_identifier
   . (identifier) @_first @type.builtin
   .  (identifier) @_second @type.builtin
   (identifier) @type.builtin)
  (#eq? @_first "com")
  (#any-of? @_second "android" "google"))

; Methods

(method_definition
  (method_signature (method_identifier) @method))

(expression
  (opcode) @_invoke
	(body
	  (full_method_signature
      (method_signature (method_identifier) @method.call)))
  (#lua-match? @_invoke "^invoke"))

(method_handle
  (full_method_signature
	(method_signature (method_identifier) @method.call)))

(custom_invoke
  . (identifier) @method.call
  (method_signature (method_identifier) @method.call))

(annotation_value
  (body
    (method_signature (method_identifier) @method.call)))

(annotation_value
  (body
    (full_method_signature
      (method_signature (method_identifier) @method.call))))

(field_definition
	(body
		(method_signature (method_identifier) @method.call)))

(field_definition
	(body
	  (full_method_signature
		  (method_signature (method_identifier) @method.call))))

((method_identifier) @constructor
  (#any-of? @constructor "<init>" "<clinit>"))

"constructor" @constructor

; Fields

[
  (field_identifier)
  (annotation_key)
] @field

((field_identifier) @constant
  (#lua-match? @constant "^[%u_]*$"))

; Variables

(variable) @variable.builtin

(local_directive
  (identifier) @variable)

; Parameters

(parameter) @parameter.builtin
(param_identifier) @parameter

; Labels

[
  (label)
  (jmp_label)
] @label

; Operators

(opcode) @keyword.operator

((opcode) @keyword.return
  (#lua-match? @keyword.return "^return"))

((opcode) @conditional
  (#lua-match? @conditional "^if"))

((opcode) @conditional
  (#lua-match? @conditional "^cmp"))

((opcode) @exception
  (#lua-match? @exception "^throw"))

((opcode) @comment
  (#eq? @comment "nop")) ; haha, anyone get it? ;)

[
  "="
  ".."
] @operator

; Keywords

[
  ".class"
  ".super"
  ".implements"
  ".field"
  ".end field"
  ".annotation"
  ".end annotation"
  ".subannotation"
  ".end subannotation"
  ".param"
  ".end param"
  ".parameter"
  ".end parameter"
  ".line"
  ".locals"
  ".local"
  ".end local"
  ".restart local"
  ".registers"
  ".packed-switch"
  ".end packed-switch"
  ".sparse-switch"
  ".end sparse-switch"
  ".array-data"
  ".end array-data"
  ".enum"
  (prologue_directive)
  (epilogue_directive)
] @keyword

[
  "move"
  "move/from16"
  "move/16"
  "move-wide"
  "move-wide/from16"
  "move-wide/16"
  "move-object"
  "move-object/from16"
  "move-object/16"
  "move-result"
  "move-result-wide"
  "move-result-object"
  "move-exception"
  "return-void"
  "return"
  "return-wide"
  "return-object"
  "const/4"
  "const/16"
  "const"
  "const/high16"
  "const-wide/16"
  "const-wide/32"
  "const-wide"
  "const-wide/high16"
  "const-string"
  "const-string/jumbo"
  "const-class"
  "const-method-handle"
  "const-method-type"
  "monitor-enter"
  "monitor-exit"
  "check-cast"
  "instance-of"
  "array-length"
  "new-instance"
  "new-array"
  "filled-new-array"
  "filled-new-array/range"
  "fill-array-data"
  "throw"
  "throw-verification-error"
  "goto"
  "goto/16"
  "goto/32"
  "packed-switch"
  "sparse-switch"
  "cmpl-float"
  "cmpg-float"
  "cmpl-double"
  "cmpg-double"
  "cmp-long"
  "if-eq"
  "if-ne"
  "if-lt"
  "if-ge"
  "if-gt"
  "if-le"
  "if-eqz"
  "if-nez"
  "if-ltz"
  "if-gez"
  "if-gtz"
  "if-lez"
  "aget"
  "aget-wide"
  "aget-object"
  "aget-boolean"
  "aget-byte"
  "aget-char"
  "aget-short"
  "aput"
  "aput-wide"
  "aput-object"
  "aput-boolean"
  "aput-byte"
  "aput-char"
  "aput-short"
  "iget"
  "iget-wide"
  "iget-object"
  "iget-boolean"
  "iget-byte"
  "iget-char"
  "iget-short"
  "iget-volatile"
  "iget-wide-volatile"
  "iget-object-volatile"
  "iput"
  "iput-wide"
  "iput-object"
  "iput-boolean"
  "iput-byte"
  "iput-char"
  "iput-short"
  "iput-volatile"
  "iput-wide-volatile"
  "iput-object-volatile"
  "sget"
  "sget-wide"
  "sget-object"
  "sget-boolean"
  "sget-byte"
  "sget-char"
  "sget-short"
  "sget-volatile"
  "sget-wide-volatile"
  "sget-object-volatile"
  "sput"
  "sput-wide"
  "sput-object"
  "sput-boolean"
  "sput-byte"
  "sput-char"
  "sput-short"
  "sput-volatile"
  "sput-wide-volatile"
  "sput-object-volatile"
  "invoke-constructor"
  "invoke-custom"
  "invoke-direct"
  "invoke-direct-empty"
  "invoke-instance"
  "invoke-interface"
  "invoke-polymorphic"
  "invoke-static"
  "invoke-super"
  "invoke-virtual"
  "invoke-custom/range"
  "invoke-direct/range"
  "invoke-interface/range"
  "invoke-object-init/range"
  "invoke-polymorphic/range"
  "invoke-static/range"
  "invoke-super/range"
  "invoke-virtual/range"
  "neg-int"
  "not-int"
  "neg-long"
  "not-long"
  "neg-float"
  "neg-double"
  "int-to-long"
  "int-to-float"
  "int-to-double"
  "long-to-int"
  "long-to-float"
  "long-to-double"
  "float-to-int"
  "float-to-long"
  "float-to-double"
  "double-to-int"
  "double-to-long"
  "double-to-float"
  "int-to-byte"
  "int-to-char"
  "int-to-short"
  "add-int"
  "sub-int"
  "mul-int"
  "div-int"
  "rem-int"
  "and-int"
  "or-int"
  "xor-int"
  "shl-int"
  "shr-int"
  "ushr-int"
  "add-long"
  "sub-long"
  "mul-long"
  "div-long"
  "rem-long"
  "and-long"
  "or-long"
  "xor-long"
  "shl-long"
  "shr-long"
  "ushr-long"
  "add-float"
  "sub-float"
  "mul-float"
  "div-float"
  "rem-float"
  "add-double"
  "sub-double"
  "mul-double"
  "div-double"
  "rem-double"
  "add-int/2addr"
  "sub-int/2addr"
  "mul-int/2addr"
  "div-int/2addr"
  "rem-int/2addr"
  "and-int/2addr"
  "or-int/2addr"
  "xor-int/2addr"
  "shl-int/2addr"
  "shr-int/2addr"
  "ushr-int/2addr"
  "add-long/2addr"
  "sub-long/2addr"
  "mul-long/2addr"
  "div-long/2addr"
  "rem-long/2addr"
  "and-long/2addr"
  "or-long/2addr"
  "xor-long/2addr"
  "shl-long/2addr"
  "shr-long/2addr"
  "ushr-long/2addr"
  "add-float/2addr"
  "sub-float/2addr"
  "mul-float/2addr"
  "div-float/2addr"
  "rem-float/2addr"
  "add-double/2addr"
  "sub-double/2addr"
  "mul-double/2addr"
  "div-double/2addr"
  "rem-double/2addr"
  "add-int/lit16"
  "sub-int/lit16"
  "mul-int/lit16"
  "div-int/lit16"
  "rem-int/lit16"
  "and-int/lit16"
  "or-int/lit16"
  "xor-int/lit16"
  "add-int/lit8"
  "sub-int/lit8"
  "mul-int/lit8"
  "div-int/lit8"
  "rem-int/lit8"
  "and-int/lit8"
  "or-int/lit8"
  "xor-int/lit8"
  "shl-int/lit8"
  "shr-int/lit8"
  "ushr-int/lit8"
  "static-get"
  "static-put"
  "instance-get"
  "instance-put"
  "execute-inline"
  "execute-inline/range"
  "iget-quick"
  "iget-wide-quick"
  "iget-object-quick"
  "iput-quick"
  "iput-wide-quick"
  "iput-object-quick"
  "iput-boolean-quick"
  "iput-byte-quick"
  "iput-char-quick"
  "iput-short-quick"
  "invoke-virtual-quick"
  "invoke-virtual-quick/range"
  "invoke-super-quick"
  "invoke-super-quick/range"
  "rsub-int"
  "rsub-int/lit8"
] @keyword.operator

[
  ".source"
] @include

[
  ".method"
  ".end method"
] @keyword.function

[
  ".catch"
  ".catchall"
] @exception

; Literals

(string) @string
(source_directive (string "\"" _ @text.uri "\""))
(escape_sequence) @string.escape

(character) @character

"L" @character.special

(number) @number

[
 (float)
 (NaN)
 (Infinity)
] @float

(boolean) @boolean

(null) @constant.builtin

; Misc

(annotation_visibility) @storageclass

(access_modifier) @type.qualifier

(array_type
  "[" @punctuation.special)

["{" "}"] @punctuation.bracket

["(" ")"] @punctuation.bracket

[
  "->"
  ","
  ":"
  ";"
  "@"
  "/"
] @punctuation.delimiter

(line_directive (number) @text.underline @text.literal)

; Comments

(comment) @comment @spell

(class_definition
  (comment) @comment.documentation)

; Errors

(ERROR) @error
