(module
 (type $0 (array (mut eqref)))
 (type $1 (struct (field (mut (ref null $0))) (field (mut i32))))
 (type $2 (array (mut i8)))
 (type $3 (struct (field (mut (ref null $2))) (field (mut i32))))
 (type $4 (struct (field i64) (field eqref)))
 (type $5 (array (mut (ref null $4))))
 (type $6 (struct (field (mut (ref null $5))) (field (mut i32))))
 (type $7 (struct (field (mut eqref)) (field (mut eqref)) (field (mut i32))))
 (type $8 (array (mut (ref null $7))))
 (type $9 (struct (field (mut (ref null $8))) (field (mut i32))))
 (type $10 (struct (field (mut (ref null $6))) (field (mut (ref null $9))) (field (mut i32)) (field (mut i64)) (field (mut f64))))
 (type $11 (struct (field i64) (field i64)))
 (type $12 (array (mut f64)))
 (type $13 (struct (field (mut (ref null $12))) (field (mut i32))))
 (type $14 (struct (field (mut (ref null $6))) (field (mut (ref null $9))) (field (mut i32)) (field (mut i64)) (field (mut i32))))
 (type $15 (struct (field (ref null $14)) (field (ref null $10)) (field (ref null $10)) (field (ref null $10))))
 (type $16 (struct (field (ref null $13)) (field f64)))
 (type $17 (struct ))
 (type $18 (struct (field (mut (ref null $17))) (field (mut (ref null $15)))))
 (type $19 (array (ref null $18)))
 (type $20 (struct (field (ref null $16)) (field (ref null $11))))
 (type $21 (struct (field (ref null $3))))
 (type $22 (struct (field externref)))
 (type $23 (struct (field (ref null $10)) (field (ref null $19))))
 (type $24 (struct (field f64) (field f64)))
 (type $25 (struct (field f64)))
 (type $26 (struct (field (ref null $24)) (field (ref null $11))))
 (type $27 (struct (field i32)))
 (type $28 (array (mut (ref null $3))))
 (type $29 (struct (field (mut (ref null $28))) (field (mut i32))))
 (type $30 (struct (field (ref null $14)) (field (ref null $19))))
 (type $31 (struct (field (mut i64))))
 (type $32 (func (param externref i32 i32)))
 (type $33 (struct (field f32)))
 (type $34 (struct (field (ref null $22))))
 (type $35 (struct (field i64)))
 (type $36 (func (param f64) (result i32)))
 (type $37 (struct (field eqref) (field eqref)))
 (type $38 (func (param (ref null $20)) (result (ref null $13))))
 (type $39 (func (param i32) (result externref)))
 (type $40 (func (param (ref null $3)) (result externref)))
 (type $41 (func (param externref) (result externref)))
 (type $42 (func (param i64) (result i32)))
 (type $43 (func (param (ref null $26)) (result (ref null $13))))
 (type $44 (func (param f64) (result f64)))
 (type $45 (func (param (ref null $13) (ref null $20) i64 i64) (result (ref null $13))))
 (type $46 (func (param f64 f64 f64 i64) (result (ref null $1))))
 (type $47 (func (param (ref null $3)) (result (ref null $22))))
 (type $48 (func (param externref)))
 (type $49 (func (param (ref null $1) (ref null $1)) (result (ref null $1))))
 (type $50 (func (param externref i32 f64)))
 (type $51 (func (param externref i32 f32)))
 (type $52 (func (param externref i32 externref)))
 (type $53 (func (param (ref null $1)) (result externref)))
 (type $54 (func (param externref externref) (result externref)))
 (type $55 (func (param externref externref)))
 (type $56 (func (param i32 f64 f64 f64)))
 (type $57 (func (param i32) (result i32)))
 (import "js" "(x) => Math.sin(x)" (func $_x_____Math_sin_x_Float64Float64 (type $44) (param f64) (result f64)))
 (import "js" "n => new Uint8Array(n)" (func $n____new_Uint8Array_n_ExternrefInt32 (type $39) (param i32) (result externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32UInt8 (type $32) (param externref i32 i32)))
 (import "js" "(x) => (new TextDecoder()).decode(x)" (func $_x______new_TextDecoder____decode_x_ExternrefExternref (type $41) (param externref) (result externref)))
 (import "js" "(x) => console.log(x)" (func $_x_____console_log_x_NothingExternref (type $48) (param externref)))
 (import "js" "n => Array(n)" (func $n____Array_n_ExternrefInt32 (type $39) (param i32) (result externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Float64 (type $50) (param externref i32 f64)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Float32 (type $51) (param externref i32 f32)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Int32 (type $32) (param externref i32 i32)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Externref (type $52) (param externref i32 externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Bool (type $32) (param externref i32 i32)))
 (import "js" "(x,sep) => x.join(sep)" (func $_x_sep_____x_join_sep_ExternrefExternrefExternref (type $54) (param externref externref) (result externref)))
 (import "js" "(x) => document.getElementById(x)" (func $_x_____document_getElementById_x_ExternrefExternref (type $41) (param externref) (result externref)))
 (import "js" "(x, str) => x.innerHTML = str" (func $_x__str_____x_innerHTML___strNothingExternrefExternref (type $55) (param externref externref)))
 (global $g18446744072864524690 (ref null $17) (struct.new_default $17))
 (global $g17599235311538075850 (ref null $14) (struct.new $14
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $9
   (array.new_fixed $8 0)
   (i32.const 0)
  )
  (i32.const 0)
  (i64.const 5)
  (i32.const 100)
 ))
 (global $g13469542672458079736 (ref null $10) (struct.new $10
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $9
   (array.new_fixed $8 0)
   (i32.const 0)
  )
  (i32.const 0)
  (i64.const 6)
  (f64.const 0.1)
 ))
 (global $g3223267973937791452 (ref null $10) (struct.new $10
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $9
   (array.new_fixed $8 0)
   (i32.const 0)
  )
  (i32.const 0)
  (i64.const 7)
  (f64.const 0)
 ))
 (global $g13642017896889698295 (ref null $10) (struct.new $10
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $9
   (array.new_fixed $8 0)
   (i32.const 0)
  )
  (i32.const 0)
  (i64.const 8)
  (f64.const 10)
 ))
 (global $g13468039814126606963 (ref null $15) (struct.new $15
  (global.get $g17599235311538075850)
  (global.get $g13469542672458079736)
  (global.get $g3223267973937791452)
  (global.get $g13642017896889698295)
 ))
 (global $g10061071710411040169 (ref null $37) (struct.new $37
  (global.get $g18446744072864524690)
  (global.get $g13468039814126606963)
 ))
 (global $g12815395980770130720 (ref null $4) (struct.new $4
  (i64.const 0)
  (global.get $g10061071710411040169)
 ))
 (global $g6840081577674812158 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g12815395980770130720)
  )
  (i32.const 1)
 ))
 (global $g11338291770756748314 (ref null $9) (struct.new $9
  (array.new_fixed $8 0)
  (i32.const 0)
 ))
 (global $g904830620340055086 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g12815395980770130720)
  )
  (i32.const 1)
 ))
 (global $g13026992394578438748 (ref null $9) (struct.new $9
  (array.new_fixed $8 0)
  (i32.const 0)
 ))
 (global $g657571247101572068 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g12815395980770130720)
  )
  (i32.const 1)
 ))
 (global $g15401382717869451966 (ref null $9) (struct.new $9
  (array.new_fixed $8 0)
  (i32.const 0)
 ))
 (global $g6285047454817139346 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g12815395980770130720)
  )
  (i32.const 1)
 ))
 (global $g8306982745231558940 (ref null $9) (struct.new $9
  (array.new_fixed $8 0)
  (i32.const 0)
 ))
 (global $g9756129391141165384 (ref null $18) (struct.new $18
  (global.get $g18446744072864524690)
  (global.get $g13468039814126606963)
 ))
 (global $g11863923786597644316 (ref null $19) (array.new_fixed $19 1
  (global.get $g9756129391141165384)
 ))
 (global $g5284476463869129866 (ref null $30) (struct.new $30
  (global.get $g17599235311538075850)
  (global.get $g11863923786597644316)
 ))
 (global $g11364165201186046862 (ref null $3) (struct.new $3
  (array.new_fixed $2 5
   (i32.const 98)
   (i32.const 108)
   (i32.const 97)
   (i32.const 99)
   (i32.const 107)
  )
  (i32.const 5)
 ))
 (global $g7856110131526212985 (ref null $3) (struct.new $3
  (array.new_fixed $2 4
   (i32.const 103)
   (i32.const 114)
   (i32.const 97)
   (i32.const 121)
  )
  (i32.const 4)
 ))
 (global $g2516736808186709465 (ref null $3) (struct.new $3
  (array.new_fixed $2 6
   (i32.const 115)
   (i32.const 105)
   (i32.const 108)
   (i32.const 118)
   (i32.const 101)
   (i32.const 114)
  )
  (i32.const 6)
 ))
 (global $g13588353848275122834 (ref null $3) (struct.new $3
  (array.new_fixed $2 6
   (i32.const 109)
   (i32.const 97)
   (i32.const 114)
   (i32.const 111)
   (i32.const 111)
   (i32.const 110)
  )
  (i32.const 6)
 ))
 (global $g1858869381885086697 (ref null $3) (struct.new $3
  (array.new_fixed $2 3
   (i32.const 114)
   (i32.const 101)
   (i32.const 100)
  )
  (i32.const 3)
 ))
 (global $g572418428893749895 (ref null $3) (struct.new $3
  (array.new_fixed $2 5
   (i32.const 111)
   (i32.const 108)
   (i32.const 105)
   (i32.const 118)
   (i32.const 101)
  )
  (i32.const 5)
 ))
 (global $g10253189802433390380 (ref null $3) (struct.new $3
  (array.new_fixed $2 6
   (i32.const 121)
   (i32.const 101)
   (i32.const 108)
   (i32.const 108)
   (i32.const 111)
   (i32.const 119)
  )
  (i32.const 6)
 ))
 (global $g10612655753838867627 (ref null $3) (struct.new $3
  (array.new_fixed $2 5
   (i32.const 103)
   (i32.const 114)
   (i32.const 101)
   (i32.const 101)
   (i32.const 110)
  )
  (i32.const 5)
 ))
 (global $g1591604155814744739 (ref null $3) (struct.new $3
  (array.new_fixed $2 4
   (i32.const 108)
   (i32.const 105)
   (i32.const 109)
   (i32.const 101)
  )
  (i32.const 4)
 ))
 (global $g1573287231293875009 (ref null $3) (struct.new $3
  (array.new_fixed $2 4
   (i32.const 116)
   (i32.const 101)
   (i32.const 97)
   (i32.const 108)
  )
  (i32.const 4)
 ))
 (global $g17476495360059241787 (ref null $3) (struct.new $3
  (array.new_fixed $2 4
   (i32.const 97)
   (i32.const 113)
   (i32.const 117)
   (i32.const 97)
  )
  (i32.const 4)
 ))
 (global $g15892184661804899067 (ref null $3) (struct.new $3
  (array.new_fixed $2 4
   (i32.const 110)
   (i32.const 97)
   (i32.const 118)
   (i32.const 121)
  )
  (i32.const 4)
 ))
 (global $g1236987772545486268 (ref null $3) (struct.new $3
  (array.new_fixed $2 4
   (i32.const 98)
   (i32.const 108)
   (i32.const 117)
   (i32.const 101)
  )
  (i32.const 4)
 ))
 (global $g1999019984422065084 (ref null $3) (struct.new $3
  (array.new_fixed $2 6
   (i32.const 112)
   (i32.const 117)
   (i32.const 114)
   (i32.const 112)
   (i32.const 108)
   (i32.const 101)
  )
  (i32.const 6)
 ))
 (global $g14165383556478187998 (ref null $3) (struct.new $3
  (array.new_fixed $2 7
   (i32.const 102)
   (i32.const 117)
   (i32.const 99)
   (i32.const 104)
   (i32.const 115)
   (i32.const 105)
   (i32.const 97)
  )
  (i32.const 7)
 ))
 (global $g6716504564415405511 (ref null $29) (struct.new $29
  (array.new_fixed $28 15
   (global.get $g11364165201186046862)
   (global.get $g7856110131526212985)
   (global.get $g2516736808186709465)
   (global.get $g13588353848275122834)
   (global.get $g1858869381885086697)
   (global.get $g572418428893749895)
   (global.get $g10253189802433390380)
   (global.get $g10612655753838867627)
   (global.get $g1591604155814744739)
   (global.get $g1573287231293875009)
   (global.get $g17476495360059241787)
   (global.get $g15892184661804899067)
   (global.get $g1236987772545486268)
   (global.get $g1999019984422065084)
   (global.get $g14165383556478187998)
  )
  (i32.const 15)
 ))
 (global $g944050846593814355 (ref null $18) (struct.new $18
  (global.get $g18446744072864524690)
  (global.get $g13468039814126606963)
 ))
 (global $g14679483670770247964 (ref null $19) (array.new_fixed $19 1
  (global.get $g944050846593814355)
 ))
 (global $g2421260343062419193 (ref null $23) (struct.new $23
  (global.get $g13469542672458079736)
  (global.get $g14679483670770247964)
 ))
 (global $g11949973112576760119 (ref null $18) (struct.new $18
  (global.get $g18446744072864524690)
  (global.get $g13468039814126606963)
 ))
 (global $g6210585916141065086 (ref null $19) (array.new_fixed $19 1
  (global.get $g11949973112576760119)
 ))
 (global $g7816210575597790628 (ref null $23) (struct.new $23
  (global.get $g3223267973937791452)
  (global.get $g6210585916141065086)
 ))
 (global $g9458957745491773977 (ref null $18) (struct.new $18
  (global.get $g18446744072864524690)
  (global.get $g13468039814126606963)
 ))
 (global $g15065985326290935632 (ref null $19) (array.new_fixed $19 1
  (global.get $g9458957745491773977)
 ))
 (global $g18347801754573464288 (ref null $23) (struct.new $23
  (global.get $g13642017896889698295)
  (global.get $g15065985326290935632)
 ))
 (export "nsamples" (func $nsamples))
 (export "sample_step" (func $sample_step))
 (export "phase" (func $phase))
 (export "radii" (func $radii))
 (func $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__2_5__Float64__Float64__ (type $43) (param $0 (ref null $26)) (result (ref null $13))
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 f64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 f64)
  (local $13 (ref null $11))
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (local $19 i64)
  (local $20 (ref null $11))
  (local $21 i64)
  (local $22 i64)
  (local $23 i32)
  (local $24 i64)
  (local $25 i64)
  (local $26 (ref null $24))
  (local $27 f64)
  (local $28 f64)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 (ref null $13))
  (local $33 (ref null $13))
  (local $34 (ref null $11))
  (local $35 i64)
  (local $36 i32)
  (local $37 i64)
  (local $38 (ref null $24))
  (local $39 f64)
  (local $40 f64)
  (local $41 f64)
  (local $42 f64)
  (local $43 f64)
  (local $44 i64)
  (block $block$3$break
   (block
   )
   (block
    (br $block$3$break)
   )
  )
  (block
   (block $block$6$break
    (block
     (local.set $13
      (struct.get $26 1
       (local.get $0)
      )
     )
     (local.set $14
      (struct.get $11 0
       (local.get $13)
      )
     )
     (local.set $15
      (struct.get $11 1
       (local.get $13)
      )
     )
     (local.set $16
      (i64.sub
       (local.get $15)
       (local.get $14)
      )
     )
     (local.set $17
      (i64.add
       (i64.const 1)
       (local.get $16)
      )
     )
     (local.set $18
      (i64.lt_s
       (local.get $17)
       (i64.const 0)
      )
     )
     (local.set $19
      (if (result i64)
       (local.get $18)
       (i64.const 0)
       (local.get $17)
      )
     )
     (local.set $20
      (struct.get $26 1
       (local.get $0)
      )
     )
     (local.set $21
      (struct.get $11 0
       (local.get $20)
      )
     )
     (local.set $22
      (struct.get $11 1
       (local.get $20)
      )
     )
     (local.set $23
      (i64.lt_s
       (local.get $22)
       (local.get $21)
      )
     )
    )
    (if
     (local.get $23)
     (block
      (local.set $1
       (i32.const 1)
      )
      (block
       (br $block$6$break)
      )
     )
     (block
      (block
       (local.set $24
        (struct.get $11 0
         (local.get $20)
        )
       )
       (local.set $25
        (struct.get $11 0
         (local.get $20)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $2
        (local.get $24)
       )
       (local.set $3
        (local.get $25)
       )
      )
      (block
       (br $block$6$break)
      )
     )
    )
   )
   (block
    (block $block$9$break
     (block
     )
     (if
      (local.get $1)
      (block
       (local.set $4
        (i32.const 1)
       )
       (block
        (br $block$9$break)
       )
      )
      (block
       (block
        (local.set $26
         (struct.get $26 0
          (local.get $0)
         )
        )
        (local.set $27
         (struct.get $24 0
          (local.get $26)
         )
        )
        (local.set $28
         (f64.convert_i64_s
          (local.get $2)
         )
        )
        (local.set $29
         (f64.mul
          (local.get $28)
          (local.get $27)
         )
        )
        (local.set $30
         (struct.get $24 1
          (local.get $26)
         )
        )
        (local.set $31
         (f64.add
          (local.get $29)
          (local.get $30)
         )
        )
        (local.set $4
         (i32.const 0)
        )
        (local.set $5
         (local.get $31)
        )
       )
       (block
        (br $block$9$break)
       )
      )
     )
    )
    (block
     (block $block$11$break
      (block
      )
      (if
       (local.get $4)
       (block
        (block
         (local.set $32
          (struct.new $13
           (array.new $12
            (f64.const 0)
            (i32.wrap_i64
             (local.get $19)
            )
           )
           (i32.wrap_i64
            (local.get $19)
           )
          )
         )
         (return
          (local.get $32)
         )
        )
       )
       (br $block$11$break)
      )
     )
     (block
      (block $block$12$break
       (block
        (local.set $33
         (struct.new $13
          (array.new $12
           (f64.const 0)
           (i32.wrap_i64
            (local.get $19)
           )
          )
          (i32.wrap_i64
           (local.get $19)
          )
         )
        )
        (array.set $12
         (struct.get $13 0
          (local.get $33)
         )
         (i32.add
          (i32.wrap_i64
           (i64.const 1)
          )
          (i32.const -1)
         )
         (local.get $5)
        )
        (local.set $6
         (i64.const 2)
        )
        (local.set $7
         (local.get $3)
        )
       )
       (block
        (br $block$12$break)
       )
      )
      (block
       (block $block$24$break
        (loop $shape$13$continue
         (block $block$13$break
          (block
          )
          (if
           (i32.const 1)
           (br $block$13$break)
           (br $block$24$break)
          )
         )
         (block
          (block $block$16$break
           (block
            (local.set $34
             (struct.get $26 1
              (local.get $0)
             )
            )
            (local.set $35
             (struct.get $11 1
              (local.get $34)
             )
            )
            (local.set $36
             (i64.eq
              (local.get $7)
              (local.get $35)
             )
            )
           )
           (if
            (local.get $36)
            (block
             (local.set $8
              (i32.const 1)
             )
             (block
              (br $block$16$break)
             )
            )
            (block
             (block
              (local.set $37
               (i64.add
                (local.get $7)
                (i64.const 1)
               )
              )
              (local.set $8
               (i32.const 0)
              )
              (local.set $9
               (local.get $37)
              )
              (local.set $10
               (local.get $37)
              )
             )
             (block
              (br $block$16$break)
             )
            )
           )
          )
          (block
           (block $block$19$break
            (block
            )
            (if
             (local.get $8)
             (block
              (local.set $11
               (i32.const 1)
              )
              (block
               (br $block$19$break)
              )
             )
             (block
              (block
               (local.set $38
                (struct.get $26 0
                 (local.get $0)
                )
               )
               (local.set $39
                (struct.get $24 0
                 (local.get $38)
                )
               )
               (local.set $40
                (f64.convert_i64_s
                 (local.get $9)
                )
               )
               (local.set $41
                (f64.mul
                 (local.get $40)
                 (local.get $39)
                )
               )
               (local.set $42
                (struct.get $24 1
                 (local.get $38)
                )
               )
               (local.set $43
                (f64.add
                 (local.get $41)
                 (local.get $42)
                )
               )
               (local.set $11
                (i32.const 0)
               )
               (local.set $12
                (local.get $43)
               )
              )
              (block
               (br $block$19$break)
              )
             )
            )
           )
           (block
            (block $block$21$break
             (block
             )
             (if
              (local.get $11)
              (br $block$24$break)
              (br $block$21$break)
             )
            )
            (block
             (block
              (array.set $12
               (struct.get $13 0
                (local.get $33)
               )
               (i32.add
                (i32.wrap_i64
                 (local.get $6)
                )
                (i32.const -1)
               )
               (local.get $12)
              )
              (local.set $44
               (i64.add
                (local.get $6)
                (i64.const 1)
               )
              )
              (local.set $6
               (local.get $44)
              )
              (local.set $7
               (local.get $10)
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
       )
       (block
        (return
         (local.get $33)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $julia_collect_to_Vector_Float64_Base_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__Int64Int64 (type $45) (param $0 (ref null $13)) (param $1 (ref null $20)) (param $2 i64) (param $3 i64) (result (ref null $13))
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 f64)
  (local $11 (ref null $11))
  (local $12 i64)
  (local $13 i32)
  (local $14 i64)
  (local $15 (ref null $16))
  (local $16 (ref null $13))
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 i64)
  (block $block$2$break
   (block
    (local.set $4
     (local.get $2)
    )
    (local.set $5
     (local.get $3)
    )
   )
   (block
    (br $block$2$break)
   )
  )
  (block
   (block $block$12$break
    (loop $shape$1$continue
     (block $block$3$break
      (block
      )
      (if
       (i32.const 1)
       (br $block$3$break)
       (br $block$12$break)
      )
     )
     (block
      (block $block$6$break
       (block
        (local.set $11
         (struct.get $20 1
          (local.get $1)
         )
        )
        (local.set $12
         (struct.get $11 1
          (local.get $11)
         )
        )
        (local.set $13
         (i64.eq
          (local.get $5)
          (local.get $12)
         )
        )
       )
       (if
        (local.get $13)
        (block
         (local.set $6
          (i32.const 1)
         )
         (block
          (br $block$6$break)
         )
        )
        (block
         (block
          (local.set $14
           (i64.add
            (local.get $5)
            (i64.const 1)
           )
          )
          (local.set $6
           (i32.const 0)
          )
          (local.set $7
           (local.get $14)
          )
          (local.set $8
           (local.get $14)
          )
         )
         (block
          (br $block$6$break)
         )
        )
       )
      )
      (block
       (block $block$9$break
        (block
        )
        (if
         (local.get $6)
         (block
          (local.set $9
           (i32.const 1)
          )
          (block
           (br $block$9$break)
          )
         )
         (block
          (block
           (local.set $15
            (struct.get $20 0
             (local.get $1)
            )
           )
           (local.set $16
            (struct.get $16 0
             (local.get $15)
            )
           )
           (local.set $17
            (array.get $12
             (struct.get $13 0
              (local.get $16)
             )
             (i32.add
              (i32.wrap_i64
               (local.get $7)
              )
              (i32.const -1)
             )
            )
           )
           (local.set $18
            (call $_x_____Math_sin_x_Float64Float64
             (local.get $17)
            )
           )
           (local.set $19
            (struct.get $16 1
             (local.get $15)
            )
           )
           (local.set $20
            (f64.mul
             (local.get $18)
             (local.get $19)
            )
           )
           (local.set $21
            (f64.div
             (local.get $20)
             (f64.const 3)
            )
           )
           (local.set $22
            (struct.get $16 1
             (local.get $15)
            )
           )
           (local.set $23
            (f64.div
             (local.get $22)
             (f64.const 2)
            )
           )
           (local.set $24
            (f64.add
             (local.get $21)
             (local.get $23)
            )
           )
           (local.set $9
            (i32.const 0)
           )
           (local.set $10
            (local.get $24)
           )
          )
          (block
           (br $block$9$break)
          )
         )
        )
       )
       (block
        (block $block$11$break
         (block
         )
         (if
          (local.get $9)
          (br $block$12$break)
          (br $block$11$break)
         )
        )
        (block
         (block
          (array.set $12
           (struct.get $13 0
            (local.get $0)
           )
           (i32.add
            (i32.wrap_i64
             (local.get $4)
            )
            (i32.const -1)
           )
           (local.get $10)
          )
          (local.set $25
           (i64.add
            (local.get $4)
            (i64.const 1)
           )
          )
          (local.set $4
           (local.get $25)
          )
          (local.set $5
           (local.get $8)
          )
         )
         (block
          (br $shape$1$continue)
         )
        )
       )
      )
     )
    )
   )
   (block
    (return
     (local.get $0)
    )
   )
  )
 )
 (func $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__ (type $38) (param $0 (ref null $20)) (result (ref null $13))
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 f64)
  (local $6 (ref null $11))
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i64)
  (local $13 (ref null $11))
  (local $14 i64)
  (local $15 i64)
  (local $16 i32)
  (local $17 i64)
  (local $18 i64)
  (local $19 (ref null $16))
  (local $20 (ref null $13))
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 f64)
  (local $26 f64)
  (local $27 f64)
  (local $28 f64)
  (local $29 (ref null $13))
  (local $30 (ref null $13))
  (local $31 (ref null $13))
  (block $block$3$break
   (block
   )
   (block
    (br $block$3$break)
   )
  )
  (block
   (block $block$6$break
    (block
     (local.set $6
      (struct.get $20 1
       (local.get $0)
      )
     )
     (local.set $7
      (struct.get $11 0
       (local.get $6)
      )
     )
     (local.set $8
      (struct.get $11 1
       (local.get $6)
      )
     )
     (local.set $9
      (i64.sub
       (local.get $8)
       (local.get $7)
      )
     )
     (local.set $10
      (i64.add
       (i64.const 1)
       (local.get $9)
      )
     )
     (local.set $11
      (i64.lt_s
       (local.get $10)
       (i64.const 0)
      )
     )
     (local.set $12
      (if (result i64)
       (local.get $11)
       (i64.const 0)
       (local.get $10)
      )
     )
     (local.set $13
      (struct.get $20 1
       (local.get $0)
      )
     )
     (local.set $14
      (struct.get $11 0
       (local.get $13)
      )
     )
     (local.set $15
      (struct.get $11 1
       (local.get $13)
      )
     )
     (local.set $16
      (i64.lt_s
       (local.get $15)
       (local.get $14)
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
       (br $block$6$break)
      )
     )
     (block
      (block
       (local.set $17
        (struct.get $11 0
         (local.get $13)
        )
       )
       (local.set $18
        (struct.get $11 0
         (local.get $13)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $2
        (local.get $17)
       )
       (local.set $3
        (local.get $18)
       )
      )
      (block
       (br $block$6$break)
      )
     )
    )
   )
   (block
    (block $block$9$break
     (block
     )
     (if
      (local.get $1)
      (block
       (local.set $4
        (i32.const 1)
       )
       (block
        (br $block$9$break)
       )
      )
      (block
       (block
        (local.set $19
         (struct.get $20 0
          (local.get $0)
         )
        )
        (local.set $20
         (struct.get $16 0
          (local.get $19)
         )
        )
        (local.set $21
         (array.get $12
          (struct.get $13 0
           (local.get $20)
          )
          (i32.add
           (i32.wrap_i64
            (local.get $2)
           )
           (i32.const -1)
          )
         )
        )
        (local.set $22
         (call $_x_____Math_sin_x_Float64Float64
          (local.get $21)
         )
        )
        (local.set $23
         (struct.get $16 1
          (local.get $19)
         )
        )
        (local.set $24
         (f64.mul
          (local.get $22)
          (local.get $23)
         )
        )
        (local.set $25
         (f64.div
          (local.get $24)
          (f64.const 3)
         )
        )
        (local.set $26
         (struct.get $16 1
          (local.get $19)
         )
        )
        (local.set $27
         (f64.div
          (local.get $26)
          (f64.const 2)
         )
        )
        (local.set $28
         (f64.add
          (local.get $25)
          (local.get $27)
         )
        )
        (local.set $4
         (i32.const 0)
        )
        (local.set $5
         (local.get $28)
        )
       )
       (block
        (br $block$9$break)
       )
      )
     )
    )
    (block
     (block
     )
     (if
      (local.get $4)
      (block
       (block
        (local.set $29
         (struct.new $13
          (array.new $12
           (f64.const 0)
           (i32.wrap_i64
            (local.get $12)
           )
          )
          (i32.wrap_i64
           (local.get $12)
          )
         )
        )
        (return
         (local.get $29)
        )
       )
      )
      (block
       (block
        (local.set $30
         (struct.new $13
          (array.new $12
           (f64.const 0)
           (i32.wrap_i64
            (local.get $12)
           )
          )
          (i32.wrap_i64
           (local.get $12)
          )
         )
        )
        (array.set $12
         (struct.get $13 0
          (local.get $30)
         )
         (i32.add
          (i32.wrap_i64
           (i64.const 1)
          )
          (i32.const -1)
         )
         (local.get $5)
        )
        (local.set $31
         (call $julia_collect_to_Vector_Float64_Base_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__Int64Int64
          (local.get $30)
          (local.get $0)
          (i64.const 2)
          (local.get $3)
         )
        )
        (return
         (local.get $31)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__4_7__Vector_Float64___Float64__ (type $38) (param $0 (ref null $20)) (result (ref null $13))
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 f64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 f64)
  (local $13 (ref null $11))
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (local $19 i64)
  (local $20 (ref null $11))
  (local $21 i64)
  (local $22 i64)
  (local $23 i32)
  (local $24 i64)
  (local $25 i64)
  (local $26 (ref null $16))
  (local $27 (ref null $13))
  (local $28 f64)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 (ref null $13))
  (local $33 (ref null $13))
  (local $34 (ref null $11))
  (local $35 i64)
  (local $36 i32)
  (local $37 i64)
  (local $38 (ref null $16))
  (local $39 (ref null $13))
  (local $40 f64)
  (local $41 f64)
  (local $42 f64)
  (local $43 f64)
  (local $44 i64)
  (block $block$3$break
   (block
   )
   (block
    (br $block$3$break)
   )
  )
  (block
   (block $block$6$break
    (block
     (local.set $13
      (struct.get $20 1
       (local.get $0)
      )
     )
     (local.set $14
      (struct.get $11 0
       (local.get $13)
      )
     )
     (local.set $15
      (struct.get $11 1
       (local.get $13)
      )
     )
     (local.set $16
      (i64.sub
       (local.get $15)
       (local.get $14)
      )
     )
     (local.set $17
      (i64.add
       (i64.const 1)
       (local.get $16)
      )
     )
     (local.set $18
      (i64.lt_s
       (local.get $17)
       (i64.const 0)
      )
     )
     (local.set $19
      (if (result i64)
       (local.get $18)
       (i64.const 0)
       (local.get $17)
      )
     )
     (local.set $20
      (struct.get $20 1
       (local.get $0)
      )
     )
     (local.set $21
      (struct.get $11 0
       (local.get $20)
      )
     )
     (local.set $22
      (struct.get $11 1
       (local.get $20)
      )
     )
     (local.set $23
      (i64.lt_s
       (local.get $22)
       (local.get $21)
      )
     )
    )
    (if
     (local.get $23)
     (block
      (local.set $1
       (i32.const 1)
      )
      (block
       (br $block$6$break)
      )
     )
     (block
      (block
       (local.set $24
        (struct.get $11 0
         (local.get $20)
        )
       )
       (local.set $25
        (struct.get $11 0
         (local.get $20)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $2
        (local.get $24)
       )
       (local.set $3
        (local.get $25)
       )
      )
      (block
       (br $block$6$break)
      )
     )
    )
   )
   (block
    (block $block$9$break
     (block
     )
     (if
      (local.get $1)
      (block
       (local.set $4
        (i32.const 1)
       )
       (block
        (br $block$9$break)
       )
      )
      (block
       (block
        (local.set $26
         (struct.get $20 0
          (local.get $0)
         )
        )
        (local.set $27
         (struct.get $16 0
          (local.get $26)
         )
        )
        (local.set $28
         (array.get $12
          (struct.get $13 0
           (local.get $27)
          )
          (i32.add
           (i32.wrap_i64
            (local.get $2)
           )
           (i32.const -1)
          )
         )
        )
        (local.set $29
         (struct.get $16 1
          (local.get $26)
         )
        )
        (local.set $30
         (f64.mul
          (local.get $28)
          (local.get $29)
         )
        )
        (local.set $31
         (f64.div
          (local.get $30)
          (f64.const 12.566370614359172)
         )
        )
        (local.set $4
         (i32.const 0)
        )
        (local.set $5
         (local.get $31)
        )
       )
       (block
        (br $block$9$break)
       )
      )
     )
    )
    (block
     (block $block$11$break
      (block
      )
      (if
       (local.get $4)
       (block
        (block
         (local.set $32
          (struct.new $13
           (array.new $12
            (f64.const 0)
            (i32.wrap_i64
             (local.get $19)
            )
           )
           (i32.wrap_i64
            (local.get $19)
           )
          )
         )
         (return
          (local.get $32)
         )
        )
       )
       (br $block$11$break)
      )
     )
     (block
      (block $block$12$break
       (block
        (local.set $33
         (struct.new $13
          (array.new $12
           (f64.const 0)
           (i32.wrap_i64
            (local.get $19)
           )
          )
          (i32.wrap_i64
           (local.get $19)
          )
         )
        )
        (array.set $12
         (struct.get $13 0
          (local.get $33)
         )
         (i32.add
          (i32.wrap_i64
           (i64.const 1)
          )
          (i32.const -1)
         )
         (local.get $5)
        )
        (local.set $6
         (i64.const 2)
        )
        (local.set $7
         (local.get $3)
        )
       )
       (block
        (br $block$12$break)
       )
      )
      (block
       (block $block$24$break
        (loop $shape$13$continue
         (block $block$13$break
          (block
          )
          (if
           (i32.const 1)
           (br $block$13$break)
           (br $block$24$break)
          )
         )
         (block
          (block $block$16$break
           (block
            (local.set $34
             (struct.get $20 1
              (local.get $0)
             )
            )
            (local.set $35
             (struct.get $11 1
              (local.get $34)
             )
            )
            (local.set $36
             (i64.eq
              (local.get $7)
              (local.get $35)
             )
            )
           )
           (if
            (local.get $36)
            (block
             (local.set $8
              (i32.const 1)
             )
             (block
              (br $block$16$break)
             )
            )
            (block
             (block
              (local.set $37
               (i64.add
                (local.get $7)
                (i64.const 1)
               )
              )
              (local.set $8
               (i32.const 0)
              )
              (local.set $9
               (local.get $37)
              )
              (local.set $10
               (local.get $37)
              )
             )
             (block
              (br $block$16$break)
             )
            )
           )
          )
          (block
           (block $block$19$break
            (block
            )
            (if
             (local.get $8)
             (block
              (local.set $11
               (i32.const 1)
              )
              (block
               (br $block$19$break)
              )
             )
             (block
              (block
               (local.set $38
                (struct.get $20 0
                 (local.get $0)
                )
               )
               (local.set $39
                (struct.get $16 0
                 (local.get $38)
                )
               )
               (local.set $40
                (array.get $12
                 (struct.get $13 0
                  (local.get $39)
                 )
                 (i32.add
                  (i32.wrap_i64
                   (local.get $9)
                  )
                  (i32.const -1)
                 )
                )
               )
               (local.set $41
                (struct.get $16 1
                 (local.get $38)
                )
               )
               (local.set $42
                (f64.mul
                 (local.get $40)
                 (local.get $41)
                )
               )
               (local.set $43
                (f64.div
                 (local.get $42)
                 (f64.const 12.566370614359172)
                )
               )
               (local.set $11
                (i32.const 0)
               )
               (local.set $12
                (local.get $43)
               )
              )
              (block
               (br $block$19$break)
              )
             )
            )
           )
           (block
            (block $block$21$break
             (block
             )
             (if
              (local.get $11)
              (br $block$24$break)
              (br $block$21$break)
             )
            )
            (block
             (block
              (array.set $12
               (struct.get $13 0
                (local.get $33)
               )
               (i32.add
                (i32.wrap_i64
                 (local.get $6)
                )
                (i32.const -1)
               )
               (local.get $12)
              )
              (local.set $44
               (i64.add
                (local.get $6)
                (i64.const 1)
               )
              )
              (local.set $6
               (local.get $44)
              )
              (local.set $7
               (local.get $10)
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
       )
       (block
        (return
         (local.get $33)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $julia_circFloat64Float64Float64Int64 (type $46) (param $0 f64) (param $1 f64) (param $2 f64) (param $3 i64) (result (ref null $1))
  (local $4 (ref null $29))
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 (ref null $29))
  (local $9 (ref null $3))
  (local $10 (ref null $1))
  (block
   (local.set $4
    (global.get $g6716504564415405511)
   )
   (local.set $5
    (i64.extend_i32_u
     (struct.get $29 1
      (local.get $4)
     )
    )
   )
   (local.set $6
    (i64.rem_s
     (local.get $3)
     (local.get $5)
    )
   )
   (local.set $7
    (i64.add
     (local.get $6)
     (i64.const 1)
    )
   )
   (local.set $8
    (global.get $g6716504564415405511)
   )
   (local.set $9
    (array.get $28
     (struct.get $29 0
      (local.get $8)
     )
     (i32.add
      (i32.wrap_i64
       (local.get $7)
      )
      (i32.const -1)
     )
    )
   )
   (local.set $10
    (struct.new $1
     (array.new $0
      (struct.new $31
       (i64.const 0)
      )
      (i32.wrap_i64
       (i64.const 9)
      )
     )
     (i32.wrap_i64
      (i64.const 9)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 1)
     )
     (i32.const -1)
    )
    (struct.new $21
     (struct.new $3
      (array.new_fixed $2 12
       (i32.const 60)
       (i32.const 99)
       (i32.const 105)
       (i32.const 114)
       (i32.const 99)
       (i32.const 108)
       (i32.const 101)
       (i32.const 32)
       (i32.const 99)
       (i32.const 120)
       (i32.const 61)
       (i32.const 39)
      )
      (i32.const 12)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 2)
     )
     (i32.const -1)
    )
    (struct.new $25
     (local.get $0)
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 3)
     )
     (i32.const -1)
    )
    (struct.new $21
     (struct.new $3
      (array.new_fixed $2 6
       (i32.const 39)
       (i32.const 32)
       (i32.const 99)
       (i32.const 121)
       (i32.const 61)
       (i32.const 39)
      )
      (i32.const 6)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 4)
     )
     (i32.const -1)
    )
    (struct.new $25
     (local.get $1)
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 5)
     )
     (i32.const -1)
    )
    (struct.new $21
     (struct.new $3
      (array.new_fixed $2 5
       (i32.const 39)
       (i32.const 32)
       (i32.const 114)
       (i32.const 61)
       (i32.const 39)
      )
      (i32.const 5)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 6)
     )
     (i32.const -1)
    )
    (struct.new $25
     (local.get $2)
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 7)
     )
     (i32.const -1)
    )
    (struct.new $21
     (struct.new $3
      (array.new_fixed $2 8
       (i32.const 39)
       (i32.const 32)
       (i32.const 102)
       (i32.const 105)
       (i32.const 108)
       (i32.const 108)
       (i32.const 61)
       (i32.const 39)
      )
      (i32.const 8)
     )
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 8)
     )
     (i32.const -1)
    )
    (struct.new $21
     (local.get $9)
    )
   )
   (array.set $0
    (struct.get $1 0
     (local.get $10)
    )
    (i32.add
     (i32.wrap_i64
      (i64.const 9)
     )
     (i32.const -1)
    )
    (struct.new $21
     (struct.new $3
      (array.new_fixed $2 11
       (i32.const 39)
       (i32.const 62)
       (i32.const 60)
       (i32.const 47)
       (i32.const 99)
       (i32.const 105)
       (i32.const 114)
       (i32.const 99)
       (i32.const 108)
       (i32.const 101)
       (i32.const 62)
      )
      (i32.const 11)
     )
    )
   )
   (return
    (local.get $10)
   )
  )
 )
 (func $julia__setExternrefInt32UInt8 (type $32) (param $0 externref) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (block
   (local.set $3
    (i32.sub
     (local.get $1)
     (i32.const 1)
    )
   )
   (call $_v__i__x_____v_i____xNothingExternrefInt32UInt8
    (local.get $0)
    (local.get $3)
    (local.get $2)
   )
   (return)
  )
 )
 (func $julia_objectVector_UInt8_ (type $40) (param $0 (ref null $3)) (result externref)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i64)
  (local $13 i64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i64)
  (local $17 i32)
  (local $18 i64)
  (local $19 i64)
  (local $20 i32)
  (local $21 i64)
  (local $22 i32)
  (local $23 i64)
  (local $24 i32)
  (local $25 externref)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 i32)
  (local $30 i64)
  (local $31 i32)
  (local $32 i32)
  (local $33 i32)
  (local $34 i64)
  (local $35 i32)
  (local $36 i32)
  (local $37 i64)
  (local $38 i64)
  (local $39 i64)
  (local $40 i32)
  (local $41 i64)
  (local $42 i32)
  (local $43 i32)
  (local $44 i32)
  (local $45 i64)
  (local $46 i64)
  (local $47 i32)
  (block $block$5$break
   (block
    (local.set $23
     (i64.extend_i32_u
      (struct.get $3 1
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
     (call $n____new_Uint8Array_n_ExternrefInt32
      (local.get $24)
     )
    )
    (local.set $26
     (i64.const 1)
    )
    (local.set $27
     (i64.sub
      (local.get $26)
      (i64.const 1)
     )
    )
    (local.set $28
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $0)
      )
     )
    )
    (local.set $29
     (i64.le_s
      (i64.const 0)
      (local.get $28)
     )
    )
    (local.set $30
     (local.get $28)
    )
    (local.set $31
     (i64.lt_u
      (local.get $27)
      (local.get $30)
     )
    )
    (local.set $32
     (i32.and
      (local.get $29)
      (local.get $31)
     )
    )
   )
   (if
    (local.get $32)
    (block
     (block
      (local.set $33
       (array.get_u $2
        (struct.get $3 0
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
      (local.set $34
       (i64.add
        (i64.const 1)
        (i64.const 1)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $2
       (local.get $33)
      )
      (local.set $3
       (local.get $34)
      )
     )
     (block
      (br $block$5$break)
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
      (br $block$5$break)
     )
    )
   )
  )
  (block
   (block $block$9$break
    (block
    )
    (if
     (local.get $1)
     (block
      (local.set $5
       (local.get $4)
      )
      (block
       (br $block$9$break)
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
       (br $block$9$break)
      )
     )
    )
   )
   (block
    (block $block$18$break
     (block
      (local.set $35
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
      (local.get $35)
      (loop $shape$10$continue
       (block $block$13$break
        (block
         (local.set $36
          (i32.wrap_i64
           (local.get $10)
          )
         )
         (call $julia__setExternrefInt32UInt8
          (local.get $25)
          (local.get $36)
          (local.get $11)
         )
         (local.set $37
          (local.get $13)
         )
         (local.set $38
          (i64.sub
           (local.get $37)
           (i64.const 1)
          )
         )
         (local.set $39
          (i64.extend_i32_u
           (struct.get $3 1
            (local.get $0)
           )
          )
         )
         (local.set $40
          (i64.le_s
           (i64.const 0)
           (local.get $39)
          )
         )
         (local.set $41
          (local.get $39)
         )
         (local.set $42
          (i64.lt_u
           (local.get $38)
           (local.get $41)
          )
         )
         (local.set $43
          (i32.and
           (local.get $40)
           (local.get $42)
          )
         )
        )
        (if
         (local.get $43)
         (block
          (block
           (local.set $44
            (array.get_u $2
             (struct.get $3 0
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
           (local.set $45
            (i64.add
             (local.get $13)
             (i64.const 1)
            )
           )
           (local.set $14
            (i32.const 0)
           )
           (local.set $15
            (local.get $44)
           )
           (local.set $16
            (local.get $45)
           )
          )
          (block
           (br $block$13$break)
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
           (br $block$13$break)
          )
         )
        )
       )
       (block
        (block $block$16$break
         (block
         )
         (if
          (local.get $14)
          (block
           (local.set $22
            (local.get $17)
           )
           (block
            (br $block$16$break)
           )
          )
          (block
           (block
            (local.set $46
             (i64.add
              (local.get $12)
              (i64.const 1)
             )
            )
            (local.set $18
             (local.get $16)
            )
            (local.set $19
             (local.get $46)
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
            (br $block$16$break)
           )
          )
         )
        )
        (block
         (block $block$17$break
          (local.set $47
           (i32.and
            (i32.xor
             (local.get $22)
             (i32.const -1)
            )
            (i32.const 1)
           )
          )
          (if
           (local.get $47)
           (br $block$17$break)
           (br $block$18$break)
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
           (br $shape$10$continue)
          )
         )
        )
       )
      )
      (br $block$18$break)
     )
    )
    (block
     (return
      (local.get $25)
     )
    )
   )
  )
 )
 (func $julia_JSStringString (type $47) (param $0 (ref null $3)) (result (ref null $22))
  (local $1 (ref null $3))
  (local $2 externref)
  (local $3 externref)
  (local $4 (ref null $22))
  (block
   (local.set $1
    (local.get $0)
   )
   (local.set $2
    (call $julia_objectVector_UInt8_
     (local.get $1)
    )
   )
   (local.set $3
    (call $_x______new_TextDecoder____decode_x_ExternrefExternref
     (local.get $2)
    )
   )
   (local.set $4
    (struct.new $22
     (local.get $3)
    )
   )
   (return
    (local.get $4)
   )
  )
 )
 (func $julia_objectString (type $40) (param $0 (ref null $3)) (result externref)
  (local $1 (ref null $22))
  (local $2 externref)
  (block
   (local.set $1
    (call $julia_JSStringString
     (local.get $0)
    )
   )
   (local.set $2
    (struct.get $22 0
     (local.get $1)
    )
   )
   (return
    (local.get $2)
   )
  )
 )
 (func $julia_checked_trunc_sintType_Int32_Int64 (type $42) (param $0 i64) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (block $block$4$break
   (block
    (local.set $1
     (i32.wrap_i64
      (local.get $0)
     )
    )
    (local.set $2
     (i64.extend_i32_s
      (local.get $1)
     )
    )
    (local.set $3
     (i64.eq
      (local.get $0)
      (local.get $2)
     )
    )
   )
   (block
    (br $block$4$break)
   )
  )
  (block
   (return
    (local.get $1)
   )
  )
 )
 (func $julia_toInt32Int64 (type $42) (param $0 i64) (result i32)
  (local $1 i32)
  (block
   (local.set $1
    (call $julia_checked_trunc_sintType_Int32_Int64
     (local.get $0)
    )
   )
   (return
    (local.get $1)
   )
  )
 )
 (func $julia_append_Vector_Any_Vector_Any_ (type $49) (param $0 (ref null $1)) (param $1 (ref null $1)) (result (ref null $1))
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 externref)
  (local $9 i64)
  (local $10 (ref null $0))
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  (local $16 i32)
  (local $17 (ref null $1))
  (block $block$4$break
   (block
    (local.set $2
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $1)
      )
     )
    )
    (local.set $3
     (i64.lt_s
      (local.get $2)
      (i64.const 0)
     )
    )
    (local.set $4
     (if (result i64)
      (local.get $3)
      (i64.const 0)
      (local.get $2)
     )
    )
    (local.set $5
     (i64.shr_u
      (local.get $4)
      (i64.const 63)
     )
    )
    (local.set $6
     (i32.wrap_i64
      (local.get $5)
     )
    )
    (local.set $7
     (i32.eq
      (local.get $6)
      (i32.const 1)
     )
    )
   )
   (if
    (local.get $7)
    (block
     (block
      (local.set $8
       (call $julia_objectString
        (struct.new $3
         (array.new_fixed $2 18
          (i32.const 73)
          (i32.const 110)
          (i32.const 101)
          (i32.const 120)
          (i32.const 97)
          (i32.const 99)
          (i32.const 116)
          (i32.const 32)
          (i32.const 99)
          (i32.const 111)
          (i32.const 110)
          (i32.const 118)
          (i32.const 101)
          (i32.const 114)
          (i32.const 115)
          (i32.const 105)
          (i32.const 111)
          (i32.const 110)
         )
         (i32.const 18)
        )
       )
      )
      (call $_x_____console_log_x_NothingExternref
       (local.get $8)
      )
     )
     (block
      (br $block$4$break)
     )
    )
    (br $block$4$break)
   )
  )
  (block
   (block $block$8$break
    (local.set $9
     (local.get $4)
    )
    (block
     (br $block$8$break)
    )
   )
   (block
    (block
     (block
      (if
       (i32.le_u
        (struct.get $1 1
         (local.get $0)
        )
        (i32.add
         (struct.get $1 1
          (local.get $0)
         )
         (i32.wrap_i64
          (local.get $9)
         )
        )
       )
       (block $newbuff
        (local.set $10
         (array.new $0
          (struct.new $31
           (i64.const 0)
          )
          (i32.mul
           (i32.add
            (struct.get $1 1
             (local.get $0)
            )
            (i32.wrap_i64
             (local.get $9)
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
          (local.get $0)
         )
         (i32.wrap_i64
          (i64.const 0)
         )
         (struct.get $1 1
          (local.get $0)
         )
        )
        (struct.set $1 0
         (local.get $0)
         (local.get $10)
        )
       )
      )
      (struct.set $1 1
       (local.get $0)
       (i32.add
        (struct.get $1 1
         (local.get $0)
        )
        (i32.wrap_i64
         (local.get $9)
        )
       )
      )
     )
     (block
      (local.set $11
       (i64.extend_i32_u
        (struct.get $1 1
         (local.get $0)
        )
       )
      )
      (local.set $12
       (i64.sub
        (local.get $11)
        (local.get $4)
       )
      )
      (local.set $13
       (i64.add
        (local.get $12)
        (i64.const 1)
       )
      )
      (local.set $14
       (i64.sub
        (local.get $13)
        (i64.const 1)
       )
      )
      (local.set $15
       (call $julia_toInt32Int64
        (local.get $14)
       )
      )
      (local.set $16
       (call $julia_toInt32Int64
        (local.get $4)
       )
      )
      (array.copy $0 $0
       (struct.get $1 0
        (local.get $0)
       )
       (local.get $15)
       (struct.get $1 0
        (local.get $1)
       )
       (i32.const 0)
       (local.get $16)
      )
      (local.set $17
       (local.get $0)
      )
      (return
       (local.get $0)
      )
     )
    )
   )
  )
 )
 (func $julia_objectVector_Any_ (type $53) (param $0 (ref null $1)) (result externref)
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
  (local $25 externref)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 i32)
  (local $30 i64)
  (local $31 i32)
  (local $32 i32)
  (local $33 eqref)
  (local $34 i64)
  (local $35 i32)
  (local $36 i32)
  (local $37 i32)
  (local $38 (ref null $25))
  (local $39 f64)
  (local $40 i32)
  (local $41 i32)
  (local $42 (ref null $33))
  (local $43 f32)
  (local $44 i32)
  (local $45 i32)
  (local $46 (ref null $27))
  (local $47 i32)
  (local $48 i32)
  (local $49 i32)
  (local $50 (ref null $21))
  (local $51 (ref null $3))
  (local $52 (ref null $22))
  (local $53 externref)
  (local $54 i32)
  (local $55 i32)
  (local $56 (ref null $34))
  (local $57 (ref null $22))
  (local $58 externref)
  (local $59 i32)
  (local $60 i32)
  (local $61 (ref null $35))
  (local $62 i64)
  (local $63 i32)
  (local $64 i32)
  (local $65 i32)
  (local $66 (ref null $27))
  (local $67 i32)
  (local $68 i32)
  (local $69 i32)
  (local $70 (ref null $1))
  (local $71 externref)
  (local $72 i32)
  (local $73 i64)
  (local $74 i64)
  (local $75 i64)
  (local $76 i32)
  (local $77 i64)
  (local $78 i32)
  (local $79 i32)
  (local $80 eqref)
  (local $81 i64)
  (local $82 i64)
  (local $83 i32)
  (block $block$5$break
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
     (call $n____Array_n_ExternrefInt32
      (local.get $24)
     )
    )
    (local.set $26
     (i64.const 1)
    )
    (local.set $27
     (i64.sub
      (local.get $26)
      (i64.const 1)
     )
    )
    (local.set $28
     (i64.extend_i32_u
      (struct.get $1 1
       (local.get $0)
      )
     )
    )
    (local.set $29
     (i64.le_s
      (i64.const 0)
      (local.get $28)
     )
    )
    (local.set $30
     (local.get $28)
    )
    (local.set $31
     (i64.lt_u
      (local.get $27)
      (local.get $30)
     )
    )
    (local.set $32
     (i32.and
      (local.get $29)
      (local.get $31)
     )
    )
   )
   (if
    (local.get $32)
    (block
     (block
      (local.set $33
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
      (local.set $34
       (i64.add
        (i64.const 1)
        (i64.const 1)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $2
       (local.get $33)
      )
      (local.set $3
       (local.get $34)
      )
     )
     (block
      (br $block$5$break)
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
      (br $block$5$break)
     )
    )
   )
  )
  (block
   (block $block$9$break
    (block
    )
    (if
     (local.get $1)
     (block
      (local.set $5
       (local.get $4)
      )
      (block
       (br $block$9$break)
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
       (br $block$9$break)
      )
     )
    )
   )
   (block
    (block $block$34$break
     (block
      (local.set $35
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
      (local.get $35)
      (loop $shape$10$continue
       (block $block$26$break
        (block
         (local.set $36
          (i32.wrap_i64
           (local.get $10)
          )
         )
         (local.set $37
          (ref.test (ref null $25)
           (local.get $11)
          )
         )
        )
        (if
         (local.get $37)
         (block
          (block
           (local.set $38
            (ref.cast (ref null $25)
             (local.get $11)
            )
           )
           (local.set $39
            (struct.get $25 0
             (local.get $38)
            )
           )
           (local.set $40
            (i32.sub
             (local.get $36)
             (i32.const 1)
            )
           )
           (call $_v__i__x_____v_i____xNothingExternrefInt32Float64
            (local.get $25)
            (local.get $40)
            (local.get $39)
           )
          )
          (block
           (br $block$26$break)
          )
         )
         (block
          (block $block$14$break
           (local.set $41
            (ref.test (ref null $33)
             (local.get $11)
            )
           )
           (if
            (local.get $41)
            (block
             (block
              (local.set $42
               (ref.cast (ref null $33)
                (local.get $11)
               )
              )
              (local.set $43
               (struct.get $33 0
                (local.get $42)
               )
              )
              (local.set $44
               (i32.sub
                (local.get $36)
                (i32.const 1)
               )
              )
              (call $_v__i__x_____v_i____xNothingExternrefInt32Float32
               (local.get $25)
               (local.get $44)
               (local.get $43)
              )
             )
             (block
              (br $block$26$break)
             )
            )
            (br $block$14$break)
           )
          )
          (block
           (block $block$16$break
            (local.set $45
             (ref.test (ref null $27)
              (local.get $11)
             )
            )
            (if
             (local.get $45)
             (block
              (block
               (local.set $46
                (ref.cast (ref null $27)
                 (local.get $11)
                )
               )
               (local.set $47
                (struct.get $27 0
                 (local.get $46)
                )
               )
               (local.set $48
                (i32.sub
                 (local.get $36)
                 (i32.const 1)
                )
               )
               (call $_v__i__x_____v_i____xNothingExternrefInt32Int32
                (local.get $25)
                (local.get $48)
                (local.get $47)
               )
              )
              (block
               (br $block$26$break)
              )
             )
             (br $block$16$break)
            )
           )
           (block
            (block $block$18$break
             (local.set $49
              (ref.test (ref null $21)
               (local.get $11)
              )
             )
             (if
              (local.get $49)
              (block
               (block
                (local.set $50
                 (ref.cast (ref null $21)
                  (local.get $11)
                 )
                )
                (local.set $51
                 (struct.get $21 0
                  (local.get $50)
                 )
                )
                (local.set $52
                 (call $julia_JSStringString
                  (local.get $51)
                 )
                )
                (local.set $53
                 (struct.get $22 0
                  (local.get $52)
                 )
                )
                (local.set $54
                 (i32.sub
                  (local.get $36)
                  (i32.const 1)
                 )
                )
                (call $_v__i__x_____v_i____xNothingExternrefInt32Externref
                 (local.get $25)
                 (local.get $54)
                 (local.get $53)
                )
               )
               (block
                (br $block$26$break)
               )
              )
              (br $block$18$break)
             )
            )
            (block
             (block $block$20$break
              (local.set $55
               (ref.test (ref null $34)
                (local.get $11)
               )
              )
              (if
               (local.get $55)
               (block
                (block
                 (local.set $56
                  (ref.cast (ref null $34)
                   (local.get $11)
                  )
                 )
                 (local.set $57
                  (struct.get $34 0
                   (local.get $56)
                  )
                 )
                 (local.set $58
                  (struct.get $22 0
                   (local.get $57)
                  )
                 )
                 (local.set $59
                  (i32.sub
                   (local.get $36)
                   (i32.const 1)
                  )
                 )
                 (call $_v__i__x_____v_i____xNothingExternrefInt32Externref
                  (local.get $25)
                  (local.get $59)
                  (local.get $58)
                 )
                )
                (block
                 (br $block$26$break)
                )
               )
               (br $block$20$break)
              )
             )
             (block
              (block $block$22$break
               (local.set $60
                (ref.test (ref null $35)
                 (local.get $11)
                )
               )
               (if
                (local.get $60)
                (block
                 (block
                  (local.set $61
                   (ref.cast (ref null $35)
                    (local.get $11)
                   )
                  )
                  (local.set $62
                   (struct.get $35 0
                    (local.get $61)
                   )
                  )
                  (local.set $63
                   (i32.wrap_i64
                    (local.get $62)
                   )
                  )
                  (local.set $64
                   (i32.sub
                    (local.get $36)
                    (i32.const 1)
                   )
                  )
                  (call $_v__i__x_____v_i____xNothingExternrefInt32Int32
                   (local.get $25)
                   (local.get $64)
                   (local.get $63)
                  )
                 )
                 (block
                  (br $block$26$break)
                 )
                )
                (br $block$22$break)
               )
              )
              (block
               (block $block$24$break
                (local.set $65
                 (ref.test (ref null $27)
                  (local.get $11)
                 )
                )
                (if
                 (local.get $65)
                 (block
                  (block
                   (local.set $66
                    (ref.cast (ref null $27)
                     (local.get $11)
                    )
                   )
                   (local.set $67
                    (struct.get $27 0
                     (local.get $66)
                    )
                   )
                   (local.set $68
                    (i32.sub
                     (local.get $36)
                     (i32.const 1)
                    )
                   )
                   (call $_v__i__x_____v_i____xNothingExternrefInt32Bool
                    (local.get $25)
                    (local.get $68)
                    (local.get $67)
                   )
                  )
                  (block
                   (br $block$26$break)
                  )
                 )
                 (br $block$24$break)
                )
               )
               (block
                (block $block$25$break
                 (local.set $69
                  (ref.test (ref null $1)
                   (local.get $11)
                  )
                 )
                 (if
                  (local.get $69)
                  (br $block$25$break)
                  (br $block$26$break)
                 )
                )
                (block
                 (block
                  (local.set $70
                   (ref.cast (ref null $1)
                    (local.get $11)
                   )
                  )
                  (local.set $71
                   (call $julia_objectVector_Any_
                    (local.get $70)
                   )
                  )
                  (local.set $72
                   (i32.sub
                    (local.get $36)
                    (i32.const 1)
                   )
                  )
                  (call $_v__i__x_____v_i____xNothingExternrefInt32Externref
                   (local.get $25)
                   (local.get $72)
                   (local.get $71)
                  )
                 )
                 (block
                  (br $block$26$break)
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
       )
       (block
        (block $block$29$break
         (block
          (local.set $73
           (local.get $13)
          )
          (local.set $74
           (i64.sub
            (local.get $73)
            (i64.const 1)
           )
          )
          (local.set $75
           (i64.extend_i32_u
            (struct.get $1 1
             (local.get $0)
            )
           )
          )
          (local.set $76
           (i64.le_s
            (i64.const 0)
            (local.get $75)
           )
          )
          (local.set $77
           (local.get $75)
          )
          (local.set $78
           (i64.lt_u
            (local.get $74)
            (local.get $77)
           )
          )
          (local.set $79
           (i32.and
            (local.get $76)
            (local.get $78)
           )
          )
         )
         (if
          (local.get $79)
          (block
           (block
            (local.set $80
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
            (local.set $81
             (i64.add
              (local.get $13)
              (i64.const 1)
             )
            )
            (local.set $14
             (i32.const 0)
            )
            (local.set $15
             (local.get $80)
            )
            (local.set $16
             (local.get $81)
            )
           )
           (block
            (br $block$29$break)
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
            (br $block$29$break)
           )
          )
         )
        )
        (block
         (block $block$32$break
          (block
          )
          (if
           (local.get $14)
           (block
            (local.set $22
             (local.get $17)
            )
            (block
             (br $block$32$break)
            )
           )
           (block
            (block
             (local.set $82
              (i64.add
               (local.get $12)
               (i64.const 1)
              )
             )
             (local.set $18
              (local.get $16)
             )
             (local.set $19
              (local.get $82)
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
             (br $block$32$break)
            )
           )
          )
         )
         (block
          (block $block$33$break
           (local.set $83
            (i32.and
             (i32.xor
              (local.get $22)
              (i32.const -1)
             )
             (i32.const 1)
            )
           )
           (if
            (local.get $83)
            (br $block$33$break)
            (br $block$34$break)
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
            (br $shape$10$continue)
           )
          )
         )
        )
       )
      )
      (br $block$34$break)
     )
    )
    (block
     (return
      (local.get $25)
     )
    )
   )
  )
 )
 (func $julia_set_svgInt32Float64Float64Float64 (type $56) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  (local $16 (ref null $24))
  (local $17 i64)
  (local $18 i32)
  (local $19 (ref null $11))
  (local $20 (ref null $26))
  (local $21 (ref null $13))
  (local $22 f64)
  (local $23 (ref null $16))
  (local $24 i64)
  (local $25 i32)
  (local $26 (ref null $11))
  (local $27 (ref null $20))
  (local $28 (ref null $13))
  (local $29 f64)
  (local $30 (ref null $16))
  (local $31 i64)
  (local $32 i32)
  (local $33 (ref null $11))
  (local $34 (ref null $20))
  (local $35 (ref null $13))
  (local $36 (ref null $1))
  (local $37 i64)
  (local $38 i32)
  (local $39 i32)
  (local $40 i32)
  (local $41 f64)
  (local $42 f64)
  (local $43 (ref null $1))
  (local $44 i32)
  (local $45 i64)
  (local $46 i32)
  (local $47 (ref null $0))
  (local $48 i64)
  (local $49 externref)
  (local $50 (ref null $22))
  (local $51 externref)
  (local $52 externref)
  (local $53 (ref null $22))
  (local $54 externref)
  (local $55 externref)
  (block $block$4$break
   (block
    (local.set $16
     (struct.new $24
      (local.get $1)
      (local.get $2)
     )
    )
    (local.set $17
     (i64.extend_i32_s
      (local.get $0)
     )
    )
    (local.set $18
     (i64.le_s
      (i64.const 1)
      (local.get $17)
     )
    )
   )
   (if
    (local.get $18)
    (block
     (local.set $4
      (local.get $17)
     )
     (block
      (br $block$4$break)
     )
    )
    (block
     (local.set $4
      (i64.const 0)
     )
     (block
      (br $block$4$break)
     )
    )
   )
  )
  (block
   (block $block$7$break
    (local.set $19
     (struct.new $11
      (i64.const 1)
      (local.get $4)
     )
    )
    (block
     (br $block$7$break)
    )
   )
   (block
    (block $block$10$break
     (block
      (local.set $20
       (struct.new $26
        (local.get $16)
        (local.get $19)
       )
      )
      (local.set $21
       (call $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__2_5__Float64__Float64__
        (local.get $20)
       )
      )
      (local.set $22
       (f64.const 300)
      )
      (local.set $23
       (struct.new $16
        (local.get $21)
        (local.get $22)
       )
      )
      (local.set $24
       (i64.extend_i32_s
        (local.get $0)
       )
      )
      (local.set $25
       (i64.le_s
        (i64.const 1)
        (local.get $24)
       )
      )
     )
     (if
      (local.get $25)
      (block
       (local.set $5
        (local.get $24)
       )
       (block
        (br $block$10$break)
       )
      )
      (block
       (local.set $5
        (i64.const 0)
       )
       (block
        (br $block$10$break)
       )
      )
     )
    )
    (block
     (block $block$13$break
      (local.set $26
       (struct.new $11
        (i64.const 1)
        (local.get $5)
       )
      )
      (block
       (br $block$13$break)
      )
     )
     (block
      (block $block$16$break
       (block
        (local.set $27
         (struct.new $20
          (local.get $23)
          (local.get $26)
         )
        )
        (local.set $28
         (call $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__
          (local.get $27)
         )
        )
        (local.set $29
         (f64.const 900)
        )
        (local.set $30
         (struct.new $16
          (local.get $21)
          (local.get $29)
         )
        )
        (local.set $31
         (i64.extend_i32_s
          (local.get $0)
         )
        )
        (local.set $32
         (i64.le_s
          (i64.const 1)
          (local.get $31)
         )
        )
       )
       (if
        (local.get $32)
        (block
         (local.set $6
          (local.get $31)
         )
         (block
          (br $block$16$break)
         )
        )
        (block
         (local.set $6
          (i64.const 0)
         )
         (block
          (br $block$16$break)
         )
        )
       )
      )
      (block
       (block $block$19$break
        (local.set $33
         (struct.new $11
          (i64.const 1)
          (local.get $6)
         )
        )
        (block
         (br $block$19$break)
        )
       )
       (block
        (block $block$25$break
         (block
          (local.set $34
           (struct.new $20
            (local.get $30)
            (local.get $33)
           )
          )
          (local.set $35
           (call $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__4_7__Vector_Float64___Float64__
            (local.get $34)
           )
          )
          (local.set $36
           (struct.new $1
            (array.new $0
             (struct.new $31
              (i64.const 0)
             )
             (i32.wrap_i64
              (i64.const 5)
             )
            )
            (i32.wrap_i64
             (i64.const 5)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $36)
           )
           (i32.add
            (i32.wrap_i64
             (i64.const 1)
            )
            (i32.const -1)
           )
           (struct.new $21
            (struct.new $3
             (array.new_fixed $2 11
              (i32.const 60)
              (i32.const 115)
              (i32.const 118)
              (i32.const 103)
              (i32.const 32)
              (i32.const 119)
              (i32.const 105)
              (i32.const 100)
              (i32.const 116)
              (i32.const 104)
              (i32.const 61)
             )
             (i32.const 11)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $36)
           )
           (i32.add
            (i32.wrap_i64
             (i64.const 2)
            )
            (i32.const -1)
           )
           (struct.new $25
            (f64.const 900)
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $36)
           )
           (i32.add
            (i32.wrap_i64
             (i64.const 3)
            )
            (i32.const -1)
           )
           (struct.new $21
            (struct.new $3
             (array.new_fixed $2 8
              (i32.const 32)
              (i32.const 104)
              (i32.const 101)
              (i32.const 105)
              (i32.const 103)
              (i32.const 104)
              (i32.const 116)
              (i32.const 61)
             )
             (i32.const 8)
            )
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $36)
           )
           (i32.add
            (i32.wrap_i64
             (i64.const 4)
            )
            (i32.const -1)
           )
           (struct.new $25
            (f64.const 300)
           )
          )
          (array.set $0
           (struct.get $1 0
            (local.get $36)
           )
           (i32.add
            (i32.wrap_i64
             (i64.const 5)
            )
            (i32.const -1)
           )
           (struct.new $21
            (struct.new $3
             (array.new_fixed $2 5
              (i32.const 32)
              (i32.const 62)
              (i32.const 60)
              (i32.const 103)
              (i32.const 62)
             )
             (i32.const 5)
            )
           )
          )
          (local.set $37
           (i64.extend_i32_s
            (local.get $0)
           )
          )
          (local.set $38
           (i64.le_s
            (i64.const 1)
            (local.get $37)
           )
          )
         )
         (if
          (local.get $38)
          (block
           (local.set $7
            (local.get $37)
           )
           (block
            (br $block$25$break)
           )
          )
          (block
           (local.set $7
            (i64.const 0)
           )
           (block
            (br $block$25$break)
           )
          )
         )
        )
        (block
         (block $block$28$break
          (local.set $39
           (i64.lt_s
            (local.get $7)
            (i64.const 1)
           )
          )
          (if
           (local.get $39)
           (block
            (local.set $8
             (i32.const 1)
            )
            (block
             (br $block$28$break)
            )
           )
           (block
            (block
             (local.set $8
              (i32.const 0)
             )
             (local.set $9
              (i64.const 1)
             )
             (local.set $10
              (i64.const 1)
             )
            )
            (block
             (br $block$28$break)
            )
           )
          )
         )
         (block
          (block $block$34$break
           (block
            (local.set $40
             (i32.and
              (i32.xor
               (local.get $8)
               (i32.const -1)
              )
              (i32.const 1)
             )
            )
            (local.set $11
             (local.get $9)
            )
            (local.set $12
             (local.get $10)
            )
           )
           (if
            (local.get $40)
            (loop $shape$25$continue
             (block $block$32$break
              (block
               (local.set $41
                (array.get $12
                 (struct.get $13 0
                  (local.get $35)
                 )
                 (i32.add
                  (i32.wrap_i64
                   (local.get $11)
                  )
                  (i32.const -1)
                 )
                )
               )
               (local.set $42
                (array.get $12
                 (struct.get $13 0
                  (local.get $28)
                 )
                 (i32.add
                  (i32.wrap_i64
                   (local.get $11)
                  )
                  (i32.const -1)
                 )
                )
               )
               (local.set $43
                (call $julia_circFloat64Float64Float64Int64
                 (local.get $41)
                 (local.get $42)
                 (local.get $3)
                 (local.get $11)
                )
               )
               (drop
                (call $julia_append_Vector_Any_Vector_Any_
                 (local.get $36)
                 (local.get $43)
                )
               )
               (local.set $44
                (i64.eq
                 (local.get $12)
                 (local.get $7)
                )
               )
              )
              (if
               (local.get $44)
               (block
                (local.set $15
                 (i32.const 1)
                )
                (block
                 (br $block$32$break)
                )
               )
               (block
                (block
                 (local.set $45
                  (i64.add
                   (local.get $12)
                   (i64.const 1)
                  )
                 )
                 (local.set $13
                  (local.get $45)
                 )
                 (local.set $14
                  (local.get $45)
                 )
                 (local.set $15
                  (i32.const 0)
                 )
                )
                (block
                 (br $block$32$break)
                )
               )
              )
             )
             (block
              (block $block$33$break
               (local.set $46
                (i32.and
                 (i32.xor
                  (local.get $15)
                  (i32.const -1)
                 )
                 (i32.const 1)
                )
               )
               (if
                (local.get $46)
                (br $block$33$break)
                (br $block$34$break)
               )
              )
              (block
               (block
                (local.set $11
                 (local.get $13)
                )
                (local.set $12
                 (local.get $14)
                )
               )
               (block
                (br $shape$25$continue)
               )
              )
             )
            )
            (br $block$34$break)
           )
          )
          (block
           (block
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
             (block $newbuff
              (local.set $47
               (array.new $0
                (struct.new $31
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
               (local.get $47)
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
               (local.get $47)
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
            (local.set $48
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
               (local.get $48)
              )
              (i32.const -1)
             )
             (struct.new $21
              (struct.new $3
               (array.new_fixed $2 10
                (i32.const 60)
                (i32.const 47)
                (i32.const 103)
                (i32.const 62)
                (i32.const 60)
                (i32.const 47)
                (i32.const 115)
                (i32.const 118)
                (i32.const 103)
                (i32.const 62)
               )
               (i32.const 10)
              )
             )
            )
            (local.set $49
             (call $julia_objectVector_Any_
              (local.get $36)
             )
            )
            (local.set $50
             (call $julia_JSStringString
              (struct.new $3
               (array.new_fixed $2 0)
               (i32.const 0)
              )
             )
            )
            (local.set $51
             (struct.get $22 0
              (local.get $50)
             )
            )
            (local.set $52
             (call $_x_sep_____x_join_sep_ExternrefExternrefExternref
              (local.get $49)
              (local.get $51)
             )
            )
            (local.set $53
             (call $julia_JSStringString
              (struct.new $3
               (array.new_fixed $2 4
                (i32.const 112)
                (i32.const 108)
                (i32.const 111)
                (i32.const 116)
               )
               (i32.const 4)
              )
             )
            )
            (local.set $54
             (struct.get $22 0
              (local.get $53)
             )
            )
            (local.set $55
             (call $_x_____document_getElementById_x_ExternrefExternref
              (local.get $54)
             )
            )
            (call $_x__str_____x_innerHTML___strNothingExternrefExternref
             (local.get $55)
             (local.get $52)
            )
            (return)
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
 )
 (func $nsamples (type $57) (param $0 i32) (result i32)
  (local $1 (ref null $14))
  (local $2 (ref null $19))
  (local $3 (ref null $18))
  (local $4 (ref null $15))
  (local $5 (ref null $14))
  (local $6 (ref null $10))
  (local $7 (ref null $10))
  (local $8 (ref null $10))
  (local $9 i32)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (block
   (local.set $1
    (struct.get $30 0
     (global.get $g5284476463869129866)
    )
   )
   (struct.set $14 4
    (local.get $1)
    (local.get $0)
   )
   (local.set $2
    (struct.get $30 1
     (global.get $g5284476463869129866)
    )
   )
   (local.set $3
    (array.get $19
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
    (struct.get $18 1
     (local.get $3)
    )
   )
   (local.set $5
    (struct.get $15 0
     (local.get $4)
    )
   )
   (local.set $6
    (struct.get $15 1
     (local.get $4)
    )
   )
   (local.set $7
    (struct.get $15 2
     (local.get $4)
    )
   )
   (local.set $8
    (struct.get $15 3
     (local.get $4)
    )
   )
   (local.set $9
    (struct.get $14 4
     (local.get $5)
    )
   )
   (local.set $10
    (struct.get $10 4
     (local.get $6)
    )
   )
   (local.set $11
    (struct.get $10 4
     (local.get $7)
    )
   )
   (local.set $12
    (struct.get $10 4
     (local.get $8)
    )
   )
   (call $julia_set_svgInt32Float64Float64Float64
    (local.get $9)
    (local.get $10)
    (local.get $11)
    (local.get $12)
   )
   (return
    (i32.const 0)
   )
  )
 )
 (func $sample_step (type $36) (param $0 f64) (result i32)
  (local $1 (ref null $10))
  (local $2 (ref null $19))
  (local $3 (ref null $18))
  (local $4 (ref null $15))
  (local $5 (ref null $14))
  (local $6 (ref null $10))
  (local $7 (ref null $10))
  (local $8 (ref null $10))
  (local $9 i32)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (block
   (local.set $1
    (struct.get $23 0
     (global.get $g2421260343062419193)
    )
   )
   (struct.set $10 4
    (local.get $1)
    (local.get $0)
   )
   (local.set $2
    (struct.get $23 1
     (global.get $g2421260343062419193)
    )
   )
   (local.set $3
    (array.get $19
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
    (struct.get $18 1
     (local.get $3)
    )
   )
   (local.set $5
    (struct.get $15 0
     (local.get $4)
    )
   )
   (local.set $6
    (struct.get $15 1
     (local.get $4)
    )
   )
   (local.set $7
    (struct.get $15 2
     (local.get $4)
    )
   )
   (local.set $8
    (struct.get $15 3
     (local.get $4)
    )
   )
   (local.set $9
    (struct.get $14 4
     (local.get $5)
    )
   )
   (local.set $10
    (struct.get $10 4
     (local.get $6)
    )
   )
   (local.set $11
    (struct.get $10 4
     (local.get $7)
    )
   )
   (local.set $12
    (struct.get $10 4
     (local.get $8)
    )
   )
   (call $julia_set_svgInt32Float64Float64Float64
    (local.get $9)
    (local.get $10)
    (local.get $11)
    (local.get $12)
   )
   (return
    (i32.const 0)
   )
  )
 )
 (func $phase (type $36) (param $0 f64) (result i32)
  (local $1 (ref null $10))
  (local $2 (ref null $19))
  (local $3 (ref null $18))
  (local $4 (ref null $15))
  (local $5 (ref null $14))
  (local $6 (ref null $10))
  (local $7 (ref null $10))
  (local $8 (ref null $10))
  (local $9 i32)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (block
   (local.set $1
    (struct.get $23 0
     (global.get $g7816210575597790628)
    )
   )
   (struct.set $10 4
    (local.get $1)
    (local.get $0)
   )
   (local.set $2
    (struct.get $23 1
     (global.get $g7816210575597790628)
    )
   )
   (local.set $3
    (array.get $19
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
    (struct.get $18 1
     (local.get $3)
    )
   )
   (local.set $5
    (struct.get $15 0
     (local.get $4)
    )
   )
   (local.set $6
    (struct.get $15 1
     (local.get $4)
    )
   )
   (local.set $7
    (struct.get $15 2
     (local.get $4)
    )
   )
   (local.set $8
    (struct.get $15 3
     (local.get $4)
    )
   )
   (local.set $9
    (struct.get $14 4
     (local.get $5)
    )
   )
   (local.set $10
    (struct.get $10 4
     (local.get $6)
    )
   )
   (local.set $11
    (struct.get $10 4
     (local.get $7)
    )
   )
   (local.set $12
    (struct.get $10 4
     (local.get $8)
    )
   )
   (call $julia_set_svgInt32Float64Float64Float64
    (local.get $9)
    (local.get $10)
    (local.get $11)
    (local.get $12)
   )
   (return
    (i32.const 0)
   )
  )
 )
 (func $radii (type $36) (param $0 f64) (result i32)
  (local $1 (ref null $10))
  (local $2 (ref null $19))
  (local $3 (ref null $18))
  (local $4 (ref null $15))
  (local $5 (ref null $14))
  (local $6 (ref null $10))
  (local $7 (ref null $10))
  (local $8 (ref null $10))
  (local $9 i32)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (block
   (local.set $1
    (struct.get $23 0
     (global.get $g18347801754573464288)
    )
   )
   (struct.set $10 4
    (local.get $1)
    (local.get $0)
   )
   (local.set $2
    (struct.get $23 1
     (global.get $g18347801754573464288)
    )
   )
   (local.set $3
    (array.get $19
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
    (struct.get $18 1
     (local.get $3)
    )
   )
   (local.set $5
    (struct.get $15 0
     (local.get $4)
    )
   )
   (local.set $6
    (struct.get $15 1
     (local.get $4)
    )
   )
   (local.set $7
    (struct.get $15 2
     (local.get $4)
    )
   )
   (local.set $8
    (struct.get $15 3
     (local.get $4)
    )
   )
   (local.set $9
    (struct.get $14 4
     (local.get $5)
    )
   )
   (local.set $10
    (struct.get $10 4
     (local.get $6)
    )
   )
   (local.set $11
    (struct.get $10 4
     (local.get $7)
    )
   )
   (local.set $12
    (struct.get $10 4
     (local.get $8)
    )
   )
   (call $julia_set_svgInt32Float64Float64Float64
    (local.get $9)
    (local.get $10)
    (local.get $11)
    (local.get $12)
   )
   (return
    (i32.const 0)
   )
  )
 )
)
