(module
 (type $0 (array (mut eqref)))
 (type $1 (struct (field (mut (ref null $0))) (field (mut i32))))
 (type $2 (struct (field stringref)))
 (type $3 (struct (field (mut i64))))
 (type $4 (struct (field (ref null $1))))
 (type $5 (array stringref))
 (type $6 (struct ))
 (type $7 (struct (field stringref) (field (ref null $6)) (field (ref null $5))))
 (type $8 (array (ref null $7)))
 (type $9 (struct (field stringref) (field (ref null $2)) (field (ref null $8))))
 (type $10 (array (mut f64)))
 (type $11 (struct (field (mut (ref null $10))) (field (mut i32))))
 (type $12 (struct (field i32)))
 (type $13 (struct (field stringref) (field stringref) (field f64) (field (ref null $9))))
 (type $14 (struct (field stringref) (field (ref null $2)) (field (ref null $13))))
 (type $15 (struct (field i64) (field f64)))
 (type $16 (struct (field (ref null $11)) (field stringref) (field f64) (field (ref null $15))))
 (type $17 (struct (field f64)))
 (type $18 (struct (field i64)))
 (type $19 (array f64))
 (type $20 (func (param i32) (result externref)))
 (type $21 (func (param externref i32 i32)))
 (type $22 (func (param stringref) (result i32)))
 (type $23 (func (param stringref stringref) (result i32)))
 (type $24 (func (param (ref null $6) stringref (ref null $5)) (result (ref null $7))))
 (type $25 (func (param (ref null $5)) (result (ref null $2))))
 (type $26 (func (param (ref null $2) (ref null $6) stringref (ref null $8)) (result (ref null $9))))
 (type $27 (func (param (ref null $4) (ref null $7))))
 (type $28 (func (param (ref null $4) (ref null $9))))
 (type $29 (func (param stringref)))
 (type $30 (func (param externref i32 f64)))
 (type $31 (func (param externref i32 stringref)))
 (type $32 (func (param externref i32 externref)))
 (type $33 (func (param (ref null $1)) (result externref)))
 (type $34 (func (param externref) (result stringref)))
 (type $35 (func (param (ref null $14)) (result stringref)))
 (type $36 (func (param stringref) (result externref)))
 (type $37 (func (param externref stringref)))
 (type $38 (func (result externref)))
 (type $39 (func (param (ref null $11)) (result externref)))
 (type $40 (func (param externref stringref externref)))
 (type $41 (func (param externref stringref stringref)))
 (type $42 (func (param externref stringref f64)))
 (type $43 (func (param externref i32 i64)))
 (type $44 (func (param (ref null $16)) (result externref)))
 (type $45 (func (param externref)))
 (type $46 (func (param f64) (result f64)))
 (import "js" "x => console.log(x)" (func $x____console_log_x_NothingString (type $29) (param stringref)))
 (import "js" "n => Array(n)" (func $n____Array_n_ExternrefInt32 (type $20) (param i32) (result externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Float64 (type $30) (param externref i32 f64)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Int32 (type $21) (param externref i32 i32)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32String (type $31) (param externref i32 stringref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Bool (type $21) (param externref i32 i32)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Externref (type $32) (param externref i32 externref)))
 (import "js" "(x) => x.join("")" (func $_x_____x_join____StringExternref (type $34) (param externref) (result stringref)))
 (import "js" "(x) => document.getElementById(x)" (func $_x_____document_getElementById_x_ExternrefString (type $36) (param stringref) (result externref)))
 (import "js" "(x, str) => x.innerHTML = str" (func $_x__str_____x_innerHTML___strNothingExternrefString (type $37) (param externref stringref)))
 (import "js" "() => ({})" (func $__________Externref (type $38) (result externref)))
 (import "js" "n => new Float64Array(n)" (func $n____new_Float64Array_n_ExternrefInt32 (type $20) (param i32) (result externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefStringExternref (type $40) (param externref stringref externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefStringString (type $41) (param externref stringref stringref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefStringFloat64 (type $42) (param externref stringref f64)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Int64 (type $43) (param externref i32 i64)))
 (import "js" "(x) => console.log(x)" (func $_x_____console_log_x_NothingExternref (type $45) (param externref)))
 (global $g18446744070140057708 (ref null $6) (struct.new_default $6))
 (global $g9918849156355524007 stringref (string.const "strong"))
 (global $g17301565310365817963 stringref (string.const " This is strong text with a class."))
 (global $g6816192608897699015 stringref (string.const "myclass"))
 (global $g8580268782864986099 stringref (string.const "p"))
 (global $g14258755914009136683 stringref (string.const "myclass2"))
 (global $g6488948652265397272 stringref (string.const "This is some text generated by `JS.h`. "))
 (global $g7358550468979330460 stringref (string.const "This is a number: "))
 (global $g18272296077325620145 stringref (string.const "div"))
 (global $g8175604835841164500 stringref (string.const "<"))
 (global $g17198871470474041807 stringref (string.const "true"))
 (global $g14823181248367563234 stringref (string.const " "))
 (global $g5132061904752741767 stringref (string.const "class"))
 (global $g1212563229133860075 stringref (string.const "false"))
 (global $g5057529045379675022 stringref (string.const "=\""))
 (global $g9200817720073813500 stringref (string.const "\""))
 (global $g6706693452496592420 stringref (string.const ">"))
 (global $g6774991521086689941 stringref (string.const "</"))
 (global $g18446744069659016546 (ref null $6) (struct.new_default $6))
 (global $g9185389319346651987 stringref (string.const "Inexact conversion"))
 (global $g17162084985387159482 stringref (string.const "myid"))
 (global $g7295687158209573762 stringref (string.const "hello"))
 (global $g7448992671694014603 stringref (string.const "arr"))
 (global $g6881845355274915569 stringref (string.const "str"))
 (global $g10945161902043969273 stringref (string.const "num"))
 (global $g4112483206321728189 stringref (string.const "tp"))
 (export "basics" (func $basics))
 (func $hash-string (type $22) (param $s stringref) (result i32)
  (return
   (string.hash
    (local.get $s)
   )
  )
 )
 (func $string-eq (type $23) (param $s1 stringref) (param $s2 stringref) (result i32)
  (return
   (string.eq
    (local.get $s1)
    (local.get $s2)
   )
  )
 )
 (func $julia_hStringTuple_String_ (type $24) (param $0 (ref null $6)) (param $1 stringref) (param $2 (ref null $5)) (result (ref null $7))
  (local $3 stringref)
  (local $4 (ref null $5))
  (local $5 (ref null $7))
  (block
   (local.set $3
    (array.get $5
     (local.get $2)
     (i32.add
      (i32.wrap_i64
       (i64.const 1)
      )
      (i32.const -1)
     )
    )
   )
   (local.set $4
    (array.new_fixed $5 1
     (local.get $3)
    )
   )
   (local.set $5
    (struct.new $7
     (local.get $1)
     (struct.new_default $6)
     (local.get $4)
    )
   )
   (return
    (local.get $5)
   )
  )
 )
 (func $julia_NamedTupleTuple_String_ (type $25) (param $0 (ref null $5)) (result (ref null $2))
  (local $1 stringref)
  (local $2 (ref null $2))
  (block
   (local.set $1
    (array.get $5
     (local.get $0)
     (i32.add
      (i32.wrap_i64
       (i64.const 1)
      )
      (i32.const -1)
     )
    )
   )
   (local.set $2
    (struct.new $2
     (local.get $1)
    )
   )
   (return
    (local.get $2)
   )
  )
 )
 (func $julia_hNamedTuple___class____Tuple_String__typeof_WebAssemblyCompiler_JS_h_StringTuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String___ (type $26) (param $0 (ref null $2)) (param $1 (ref null $6)) (param $2 stringref) (param $3 (ref null $8)) (result (ref null $9))
  (local $4 (ref null $7))
  (local $5 (ref null $8))
  (local $6 (ref null $9))
  (block
   (local.set $4
    (array.get $8
     (local.get $3)
     (i32.add
      (i32.wrap_i64
       (i64.const 1)
      )
      (i32.const -1)
     )
    )
   )
   (local.set $5
    (array.new_fixed $8 1
     (local.get $4)
    )
   )
   (local.set $6
    (struct.new $9
     (local.get $2)
     (local.get $0)
     (local.get $5)
    )
   )
   (return
    (local.get $6)
   )
  )
 )
 (func $julia__printchildrenWebAssemblyCompiler_JS_IOBuffWebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String__ (type $27) (param $0 (ref null $4)) (param $1 (ref null $7))
  (local $2 stringref)
  (local $3 (ref null $1))
  (local $4 (ref null $0))
  (local $5 i64)
  (local $6 (ref null $1))
  (local $7 (ref null $0))
  (local $8 i64)
  (local $9 (ref null $1))
  (local $10 (ref null $0))
  (local $11 i64)
  (local $12 (ref null $5))
  (local $13 stringref)
  (local $14 (ref null $1))
  (local $15 (ref null $0))
  (local $16 i64)
  (local $17 stringref)
  (local $18 (ref null $1))
  (local $19 (ref null $0))
  (local $20 i64)
  (local $21 (ref null $1))
  (local $22 (ref null $0))
  (local $23 i64)
  (local $24 (ref null $1))
  (local $25 (ref null $0))
  (local $26 i64)
  (block
   (local.set $2
    (struct.get $7 0
     (local.get $1)
    )
   )
   (local.set $3
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $3)
     )
     (i32.add
      (struct.get $1 1
       (local.get $3)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff
     (local.set $4
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $4)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $3)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $3)
      )
     )
     (struct.set $1 0
      (local.get $3)
      (local.get $4)
     )
    )
   )
   (struct.set $1 1
    (local.get $3)
    (i32.add
     (struct.get $1 1
      (local.get $3)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $5
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $3)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $3)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $5)
     )
     (i32.const -1)
    )
    (struct.new $2
     (global.get $g8175604835841164500)
    )
   )
   (local.set $6
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $6)
     )
     (i32.add
      (struct.get $1 1
       (local.get $6)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff0
     (local.set $7
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $6)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $7)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $6)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $6)
      )
     )
     (struct.set $1 0
      (local.get $6)
      (local.get $7)
     )
    )
   )
   (struct.set $1 1
    (local.get $6)
    (i32.add
     (struct.get $1 1
      (local.get $6)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $8
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $6)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $6)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $8)
     )
     (i32.const -1)
    )
    (struct.new $2
     (local.get $2)
    )
   )
   (local.set $9
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $9)
     )
     (i32.add
      (struct.get $1 1
       (local.get $9)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff1
     (local.set $10
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $9)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $10)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $9)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $9)
      )
     )
     (struct.set $1 0
      (local.get $9)
      (local.get $10)
     )
    )
   )
   (struct.set $1 1
    (local.get $9)
    (i32.add
     (struct.get $1 1
      (local.get $9)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $11
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $9)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $9)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $11)
     )
     (i32.const -1)
    )
    (struct.new $2
     (global.get $g6706693452496592420)
    )
   )
   (local.set $12
    (struct.get $7 2
     (local.get $1)
    )
   )
   (local.set $13
    (array.get $5
     (local.get $12)
     (i32.add
      (i32.wrap_i64
       (i64.const 1)
      )
      (i32.const -1)
     )
    )
   )
   (local.set $14
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $14)
     )
     (i32.add
      (struct.get $1 1
       (local.get $14)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff2
     (local.set $15
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $14)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $15)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $14)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $14)
      )
     )
     (struct.set $1 0
      (local.get $14)
      (local.get $15)
     )
    )
   )
   (struct.set $1 1
    (local.get $14)
    (i32.add
     (struct.get $1 1
      (local.get $14)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $16
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $14)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $14)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $16)
     )
     (i32.const -1)
    )
    (struct.new $2
     (local.get $13)
    )
   )
   (local.set $17
    (struct.get $7 0
     (local.get $1)
    )
   )
   (local.set $18
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $18)
     )
     (i32.add
      (struct.get $1 1
       (local.get $18)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff3
     (local.set $19
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $18)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $19)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $18)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $18)
      )
     )
     (struct.set $1 0
      (local.get $18)
      (local.get $19)
     )
    )
   )
   (struct.set $1 1
    (local.get $18)
    (i32.add
     (struct.get $1 1
      (local.get $18)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $20
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $18)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $18)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $20)
     )
     (i32.const -1)
    )
    (struct.new $2
     (global.get $g6774991521086689941)
    )
   )
   (local.set $21
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $21)
     )
     (i32.add
      (struct.get $1 1
       (local.get $21)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff4
     (local.set $22
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $21)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $22)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $21)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $21)
      )
     )
     (struct.set $1 0
      (local.get $21)
      (local.get $22)
     )
    )
   )
   (struct.set $1 1
    (local.get $21)
    (i32.add
     (struct.get $1 1
      (local.get $21)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $23
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $21)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $21)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $23)
     )
     (i32.const -1)
    )
    (struct.new $2
     (local.get $17)
    )
   )
   (local.set $24
    (struct.get $4 0
     (local.get $0)
    )
   )
   (if
    (i32.le_u
     (struct.get $1 1
      (local.get $24)
     )
     (i32.add
      (struct.get $1 1
       (local.get $24)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (block $newbuff5
     (local.set $25
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.mul
        (i32.add
         (struct.get $1 1
          (local.get $24)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
        (i32.wrap_i64
         (i64.const 2)
        )
       )
      )
     )
     (array.copy $0 $0
      (local.get $25)
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 0
       (local.get $24)
      )
      (i32.wrap_i64
       (i64.const 0)
      )
      (struct.get $1 1
       (local.get $24)
      )
     )
     (struct.set $1 0
      (local.get $24)
      (local.get $25)
     )
    )
   )
   (struct.set $1 1
    (local.get $24)
    (i32.add
     (struct.get $1 1
      (local.get $24)
     )
     (i32.wrap_i64
      (i64.const 1)
     )
    )
   )
   (local.set $26
    (i64.extend_i32_u
     (struct.get $1 1
      (local.get $24)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $24)
    )
    (i32.add
     (i32.wrap_i64
      (local.get $26)
     )
     (i32.const -1)
    )
    (struct.new $2
     (global.get $g6706693452496592420)
    )
   )
   (drop
    (global.get $g18446744069659016546)
   )
   (return)
  )
 )
 (func $julia__printchildrenWebAssemblyCompiler_JS_IOBuffWebAssemblyCompiler_JS_Node_NamedTuple___class____Tuple_String____Tuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String____ (type $28) (param $0 (ref null $4)) (param $1 (ref null $9))
  (local $2 i32)
  (local $3 i32)
  (local $4 stringref)
  (local $5 (ref null $1))
  (local $6 (ref null $0))
  (local $7 i64)
  (local $8 (ref null $1))
  (local $9 (ref null $0))
  (local $10 i64)
  (local $11 (ref null $2))
  (local $12 stringref)
  (local $13 i32)
  (local $14 i64)
  (local $15 i32)
  (local $16 i64)
  (local $17 i32)
  (local $18 (ref null $1))
  (local $19 (ref null $0))
  (local $20 i64)
  (local $21 (ref null $1))
  (local $22 (ref null $0))
  (local $23 i64)
  (local $24 i32)
  (local $25 i64)
  (local $26 i32)
  (local $27 i64)
  (local $28 i32)
  (local $29 i32)
  (local $30 (ref null $1))
  (local $31 (ref null $0))
  (local $32 i64)
  (local $33 (ref null $1))
  (local $34 (ref null $0))
  (local $35 i64)
  (local $36 (ref null $1))
  (local $37 (ref null $0))
  (local $38 i64)
  (local $39 (ref null $1))
  (local $40 (ref null $0))
  (local $41 i64)
  (local $42 (ref null $1))
  (local $43 (ref null $0))
  (local $44 i64)
  (local $45 (ref null $1))
  (local $46 (ref null $0))
  (local $47 i64)
  (local $48 (ref null $8))
  (local $49 (ref null $7))
  (local $50 stringref)
  (local $51 (ref null $1))
  (local $52 (ref null $0))
  (local $53 i64)
  (local $54 (ref null $1))
  (local $55 (ref null $0))
  (local $56 i64)
  (local $57 (ref null $1))
  (local $58 (ref null $0))
  (local $59 i64)
  (block $block$20$break
   (block
    (local.set $4
     (struct.get $9 0
      (local.get $1)
     )
    )
    (local.set $5
     (struct.get $4 0
      (local.get $0)
     )
    )
    (if
     (i32.le_u
      (struct.get $1 1
       (local.get $5)
      )
      (i32.add
       (struct.get $1 1
        (local.get $5)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (block $newbuff
      (local.set $6
       (array.new $0
        (struct.new $3
         (i64.const 0)
        )
        (i32.mul
         (i32.add
          (struct.get $1 1
           (local.get $5)
          )
          (i32.wrap_i64
           (i64.const 1)
          )
         )
         (i32.wrap_i64
          (i64.const 2)
         )
        )
       )
      )
      (array.copy $0 $0
       (local.get $6)
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 0
        (local.get $5)
       )
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 1
        (local.get $5)
       )
      )
      (struct.set $1 0
       (local.get $5)
       (local.get $6)
      )
     )
    )
    (struct.set $1 1
     (local.get $5)
     (i32.add
      (struct.get $1 1
       (local.get $5)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (local.set $7
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $5)
      )
     )
    )
    (array.set $0
     (struct.get $1 0
      (local.get $5)
     )
     (i32.add
      (i32.wrap_i64
       (local.get $7)
      )
      (i32.const -1)
     )
     (struct.new $2
      (global.get $g8175604835841164500)
     )
    )
    (local.set $8
     (struct.get $4 0
      (local.get $0)
     )
    )
    (if
     (i32.le_u
      (struct.get $1 1
       (local.get $8)
      )
      (i32.add
       (struct.get $1 1
        (local.get $8)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (block $newbuff0
      (local.set $9
       (array.new $0
        (struct.new $3
         (i64.const 0)
        )
        (i32.mul
         (i32.add
          (struct.get $1 1
           (local.get $8)
          )
          (i32.wrap_i64
           (i64.const 1)
          )
         )
         (i32.wrap_i64
          (i64.const 2)
         )
        )
       )
      )
      (array.copy $0 $0
       (local.get $9)
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 0
        (local.get $8)
       )
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 1
        (local.get $8)
       )
      )
      (struct.set $1 0
       (local.get $8)
       (local.get $9)
      )
     )
    )
    (struct.set $1 1
     (local.get $8)
     (i32.add
      (struct.get $1 1
       (local.get $8)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (local.set $10
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $8)
      )
     )
    )
    (array.set $0
     (struct.get $1 0
      (local.get $8)
     )
     (i32.add
      (i32.wrap_i64
       (local.get $10)
      )
      (i32.const -1)
     )
     (struct.new $2
      (local.get $4)
     )
    )
    (local.set $11
     (struct.get $9 1
      (local.get $1)
     )
    )
    (local.set $12
     (struct.get $2 0
      (local.get $11)
     )
    )
   )
   (if
    (i32.const 1)
    (block
     (block $block$8$break
      (block
       (local.set $13
        (call $string-eq
         (local.get $12)
         (global.get $g17198871470474041807)
        )
       )
       (local.set $14
        (i64.extend_i32_s
         (local.get $13)
        )
       )
       (local.set $15
        (i64.eq
         (local.get $14)
         (i64.const 0)
        )
       )
      )
      (if
       (local.get $15)
       (block
        (local.set $2
         (i32.const 0)
        )
        (block
         (br $block$8$break)
        )
       )
       (block
        (block
         (local.set $16
          (i64.extend_i32_s
           (local.get $13)
          )
         )
         (local.set $17
          (i64.eq
           (local.get $16)
           (i64.const 1)
          )
         )
        )
        (if
         (local.get $17)
         (block
          (local.set $2
           (i32.const 1)
          )
          (block
           (br $block$8$break)
          )
         )
         (block
          (unreachable)
         )
        )
       )
      )
     )
     (block
      (block $block$10$break
       (block
       )
       (if
        (local.get $2)
        (block
         (block
          (local.set $18
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $18)
            )
            (i32.add
             (struct.get $1 1
              (local.get $18)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff1
            (local.set $19
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $18)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $19)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $18)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $18)
             )
            )
            (struct.set $1 0
             (local.get $18)
             (local.get $19)
            )
           )
          )
          (struct.set $1 1
           (local.get $18)
           (i32.add
            (struct.get $1 1
             (local.get $18)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $20
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $18)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $18)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $20)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g14823181248367563234)
           )
          )
          (local.set $21
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $21)
            )
            (i32.add
             (struct.get $1 1
              (local.get $21)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff2
            (local.set $22
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $21)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $22)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $21)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $21)
             )
            )
            (struct.set $1 0
             (local.get $21)
             (local.get $22)
            )
           )
          )
          (struct.set $1 1
           (local.get $21)
           (i32.add
            (struct.get $1 1
             (local.get $21)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $23
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $21)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $21)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $23)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g5132061904752741767)
           )
          )
         )
         (block
          (br $block$20$break)
         )
        )
        (br $block$10$break)
       )
      )
      (block
       (block $block$16$break
        (block
         (local.set $24
          (call $string-eq
           (local.get $12)
           (global.get $g1212563229133860075)
          )
         )
         (local.set $25
          (i64.extend_i32_s
           (local.get $24)
          )
         )
         (local.set $26
          (i64.eq
           (local.get $25)
           (i64.const 0)
          )
         )
        )
        (if
         (local.get $26)
         (block
          (local.set $3
           (i32.const 0)
          )
          (block
           (br $block$16$break)
          )
         )
         (block
          (block
           (local.set $27
            (i64.extend_i32_s
             (local.get $24)
            )
           )
           (local.set $28
            (i64.eq
             (local.get $27)
             (i64.const 1)
            )
           )
          )
          (if
           (local.get $28)
           (block
            (local.set $3
             (i32.const 1)
            )
            (block
             (br $block$16$break)
            )
           )
           (block
            (unreachable)
           )
          )
         )
        )
       )
       (block
        (block $block$18$break
         (block
          (local.set $29
           (i32.and
            (i32.xor
             (local.get $3)
             (i32.const -1)
            )
            (i32.const 1)
           )
          )
          (block
          )
         )
         (if
          (local.get $29)
          (br $block$18$break)
          (br $block$20$break)
         )
        )
        (block
         (block
          (local.set $30
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $30)
            )
            (i32.add
             (struct.get $1 1
              (local.get $30)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff3
            (local.set $31
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $30)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $31)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $30)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $30)
             )
            )
            (struct.set $1 0
             (local.get $30)
             (local.get $31)
            )
           )
          )
          (struct.set $1 1
           (local.get $30)
           (i32.add
            (struct.get $1 1
             (local.get $30)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $32
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $30)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $30)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $32)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g14823181248367563234)
           )
          )
          (local.set $33
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $33)
            )
            (i32.add
             (struct.get $1 1
              (local.get $33)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff4
            (local.set $34
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $33)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $34)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $33)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $33)
             )
            )
            (struct.set $1 0
             (local.get $33)
             (local.get $34)
            )
           )
          )
          (struct.set $1 1
           (local.get $33)
           (i32.add
            (struct.get $1 1
             (local.get $33)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $35
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $33)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $33)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $35)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g5132061904752741767)
           )
          )
          (local.set $36
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $36)
            )
            (i32.add
             (struct.get $1 1
              (local.get $36)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff5
            (local.set $37
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $36)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $37)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $36)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $36)
             )
            )
            (struct.set $1 0
             (local.get $36)
             (local.get $37)
            )
           )
          )
          (struct.set $1 1
           (local.get $36)
           (i32.add
            (struct.get $1 1
             (local.get $36)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $38
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $36)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $36)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $38)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g5057529045379675022)
           )
          )
          (local.set $39
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $39)
            )
            (i32.add
             (struct.get $1 1
              (local.get $39)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff6
            (local.set $40
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $39)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $40)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $39)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $39)
             )
            )
            (struct.set $1 0
             (local.get $39)
             (local.get $40)
            )
           )
          )
          (struct.set $1 1
           (local.get $39)
           (i32.add
            (struct.get $1 1
             (local.get $39)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $41
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $39)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $39)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $41)
            )
            (i32.const -1)
           )
           (struct.new $2
            (local.get $12)
           )
          )
          (local.set $42
           (struct.get $4 0
            (local.get $0)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $42)
            )
            (i32.add
             (struct.get $1 1
              (local.get $42)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff7
            (local.set $43
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $42)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $43)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $42)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $42)
             )
            )
            (struct.set $1 0
             (local.get $42)
             (local.get $43)
            )
           )
          )
          (struct.set $1 1
           (local.get $42)
           (i32.add
            (struct.get $1 1
             (local.get $42)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $44
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $42)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $42)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $44)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g9200817720073813500)
           )
          )
         )
         (block
          (br $block$20$break)
         )
        )
       )
      )
     )
    )
    (br $block$20$break)
   )
  )
  (block
   (block $block$22$break
    (block
     (local.set $45
      (struct.get $4 0
       (local.get $0)
      )
     )
     (if
      (i32.le_u
       (struct.get $1 1
        (local.get $45)
       )
       (i32.add
        (struct.get $1 1
         (local.get $45)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (block $newbuff8
       (local.set $46
        (array.new $0
         (struct.new $3
          (i64.const 0)
         )
         (i32.mul
          (i32.add
           (struct.get $1 1
            (local.get $45)
           )
           (i32.wrap_i64
            (i64.const 1)
           )
          )
          (i32.wrap_i64
           (i64.const 2)
          )
         )
        )
       )
       (array.copy $0 $0
        (local.get $46)
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $1 0
         (local.get $45)
        )
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $1 1
         (local.get $45)
        )
       )
       (struct.set $1 0
        (local.get $45)
        (local.get $46)
       )
      )
     )
     (struct.set $1 1
      (local.get $45)
      (i32.add
       (struct.get $1 1
        (local.get $45)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (local.set $47
      (i64.extend_i32_u
       (struct.get $1 1
        (local.get $45)
       )
      )
     )
     (array.set $0
      (struct.get $1 0
       (local.get $45)
      )
      (i32.add
       (i32.wrap_i64
        (local.get $47)
       )
       (i32.const -1)
      )
      (struct.new $2
       (global.get $g6706693452496592420)
      )
     )
    )
    (block
     (br $block$22$break)
    )
   )
   (block
    (block $block$24$break
     (block
      (local.set $48
       (struct.get $9 2
        (local.get $1)
       )
      )
      (local.set $49
       (array.get $8
        (local.get $48)
        (i32.add
         (i32.wrap_i64
          (i64.const 1)
         )
         (i32.const -1)
        )
       )
      )
      (call $julia__printchildrenWebAssemblyCompiler_JS_IOBuffWebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String__
       (local.get $0)
       (local.get $49)
      )
      (local.set $50
       (struct.get $9 0
        (local.get $1)
       )
      )
      (local.set $51
       (struct.get $4 0
        (local.get $0)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $51)
        )
        (i32.add
         (struct.get $1 1
          (local.get $51)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff9
        (local.set $52
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $51)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $52)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $51)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $51)
         )
        )
        (struct.set $1 0
         (local.get $51)
         (local.get $52)
        )
       )
      )
      (struct.set $1 1
       (local.get $51)
       (i32.add
        (struct.get $1 1
         (local.get $51)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $53
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $51)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $51)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $53)
        )
        (i32.const -1)
       )
       (struct.new $2
        (global.get $g6774991521086689941)
       )
      )
      (local.set $54
       (struct.get $4 0
        (local.get $0)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $54)
        )
        (i32.add
         (struct.get $1 1
          (local.get $54)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff10
        (local.set $55
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $54)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $55)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $54)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $54)
         )
        )
        (struct.set $1 0
         (local.get $54)
         (local.get $55)
        )
       )
      )
      (struct.set $1 1
       (local.get $54)
       (i32.add
        (struct.get $1 1
         (local.get $54)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $56
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $54)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $54)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $56)
        )
        (i32.const -1)
       )
       (struct.new $2
        (local.get $50)
       )
      )
      (local.set $57
       (struct.get $4 0
        (local.get $0)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $57)
        )
        (i32.add
         (struct.get $1 1
          (local.get $57)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff11
        (local.set $58
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $57)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $58)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $57)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $57)
         )
        )
        (struct.set $1 0
         (local.get $57)
         (local.get $58)
        )
       )
      )
      (struct.set $1 1
       (local.get $57)
       (i32.add
        (struct.get $1 1
         (local.get $57)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $59
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $57)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $57)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $59)
        )
        (i32.const -1)
       )
       (struct.new $2
        (global.get $g6706693452496592420)
       )
      )
     )
     (block
      (br $block$24$break)
     )
    )
    (block
     (return)
    )
   )
  )
 )
 (func $julia_objectVector_Any_ (type $33) (param $0 (ref null $1)) (result externref)
  (local $1 i32)
  (local $2 eqref)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 eqref)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 eqref)
  (local $12 i64)
  (local $13 i64)
  (local $14 i32)
  (local $15 eqref)
  (local $16 i64)
  (local $17 i32)
  (local $18 i64)
  (local $19 i64)
  (local $20 eqref)
  (local $21 i64)
  (local $22 i32)
  (local $23 i64)
  (local $24 i32)
  (local $25 i64)
  (local $26 i32)
  (local $27 externref)
  (local $28 i64)
  (local $29 i64)
  (local $30 i64)
  (local $31 i32)
  (local $32 i64)
  (local $33 i32)
  (local $34 i32)
  (local $35 eqref)
  (local $36 i64)
  (local $37 i32)
  (local $38 i32)
  (local $39 (ref null $17))
  (local $40 f64)
  (local $41 i64)
  (local $42 i32)
  (local $43 i64)
  (local $44 i32)
  (local $45 i32)
  (local $46 (ref null $12))
  (local $47 i32)
  (local $48 i64)
  (local $49 i32)
  (local $50 i64)
  (local $51 i32)
  (local $52 i32)
  (local $53 (ref null $2))
  (local $54 stringref)
  (local $55 i64)
  (local $56 i32)
  (local $57 i64)
  (local $58 i32)
  (local $59 i32)
  (local $60 (ref null $18))
  (local $61 i64)
  (local $62 i32)
  (local $63 i64)
  (local $64 i32)
  (local $65 i64)
  (local $66 i32)
  (local $67 i64)
  (local $68 i32)
  (local $69 i32)
  (local $70 (ref null $12))
  (local $71 i32)
  (local $72 i64)
  (local $73 i32)
  (local $74 i64)
  (local $75 i32)
  (local $76 i32)
  (local $77 (ref null $1))
  (local $78 externref)
  (local $79 i64)
  (local $80 i32)
  (local $81 i64)
  (local $82 i32)
  (local $83 i64)
  (local $84 i64)
  (local $85 i64)
  (local $86 i32)
  (local $87 i64)
  (local $88 i32)
  (local $89 i32)
  (local $90 eqref)
  (local $91 i64)
  (local $92 i64)
  (local $93 i32)
  (block $block$7$break
   (block
    (local.set $23
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $0)
      )
     )
    )
    (local.set $24
     (i32.wrap_i64
      (local.get $23)
     )
    )
    (local.set $25
     (i64.extend_i32_s
      (local.get $24)
     )
    )
    (local.set $26
     (i64.eq
      (local.get $23)
      (local.get $25)
     )
    )
   )
   (if
    (local.get $26)
    (br $block$7$break)
    (block
     (call $x____console_log_x_NothingString
      (global.get $g9185389319346651987)
     )
     (block
      (br $block$7$break)
     )
    )
   )
  )
  (block
   (block $block$11$break
    (block
     (local.set $27
      (call $n____Array_n_ExternrefInt32
       (local.get $24)
      )
     )
     (local.set $28
      (i64.const 1)
     )
     (local.set $29
      (i64.sub
       (local.get $28)
       (i64.const 1)
      )
     )
     (local.set $30
      (i64.extend_i32_u
       (struct.get $1 1
        (local.get $0)
       )
      )
     )
     (local.set $31
      (i64.le_s
       (i64.const 0)
       (local.get $30)
      )
     )
     (local.set $32
      (local.get $30)
     )
     (local.set $33
      (i64.lt_u
       (local.get $29)
       (local.get $32)
      )
     )
     (local.set $34
      (i32.and
       (local.get $31)
       (local.get $33)
      )
     )
    )
    (if
     (local.get $34)
     (block
      (block
       (local.set $35
        (array.get $0
         (struct.get $1 0
          (local.get $0)
         )
         (i32.add
          (i32.wrap_i64
           (i64.const 1)
          )
          (i32.const -1)
         )
        )
       )
       (local.set $36
        (i64.add
         (i64.const 1)
         (i64.const 1)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $2
        (local.get $35)
       )
       (local.set $3
        (local.get $36)
       )
      )
      (block
       (br $block$11$break)
      )
     )
     (block
      (block
       (local.set $1
        (i32.const 1)
       )
       (local.set $4
        (i32.const 1)
       )
      )
      (block
       (br $block$11$break)
      )
     )
    )
   )
   (block
    (block $block$15$break
     (block
     )
     (if
      (local.get $1)
      (block
       (local.set $5
        (local.get $4)
       )
       (block
        (br $block$15$break)
       )
      )
      (block
       (block
        (local.set $5
         (i32.const 0)
        )
        (local.set $6
         (i64.const 1)
        )
        (local.set $7
         (local.get $2)
        )
        (local.set $8
         (i64.const 2)
        )
        (local.set $9
         (local.get $3)
        )
       )
       (block
        (br $block$15$break)
       )
      )
     )
    )
    (block
     (block $block$84$break
      (block
       (local.set $37
        (i32.and
         (i32.xor
          (local.get $5)
          (i32.const -1)
         )
         (i32.const 1)
        )
       )
       (local.set $10
        (local.get $6)
       )
       (local.set $11
        (local.get $7)
       )
       (local.set $12
        (local.get $8)
       )
       (local.set $13
        (local.get $9)
       )
      )
      (if
       (local.get $37)
       (loop $shape$13$continue
        (block $block$76$break
         (local.set $38
          (ref.test (ref null $17)
           (local.get $11)
          )
         )
         (if
          (local.get $38)
          (block
           (block $block$23$break
            (block
             (local.set $39
              (ref.cast (ref null $17)
               (local.get $11)
              )
             )
             (local.set $40
              (struct.get $17 0
               (local.get $39)
              )
             )
             (local.set $41
              (i64.sub
               (local.get $10)
               (i64.const 1)
              )
             )
             (local.set $42
              (i32.wrap_i64
               (local.get $41)
              )
             )
             (local.set $43
              (i64.extend_i32_s
               (local.get $42)
              )
             )
             (local.set $44
              (i64.eq
               (local.get $41)
               (local.get $43)
              )
             )
            )
            (if
             (local.get $44)
             (br $block$23$break)
             (block
              (call $x____console_log_x_NothingString
               (global.get $g9185389319346651987)
              )
              (block
               (br $block$23$break)
              )
             )
            )
           )
           (block
            (call $_v__i__x_____v_i____xNothingExternrefInt32Float64
             (local.get $27)
             (local.get $42)
             (local.get $40)
            )
            (block
             (br $block$76$break)
            )
           )
          )
          (block
           (block $block$34$break
            (local.set $45
             (ref.test (ref null $12)
              (local.get $11)
             )
            )
            (if
             (local.get $45)
             (block
              (block $block$32$break
               (block
                (local.set $46
                 (ref.cast (ref null $12)
                  (local.get $11)
                 )
                )
                (local.set $47
                 (struct.get $12 0
                  (local.get $46)
                 )
                )
                (local.set $48
                 (i64.sub
                  (local.get $10)
                  (i64.const 1)
                 )
                )
                (local.set $49
                 (i32.wrap_i64
                  (local.get $48)
                 )
                )
                (local.set $50
                 (i64.extend_i32_s
                  (local.get $49)
                 )
                )
                (local.set $51
                 (i64.eq
                  (local.get $48)
                  (local.get $50)
                 )
                )
               )
               (if
                (local.get $51)
                (br $block$32$break)
                (block
                 (call $x____console_log_x_NothingString
                  (global.get $g9185389319346651987)
                 )
                 (block
                  (br $block$32$break)
                 )
                )
               )
              )
              (block
               (call $_v__i__x_____v_i____xNothingExternrefInt32Int32
                (local.get $27)
                (local.get $49)
                (local.get $47)
               )
               (block
                (br $block$76$break)
               )
              )
             )
             (br $block$34$break)
            )
           )
           (block
            (block $block$43$break
             (local.set $52
              (ref.test (ref null $2)
               (local.get $11)
              )
             )
             (if
              (local.get $52)
              (block
               (block $block$41$break
                (block
                 (local.set $53
                  (ref.cast (ref null $2)
                   (local.get $11)
                  )
                 )
                 (local.set $54
                  (struct.get $2 0
                   (local.get $53)
                  )
                 )
                 (local.set $55
                  (i64.sub
                   (local.get $10)
                   (i64.const 1)
                  )
                 )
                 (local.set $56
                  (i32.wrap_i64
                   (local.get $55)
                  )
                 )
                 (local.set $57
                  (i64.extend_i32_s
                   (local.get $56)
                  )
                 )
                 (local.set $58
                  (i64.eq
                   (local.get $55)
                   (local.get $57)
                  )
                 )
                )
                (if
                 (local.get $58)
                 (br $block$41$break)
                 (block
                  (call $x____console_log_x_NothingString
                   (global.get $g9185389319346651987)
                  )
                  (block
                   (br $block$41$break)
                  )
                 )
                )
               )
               (block
                (call $_v__i__x_____v_i____xNothingExternrefInt32String
                 (local.get $27)
                 (local.get $56)
                 (local.get $54)
                )
                (block
                 (br $block$76$break)
                )
               )
              )
              (br $block$43$break)
             )
            )
            (block
             (block $block$58$break
              (local.set $59
               (ref.test (ref null $18)
                (local.get $11)
               )
              )
              (if
               (local.get $59)
               (block
                (block $block$50$break
                 (block
                  (local.set $60
                   (ref.cast (ref null $18)
                    (local.get $11)
                   )
                  )
                  (local.set $61
                   (struct.get $18 0
                    (local.get $60)
                   )
                  )
                  (local.set $62
                   (i32.wrap_i64
                    (local.get $61)
                   )
                  )
                  (local.set $63
                   (i64.extend_i32_s
                    (local.get $62)
                   )
                  )
                  (local.set $64
                   (i64.eq
                    (local.get $61)
                    (local.get $63)
                   )
                  )
                 )
                 (if
                  (local.get $64)
                  (br $block$50$break)
                  (block
                   (call $x____console_log_x_NothingString
                    (global.get $g9185389319346651987)
                   )
                   (block
                    (br $block$50$break)
                   )
                  )
                 )
                )
                (block
                 (block $block$56$break
                  (block
                   (local.set $65
                    (i64.sub
                     (local.get $10)
                     (i64.const 1)
                    )
                   )
                   (local.set $66
                    (i32.wrap_i64
                     (local.get $65)
                    )
                   )
                   (local.set $67
                    (i64.extend_i32_s
                     (local.get $66)
                    )
                   )
                   (local.set $68
                    (i64.eq
                     (local.get $65)
                     (local.get $67)
                    )
                   )
                  )
                  (if
                   (local.get $68)
                   (br $block$56$break)
                   (block
                    (call $x____console_log_x_NothingString
                     (global.get $g9185389319346651987)
                    )
                    (block
                     (br $block$56$break)
                    )
                   )
                  )
                 )
                 (block
                  (call $_v__i__x_____v_i____xNothingExternrefInt32Int32
                   (local.get $27)
                   (local.get $66)
                   (local.get $62)
                  )
                  (block
                   (br $block$76$break)
                  )
                 )
                )
               )
               (br $block$58$break)
              )
             )
             (block
              (block $block$67$break
               (local.set $69
                (ref.test (ref null $12)
                 (local.get $11)
                )
               )
               (if
                (local.get $69)
                (block
                 (block $block$65$break
                  (block
                   (local.set $70
                    (ref.cast (ref null $12)
                     (local.get $11)
                    )
                   )
                   (local.set $71
                    (struct.get $12 0
                     (local.get $70)
                    )
                   )
                   (local.set $72
                    (i64.sub
                     (local.get $10)
                     (i64.const 1)
                    )
                   )
                   (local.set $73
                    (i32.wrap_i64
                     (local.get $72)
                    )
                   )
                   (local.set $74
                    (i64.extend_i32_s
                     (local.get $73)
                    )
                   )
                   (local.set $75
                    (i64.eq
                     (local.get $72)
                     (local.get $74)
                    )
                   )
                  )
                  (if
                   (local.get $75)
                   (br $block$65$break)
                   (block
                    (call $x____console_log_x_NothingString
                     (global.get $g9185389319346651987)
                    )
                    (block
                     (br $block$65$break)
                    )
                   )
                  )
                 )
                 (block
                  (call $_v__i__x_____v_i____xNothingExternrefInt32Bool
                   (local.get $27)
                   (local.get $73)
                   (local.get $71)
                  )
                  (block
                   (br $block$76$break)
                  )
                 )
                )
                (br $block$67$break)
               )
              )
              (block
               (block $block$68$break
                (local.set $76
                 (ref.test (ref null $1)
                  (local.get $11)
                 )
                )
                (if
                 (local.get $76)
                 (br $block$68$break)
                 (br $block$76$break)
                )
               )
               (block
                (block $block$74$break
                 (block
                  (local.set $77
                   (ref.cast (ref null $1)
                    (local.get $11)
                   )
                  )
                  (local.set $78
                   (call $julia_objectVector_Any_
                    (local.get $77)
                   )
                  )
                  (local.set $79
                   (i64.sub
                    (local.get $10)
                    (i64.const 1)
                   )
                  )
                  (local.set $80
                   (i32.wrap_i64
                    (local.get $79)
                   )
                  )
                  (local.set $81
                   (i64.extend_i32_s
                    (local.get $80)
                   )
                  )
                  (local.set $82
                   (i64.eq
                    (local.get $79)
                    (local.get $81)
                   )
                  )
                 )
                 (if
                  (local.get $82)
                  (br $block$74$break)
                  (block
                   (call $x____console_log_x_NothingString
                    (global.get $g9185389319346651987)
                   )
                   (block
                    (br $block$74$break)
                   )
                  )
                 )
                )
                (block
                 (call $_v__i__x_____v_i____xNothingExternrefInt32Externref
                  (local.get $27)
                  (local.get $80)
                  (local.get $78)
                 )
                 (block
                  (br $block$76$break)
                 )
                )
               )
              )
             )
            )
           )
          )
         )
        )
        (block
         (block $block$79$break
          (block
           (local.set $83
            (local.get $13)
           )
           (local.set $84
            (i64.sub
             (local.get $83)
             (i64.const 1)
            )
           )
           (local.set $85
            (i64.extend_i32_u
             (struct.get $1 1
              (local.get $0)
             )
            )
           )
           (local.set $86
            (i64.le_s
             (i64.const 0)
             (local.get $85)
            )
           )
           (local.set $87
            (local.get $85)
           )
           (local.set $88
            (i64.lt_u
             (local.get $84)
             (local.get $87)
            )
           )
           (local.set $89
            (i32.and
             (local.get $86)
             (local.get $88)
            )
           )
          )
          (if
           (local.get $89)
           (block
            (block
             (local.set $90
              (array.get $0
               (struct.get $1 0
                (local.get $0)
               )
               (i32.add
                (i32.wrap_i64
                 (local.get $13)
                )
                (i32.const -1)
               )
              )
             )
             (local.set $91
              (i64.add
               (local.get $13)
               (i64.const 1)
              )
             )
             (local.set $14
              (i32.const 0)
             )
             (local.set $15
              (local.get $90)
             )
             (local.set $16
              (local.get $91)
             )
            )
            (block
             (br $block$79$break)
            )
           )
           (block
            (block
             (local.set $14
              (i32.const 1)
             )
             (local.set $17
              (i32.const 1)
             )
            )
            (block
             (br $block$79$break)
            )
           )
          )
         )
         (block
          (block $block$82$break
           (block
           )
           (if
            (local.get $14)
            (block
             (local.set $22
              (local.get $17)
             )
             (block
              (br $block$82$break)
             )
            )
            (block
             (block
              (local.set $92
               (i64.add
                (local.get $12)
                (i64.const 1)
               )
              )
              (local.set $18
               (local.get $16)
              )
              (local.set $19
               (local.get $92)
              )
              (local.set $20
               (local.get $15)
              )
              (local.set $21
               (local.get $12)
              )
              (local.set $22
               (i32.const 0)
              )
             )
             (block
              (br $block$82$break)
             )
            )
           )
          )
          (block
           (block $block$83$break
            (local.set $93
             (i32.and
              (i32.xor
               (local.get $22)
               (i32.const -1)
              )
              (i32.const 1)
             )
            )
            (if
             (local.get $93)
             (br $block$83$break)
             (br $block$84$break)
            )
           )
           (block
            (block
             (local.set $10
              (local.get $21)
             )
             (local.set $11
              (local.get $20)
             )
             (local.set $12
              (local.get $19)
             )
             (local.set $13
              (local.get $18)
             )
            )
            (block
             (br $shape$13$continue)
            )
           )
          )
         )
        )
       )
       (br $block$84$break)
      )
     )
     (block
      (return
       (local.get $27)
      )
     )
    )
   )
  )
 )
 (func $julia__stringWebAssemblyCompiler_JS_Node_NamedTuple___class____Tuple_String____Tuple_String__String__Float64__WebAssemblyCompiler_JS_Node_NamedTuple___class____Tuple_String____Tuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String______ (type $35) (param $0 (ref null $14)) (result stringref)
  (local $1 i32)
  (local $2 i32)
  (local $3 (ref null $1))
  (local $4 (ref null $4))
  (local $5 stringref)
  (local $6 (ref null $0))
  (local $7 i64)
  (local $8 (ref null $0))
  (local $9 i64)
  (local $10 (ref null $2))
  (local $11 stringref)
  (local $12 i32)
  (local $13 i64)
  (local $14 i32)
  (local $15 i64)
  (local $16 i32)
  (local $17 (ref null $0))
  (local $18 i64)
  (local $19 (ref null $0))
  (local $20 i64)
  (local $21 i32)
  (local $22 i64)
  (local $23 i32)
  (local $24 i64)
  (local $25 i32)
  (local $26 i32)
  (local $27 (ref null $0))
  (local $28 i64)
  (local $29 (ref null $0))
  (local $30 i64)
  (local $31 (ref null $0))
  (local $32 i64)
  (local $33 (ref null $0))
  (local $34 i64)
  (local $35 (ref null $0))
  (local $36 i64)
  (local $37 (ref null $0))
  (local $38 i64)
  (local $39 (ref null $13))
  (local $40 stringref)
  (local $41 stringref)
  (local $42 f64)
  (local $43 (ref null $9))
  (local $44 (ref null $0))
  (local $45 i64)
  (local $46 (ref null $0))
  (local $47 i64)
  (local $48 (ref null $0))
  (local $49 i64)
  (local $50 stringref)
  (local $51 (ref null $0))
  (local $52 i64)
  (local $53 (ref null $0))
  (local $54 i64)
  (local $55 (ref null $0))
  (local $56 i64)
  (local $57 externref)
  (local $58 stringref)
  (block $block$20$break
   (block
    (local.set $3
     (struct.new $1
      (array.new $0
       (struct.new $3
        (i64.const 0)
       )
       (i32.wrap_i64
        (i64.const 0)
       )
      )
      (i32.wrap_i64
       (i64.const 0)
      )
     )
    )
    (local.set $4
     (struct.new $4
      (local.get $3)
     )
    )
    (local.set $5
     (struct.get $14 0
      (local.get $0)
     )
    )
    (if
     (i32.le_u
      (struct.get $1 1
       (local.get $3)
      )
      (i32.add
       (struct.get $1 1
        (local.get $3)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (block $newbuff
      (local.set $6
       (array.new $0
        (struct.new $3
         (i64.const 0)
        )
        (i32.mul
         (i32.add
          (struct.get $1 1
           (local.get $3)
          )
          (i32.wrap_i64
           (i64.const 1)
          )
         )
         (i32.wrap_i64
          (i64.const 2)
         )
        )
       )
      )
      (array.copy $0 $0
       (local.get $6)
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 0
        (local.get $3)
       )
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 1
        (local.get $3)
       )
      )
      (struct.set $1 0
       (local.get $3)
       (local.get $6)
      )
     )
    )
    (struct.set $1 1
     (local.get $3)
     (i32.add
      (struct.get $1 1
       (local.get $3)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (local.set $7
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $3)
      )
     )
    )
    (array.set $0
     (struct.get $1 0
      (local.get $3)
     )
     (i32.add
      (i32.wrap_i64
       (local.get $7)
      )
      (i32.const -1)
     )
     (struct.new $2
      (global.get $g8175604835841164500)
     )
    )
    (if
     (i32.le_u
      (struct.get $1 1
       (local.get $3)
      )
      (i32.add
       (struct.get $1 1
        (local.get $3)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (block $newbuff0
      (local.set $8
       (array.new $0
        (struct.new $3
         (i64.const 0)
        )
        (i32.mul
         (i32.add
          (struct.get $1 1
           (local.get $3)
          )
          (i32.wrap_i64
           (i64.const 1)
          )
         )
         (i32.wrap_i64
          (i64.const 2)
         )
        )
       )
      )
      (array.copy $0 $0
       (local.get $8)
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 0
        (local.get $3)
       )
       (i32.wrap_i64
        (i64.const 0)
       )
       (struct.get $1 1
        (local.get $3)
       )
      )
      (struct.set $1 0
       (local.get $3)
       (local.get $8)
      )
     )
    )
    (struct.set $1 1
     (local.get $3)
     (i32.add
      (struct.get $1 1
       (local.get $3)
      )
      (i32.wrap_i64
       (i64.const 1)
      )
     )
    )
    (local.set $9
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $3)
      )
     )
    )
    (array.set $0
     (struct.get $1 0
      (local.get $3)
     )
     (i32.add
      (i32.wrap_i64
       (local.get $9)
      )
      (i32.const -1)
     )
     (struct.new $2
      (local.get $5)
     )
    )
    (local.set $10
     (struct.get $14 1
      (local.get $0)
     )
    )
    (local.set $11
     (struct.get $2 0
      (local.get $10)
     )
    )
   )
   (if
    (i32.const 1)
    (block
     (block $block$8$break
      (block
       (local.set $12
        (call $string-eq
         (local.get $11)
         (global.get $g17198871470474041807)
        )
       )
       (local.set $13
        (i64.extend_i32_s
         (local.get $12)
        )
       )
       (local.set $14
        (i64.eq
         (local.get $13)
         (i64.const 0)
        )
       )
      )
      (if
       (local.get $14)
       (block
        (local.set $1
         (i32.const 0)
        )
        (block
         (br $block$8$break)
        )
       )
       (block
        (block
         (local.set $15
          (i64.extend_i32_s
           (local.get $12)
          )
         )
         (local.set $16
          (i64.eq
           (local.get $15)
           (i64.const 1)
          )
         )
        )
        (if
         (local.get $16)
         (block
          (local.set $1
           (i32.const 1)
          )
          (block
           (br $block$8$break)
          )
         )
         (block
          (unreachable)
         )
        )
       )
      )
     )
     (block
      (block $block$10$break
       (block
       )
       (if
        (local.get $1)
        (block
         (block
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff1
            (local.set $17
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $17)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $17)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $18
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $18)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g14823181248367563234)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff2
            (local.set $19
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $19)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $19)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $20
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $20)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g5132061904752741767)
           )
          )
         )
         (block
          (br $block$20$break)
         )
        )
        (br $block$10$break)
       )
      )
      (block
       (block $block$16$break
        (block
         (local.set $21
          (call $string-eq
           (local.get $11)
           (global.get $g1212563229133860075)
          )
         )
         (local.set $22
          (i64.extend_i32_s
           (local.get $21)
          )
         )
         (local.set $23
          (i64.eq
           (local.get $22)
           (i64.const 0)
          )
         )
        )
        (if
         (local.get $23)
         (block
          (local.set $2
           (i32.const 0)
          )
          (block
           (br $block$16$break)
          )
         )
         (block
          (block
           (local.set $24
            (i64.extend_i32_s
             (local.get $21)
            )
           )
           (local.set $25
            (i64.eq
             (local.get $24)
             (i64.const 1)
            )
           )
          )
          (if
           (local.get $25)
           (block
            (local.set $2
             (i32.const 1)
            )
            (block
             (br $block$16$break)
            )
           )
           (block
            (unreachable)
           )
          )
         )
        )
       )
       (block
        (block $block$18$break
         (block
          (local.set $26
           (i32.and
            (i32.xor
             (local.get $2)
             (i32.const -1)
            )
            (i32.const 1)
           )
          )
          (block
          )
         )
         (if
          (local.get $26)
          (br $block$18$break)
          (br $block$20$break)
         )
        )
        (block
         (block
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff3
            (local.set $27
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $27)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $27)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $28
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $28)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g14823181248367563234)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff4
            (local.set $29
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $29)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $29)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $30
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $30)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g5132061904752741767)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff5
            (local.set $31
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $31)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $31)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $32
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $32)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g5057529045379675022)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff6
            (local.set $33
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $33)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $33)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $34
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $34)
            )
            (i32.const -1)
           )
           (struct.new $2
            (local.get $11)
           )
          )
          (if
           (i32.le_u
            (struct.get $1 1
             (local.get $3)
            )
            (i32.add
             (struct.get $1 1
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 1)
             )
            )
           )
           (block $newbuff7
            (local.set $35
             (array.new $0
              (struct.new $3
               (i64.const 0)
              )
              (i32.mul
               (i32.add
                (struct.get $1 1
                 (local.get $3)
                )
                (i32.wrap_i64
                 (i64.const 1)
                )
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
             )
            )
            (array.copy $0 $0
             (local.get $35)
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 0
              (local.get $3)
             )
             (i32.wrap_i64
              (i64.const 0)
             )
             (struct.get $1 1
              (local.get $3)
             )
            )
            (struct.set $1 0
             (local.get $3)
             (local.get $35)
            )
           )
          )
          (struct.set $1 1
           (local.get $3)
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
          )
          (local.set $36
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $3)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $3)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $36)
            )
            (i32.const -1)
           )
           (struct.new $2
            (global.get $g9200817720073813500)
           )
          )
         )
         (block
          (br $block$20$break)
         )
        )
       )
      )
     )
    )
    (br $block$20$break)
   )
  )
  (block
   (block $block$22$break
    (block
     (if
      (i32.le_u
       (struct.get $1 1
        (local.get $3)
       )
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (block $newbuff8
       (local.set $37
        (array.new $0
         (struct.new $3
          (i64.const 0)
         )
         (i32.mul
          (i32.add
           (struct.get $1 1
            (local.get $3)
           )
           (i32.wrap_i64
            (i64.const 1)
           )
          )
          (i32.wrap_i64
           (i64.const 2)
          )
         )
        )
       )
       (array.copy $0 $0
        (local.get $37)
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $1 0
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $1 1
         (local.get $3)
        )
       )
       (struct.set $1 0
        (local.get $3)
        (local.get $37)
       )
      )
     )
     (struct.set $1 1
      (local.get $3)
      (i32.add
       (struct.get $1 1
        (local.get $3)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (local.set $38
      (i64.extend_i32_u
       (struct.get $1 1
        (local.get $3)
       )
      )
     )
     (array.set $0
      (struct.get $1 0
       (local.get $3)
      )
      (i32.add
       (i32.wrap_i64
        (local.get $38)
       )
       (i32.const -1)
      )
      (struct.new $2
       (global.get $g6706693452496592420)
      )
     )
    )
    (block
     (br $block$22$break)
    )
   )
   (block
    (block $block$24$break
     (block
      (local.set $39
       (struct.get $14 2
        (local.get $0)
       )
      )
      (local.set $40
       (struct.get $13 0
        (local.get $39)
       )
      )
      (local.set $41
       (struct.get $13 1
        (local.get $39)
       )
      )
      (local.set $42
       (struct.get $13 2
        (local.get $39)
       )
      )
      (local.set $43
       (struct.get $13 3
        (local.get $39)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $3)
        )
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff9
        (local.set $44
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $44)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $3)
         )
        )
        (struct.set $1 0
         (local.get $3)
         (local.get $44)
        )
       )
      )
      (struct.set $1 1
       (local.get $3)
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $45
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $3)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $3)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $45)
        )
        (i32.const -1)
       )
       (struct.new $2
        (local.get $40)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $3)
        )
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff10
        (local.set $46
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $46)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $3)
         )
        )
        (struct.set $1 0
         (local.get $3)
         (local.get $46)
        )
       )
      )
      (struct.set $1 1
       (local.get $3)
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $47
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $3)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $3)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $47)
        )
        (i32.const -1)
       )
       (struct.new $2
        (local.get $41)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $3)
        )
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff11
        (local.set $48
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $48)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $3)
         )
        )
        (struct.set $1 0
         (local.get $3)
         (local.get $48)
        )
       )
      )
      (struct.set $1 1
       (local.get $3)
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $49
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $3)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $3)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $49)
        )
        (i32.const -1)
       )
       (struct.new $17
        (local.get $42)
       )
      )
      (call $julia__printchildrenWebAssemblyCompiler_JS_IOBuffWebAssemblyCompiler_JS_Node_NamedTuple___class____Tuple_String____Tuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String____
       (local.get $4)
       (local.get $43)
      )
      (local.set $50
       (struct.get $14 0
        (local.get $0)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $3)
        )
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff12
        (local.set $51
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $51)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $3)
         )
        )
        (struct.set $1 0
         (local.get $3)
         (local.get $51)
        )
       )
      )
      (struct.set $1 1
       (local.get $3)
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $52
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $3)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $3)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $52)
        )
        (i32.const -1)
       )
       (struct.new $2
        (global.get $g6774991521086689941)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $3)
        )
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff13
        (local.set $53
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $53)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $3)
         )
        )
        (struct.set $1 0
         (local.get $3)
         (local.get $53)
        )
       )
      )
      (struct.set $1 1
       (local.get $3)
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $54
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $3)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $3)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $54)
        )
        (i32.const -1)
       )
       (struct.new $2
        (local.get $50)
       )
      )
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $3)
        )
        (i32.add
         (struct.get $1 1
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 1)
         )
        )
       )
       (block $newbuff14
        (local.set $55
         (array.new $0
          (struct.new $3
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $3)
            )
            (i32.wrap_i64
             (i64.const 1)
            )
           )
           (i32.wrap_i64
            (i64.const 2)
           )
          )
         )
        )
        (array.copy $0 $0
         (local.get $55)
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 0
          (local.get $3)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $3)
         )
        )
        (struct.set $1 0
         (local.get $3)
         (local.get $55)
        )
       )
      )
      (struct.set $1 1
       (local.get $3)
       (i32.add
        (struct.get $1 1
         (local.get $3)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (local.set $56
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $3)
        )
       )
      )
      (array.set $0
       (struct.get $1 0
        (local.get $3)
       )
       (i32.add
        (i32.wrap_i64
         (local.get $56)
        )
        (i32.const -1)
       )
       (struct.new $2
        (global.get $g6706693452496592420)
       )
      )
     )
     (block
      (br $block$24$break)
     )
    )
    (block
     (block
      (local.set $57
       (call $julia_objectVector_Any_
        (local.get $3)
       )
      )
      (local.set $58
       (call $_x_____x_join____StringExternref
        (local.get $57)
       )
      )
      (return
       (local.get $58)
      )
     )
    )
   )
  )
 )
 (func $julia_objectVector_Float64_ (type $39) (param $0 (ref null $11)) (result externref)
  (local $1 i32)
  (local $2 f64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 f64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 f64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i32)
  (local $15 f64)
  (local $16 i64)
  (local $17 i32)
  (local $18 i64)
  (local $19 i64)
  (local $20 f64)
  (local $21 i64)
  (local $22 i32)
  (local $23 i64)
  (local $24 i32)
  (local $25 i64)
  (local $26 i32)
  (local $27 externref)
  (local $28 i64)
  (local $29 i64)
  (local $30 i64)
  (local $31 i32)
  (local $32 i64)
  (local $33 i32)
  (local $34 i32)
  (local $35 f64)
  (local $36 i64)
  (local $37 i32)
  (local $38 i64)
  (local $39 i32)
  (local $40 i64)
  (local $41 i32)
  (local $42 i64)
  (local $43 i64)
  (local $44 i64)
  (local $45 i32)
  (local $46 i64)
  (local $47 i32)
  (local $48 i32)
  (local $49 f64)
  (local $50 i64)
  (local $51 i64)
  (local $52 i32)
  (block $block$7$break
   (block
    (local.set $23
     (i64.extend_i32_u
      (struct.get $11 1
       (local.get $0)
      )
     )
    )
    (local.set $24
     (i32.wrap_i64
      (local.get $23)
     )
    )
    (local.set $25
     (i64.extend_i32_s
      (local.get $24)
     )
    )
    (local.set $26
     (i64.eq
      (local.get $23)
      (local.get $25)
     )
    )
   )
   (if
    (local.get $26)
    (br $block$7$break)
    (block
     (call $x____console_log_x_NothingString
      (global.get $g9185389319346651987)
     )
     (block
      (br $block$7$break)
     )
    )
   )
  )
  (block
   (block $block$11$break
    (block
     (local.set $27
      (call $n____new_Float64Array_n_ExternrefInt32
       (local.get $24)
      )
     )
     (local.set $28
      (i64.const 1)
     )
     (local.set $29
      (i64.sub
       (local.get $28)
       (i64.const 1)
      )
     )
     (local.set $30
      (i64.extend_i32_u
       (struct.get $11 1
        (local.get $0)
       )
      )
     )
     (local.set $31
      (i64.le_s
       (i64.const 0)
       (local.get $30)
      )
     )
     (local.set $32
      (local.get $30)
     )
     (local.set $33
      (i64.lt_u
       (local.get $29)
       (local.get $32)
      )
     )
     (local.set $34
      (i32.and
       (local.get $31)
       (local.get $33)
      )
     )
    )
    (if
     (local.get $34)
     (block
      (block
       (local.set $35
        (array.get $10
         (struct.get $11 0
          (local.get $0)
         )
         (i32.add
          (i32.wrap_i64
           (i64.const 1)
          )
          (i32.const -1)
         )
        )
       )
       (local.set $36
        (i64.add
         (i64.const 1)
         (i64.const 1)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $2
        (local.get $35)
       )
       (local.set $3
        (local.get $36)
       )
      )
      (block
       (br $block$11$break)
      )
     )
     (block
      (block
       (local.set $1
        (i32.const 1)
       )
       (local.set $4
        (i32.const 1)
       )
      )
      (block
       (br $block$11$break)
      )
     )
    )
   )
   (block
    (block $block$15$break
     (block
     )
     (if
      (local.get $1)
      (block
       (local.set $5
        (local.get $4)
       )
       (block
        (br $block$15$break)
       )
      )
      (block
       (block
        (local.set $5
         (i32.const 0)
        )
        (local.set $6
         (i64.const 1)
        )
        (local.set $7
         (local.get $2)
        )
        (local.set $8
         (i64.const 2)
        )
        (local.set $9
         (local.get $3)
        )
       )
       (block
        (br $block$15$break)
       )
      )
     )
    )
    (block
     (block $block$31$break
      (block
       (local.set $37
        (i32.and
         (i32.xor
          (local.get $5)
          (i32.const -1)
         )
         (i32.const 1)
        )
       )
       (local.set $10
        (local.get $6)
       )
       (local.set $11
        (local.get $7)
       )
       (local.set $12
        (local.get $8)
       )
       (local.set $13
        (local.get $9)
       )
      )
      (if
       (local.get $37)
       (loop $shape$13$continue
        (block $block$22$break
         (block
          (local.set $38
           (i64.sub
            (local.get $10)
            (i64.const 1)
           )
          )
          (local.set $39
           (i32.wrap_i64
            (local.get $38)
           )
          )
          (local.set $40
           (i64.extend_i32_s
            (local.get $39)
           )
          )
          (local.set $41
           (i64.eq
            (local.get $38)
            (local.get $40)
           )
          )
         )
         (if
          (local.get $41)
          (br $block$22$break)
          (block
           (call $x____console_log_x_NothingString
            (global.get $g9185389319346651987)
           )
           (block
            (br $block$22$break)
           )
          )
         )
        )
        (block
         (block $block$26$break
          (block
           (call $_v__i__x_____v_i____xNothingExternrefInt32Float64
            (local.get $27)
            (local.get $39)
            (local.get $11)
           )
           (block
            (local.set $42
             (local.get $13)
            )
            (local.set $43
             (i64.sub
              (local.get $42)
              (i64.const 1)
             )
            )
            (local.set $44
             (i64.extend_i32_u
              (struct.get $11 1
               (local.get $0)
              )
             )
            )
            (local.set $45
             (i64.le_s
              (i64.const 0)
              (local.get $44)
             )
            )
            (local.set $46
             (local.get $44)
            )
            (local.set $47
             (i64.lt_u
              (local.get $43)
              (local.get $46)
             )
            )
            (local.set $48
             (i32.and
              (local.get $45)
              (local.get $47)
             )
            )
           )
          )
          (if
           (local.get $48)
           (block
            (block
             (local.set $49
              (array.get $10
               (struct.get $11 0
                (local.get $0)
               )
               (i32.add
                (i32.wrap_i64
                 (local.get $13)
                )
                (i32.const -1)
               )
              )
             )
             (local.set $50
              (i64.add
               (local.get $13)
               (i64.const 1)
              )
             )
             (local.set $14
              (i32.const 0)
             )
             (local.set $15
              (local.get $49)
             )
             (local.set $16
              (local.get $50)
             )
            )
            (block
             (br $block$26$break)
            )
           )
           (block
            (block
             (local.set $14
              (i32.const 1)
             )
             (local.set $17
              (i32.const 1)
             )
            )
            (block
             (br $block$26$break)
            )
           )
          )
         )
         (block
          (block $block$29$break
           (block
           )
           (if
            (local.get $14)
            (block
             (local.set $22
              (local.get $17)
             )
             (block
              (br $block$29$break)
             )
            )
            (block
             (block
              (local.set $51
               (i64.add
                (local.get $12)
                (i64.const 1)
               )
              )
              (local.set $18
               (local.get $16)
              )
              (local.set $19
               (local.get $51)
              )
              (local.set $20
               (local.get $15)
              )
              (local.set $21
               (local.get $12)
              )
              (local.set $22
               (i32.const 0)
              )
             )
             (block
              (br $block$29$break)
             )
            )
           )
          )
          (block
           (block $block$30$break
            (local.set $52
             (i32.and
              (i32.xor
               (local.get $22)
               (i32.const -1)
              )
              (i32.const 1)
             )
            )
            (if
             (local.get $52)
             (br $block$30$break)
             (br $block$31$break)
            )
           )
           (block
            (block
             (local.set $10
              (local.get $21)
             )
             (local.set $11
              (local.get $20)
             )
             (local.set $12
              (local.get $19)
             )
             (local.set $13
              (local.get $18)
             )
            )
            (block
             (br $shape$13$continue)
            )
           )
          )
         )
        )
       )
       (br $block$31$break)
      )
     )
     (block
      (return
       (local.get $27)
      )
     )
    )
   )
  )
 )
 (func $julia_objectNamedTuple___arr___str___num___tp___Tuple_Vector_Float64___String__Float64__Tuple_Int64__Float64___ (type $44) (param $0 (ref null $16)) (result externref)
  (local $1 externref)
  (local $2 (ref null $11))
  (local $3 externref)
  (local $4 stringref)
  (local $5 f64)
  (local $6 (ref null $15))
  (local $7 externref)
  (local $8 i64)
  (local $9 f64)
  (block
   (local.set $1
    (call $__________Externref)
   )
   (local.set $2
    (struct.get $16 0
     (local.get $0)
    )
   )
   (local.set $3
    (call $julia_objectVector_Float64_
     (local.get $2)
    )
   )
   (call $_v__i__x_____v_i____xNothingExternrefStringExternref
    (local.get $1)
    (global.get $g7448992671694014603)
    (local.get $3)
   )
   (local.set $4
    (struct.get $16 1
     (local.get $0)
    )
   )
   (call $_v__i__x_____v_i____xNothingExternrefStringString
    (local.get $1)
    (global.get $g6881845355274915569)
    (local.get $4)
   )
   (local.set $5
    (struct.get $16 2
     (local.get $0)
    )
   )
   (call $_v__i__x_____v_i____xNothingExternrefStringFloat64
    (local.get $1)
    (global.get $g10945161902043969273)
    (local.get $5)
   )
   (local.set $6
    (struct.get $16 3
     (local.get $0)
    )
   )
   (local.set $7
    (call $n____Array_n_ExternrefInt32
     (i32.const 2)
    )
   )
   (local.set $8
    (struct.get $15 0
     (local.get $6)
    )
   )
   (local.set $9
    (struct.get $15 1
     (local.get $6)
    )
   )
   (call $_v__i__x_____v_i____xNothingExternrefInt32Int64
    (local.get $7)
    (i32.const 0)
    (local.get $8)
   )
   (call $_v__i__x_____v_i____xNothingExternrefInt32Float64
    (local.get $7)
    (i32.const 1)
    (local.get $9)
   )
   (call $_v__i__x_____v_i____xNothingExternrefStringExternref
    (local.get $1)
    (global.get $g4112483206321728189)
    (local.get $7)
   )
   (return
    (local.get $1)
   )
  )
 )
 (func $basics (type $46) (param $0 f64) (result f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 (ref null $7))
  (local $8 (ref null $5))
  (local $9 (ref null $2))
  (local $10 (ref null $9))
  (local $11 (ref null $5))
  (local $12 (ref null $2))
  (local $13 (ref null $13))
  (local $14 (ref null $14))
  (local $15 stringref)
  (local $16 externref)
  (local $17 (ref null $19))
  (local $18 (ref null $11))
  (local $19 f64)
  (local $20 i64)
  (local $21 i32)
  (local $22 i64)
  (local $23 i32)
  (local $24 (ref null $16))
  (local $25 externref)
  (block $block$8$break
   (block
    (local.set $7
     (call $julia_hStringTuple_String_
      (global.get $g18446744070140057708)
      (global.get $g9918849156355524007)
      (array.new_fixed $5 1
       (global.get $g17301565310365817963)
      )
     )
    )
    (local.set $8
     (array.new_fixed $5 1
      (global.get $g6816192608897699015)
     )
    )
    (local.set $9
     (call $julia_NamedTupleTuple_String_
      (local.get $8)
     )
    )
    (local.set $10
     (call $julia_hNamedTuple___class____Tuple_String__typeof_WebAssemblyCompiler_JS_h_StringTuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String___
      (local.get $9)
      (global.get $g18446744070140057708)
      (global.get $g8580268782864986099)
      (array.new_fixed $8 1
       (local.get $7)
      )
     )
    )
    (local.set $11
     (array.new_fixed $5 1
      (global.get $g14258755914009136683)
     )
    )
    (local.set $12
     (call $julia_NamedTupleTuple_String_
      (local.get $11)
     )
    )
    (local.set $13
     (struct.new $13
      (global.get $g6488948652265397272)
      (global.get $g7358550468979330460)
      (local.get $0)
      (local.get $10)
     )
    )
    (local.set $14
     (struct.new $14
      (global.get $g18272296077325620145)
      (local.get $12)
      (local.get $13)
     )
    )
    (local.set $15
     (call $julia__stringWebAssemblyCompiler_JS_Node_NamedTuple___class____Tuple_String____Tuple_String__String__Float64__WebAssemblyCompiler_JS_Node_NamedTuple___class____Tuple_String____Tuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____Tuple_String______
      (local.get $14)
     )
    )
    (local.set $16
     (call $_x_____document_getElementById_x_ExternrefString
      (global.get $g17162084985387159482)
     )
    )
    (call $_x__str_____x_innerHTML___strNothingExternrefString
     (local.get $16)
     (local.get $15)
    )
    (local.set $17
     (array.new_fixed $19 3
      (f64.const 1)
      (f64.const 2)
      (f64.const 3)
     )
    )
    (local.set $18
     (struct.new $11
      (array.new $10
       (f64.const 0)
       (i32.wrap_i64
        (i64.const 3)
       )
      )
      (i32.wrap_i64
       (i64.const 3)
      )
     )
    )
    (local.set $1
     (i64.const 1)
    )
    (local.set $2
     (i64.const 1)
    )
    (local.set $3
     (i64.const 1)
    )
   )
   (if
    (i32.const 1)
    (loop $shape$2$continue
     (block $block$5$break
      (block
       (local.set $19
        (array.get $19
         (local.get $17)
         (i32.add
          (i32.wrap_i64
           (local.get $1)
          )
          (i32.const -1)
         )
        )
       )
       (array.set $10
        (struct.get $11 0
         (local.get $18)
        )
        (i32.add
         (i32.wrap_i64
          (local.get $3)
         )
         (i32.const -1)
        )
        (local.get $19)
       )
       (local.set $20
        (i64.add
         (local.get $3)
         (i64.const 1)
        )
       )
       (local.set $21
        (i64.eq
         (local.get $2)
         (i64.const 3)
        )
       )
      )
      (if
       (local.get $21)
       (block
        (local.set $6
         (i32.const 1)
        )
        (block
         (br $block$5$break)
        )
       )
       (block
        (block
         (local.set $22
          (i64.add
           (local.get $2)
           (i64.const 1)
          )
         )
         (local.set $4
          (local.get $22)
         )
         (local.set $5
          (local.get $22)
         )
         (local.set $6
          (i32.const 0)
         )
        )
        (block
         (br $block$5$break)
        )
       )
      )
     )
     (block
      (block $block$6$break
       (local.set $23
        (i32.and
         (i32.xor
          (local.get $6)
          (i32.const -1)
         )
         (i32.const 1)
        )
       )
       (if
        (local.get $23)
        (br $block$6$break)
        (br $block$8$break)
       )
      )
      (block
       (block
        (local.set $1
         (local.get $4)
        )
        (local.set $2
         (local.get $5)
        )
        (local.set $3
         (local.get $20)
        )
       )
       (block
        (br $shape$2$continue)
       )
      )
     )
    )
    (br $block$8$break)
   )
  )
  (block
   (block
    (local.set $24
     (struct.new $16
      (local.get $18)
      (global.get $g7295687158209573762)
      (f64.const 2)
      (struct.new $15
       (i64.const 3)
       (f64.const 3)
      )
     )
    )
    (local.set $25
     (call $julia_objectNamedTuple___arr___str___num___tp___Tuple_Vector_Float64___String__Float64__Tuple_Int64__Float64___
      (local.get $24)
     )
    )
    (call $_x_____console_log_x_NothingExternref
     (local.get $25)
    )
    (return
     (local.get $0)
    )
   )
  )
 )
)
