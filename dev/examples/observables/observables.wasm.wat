(module
 (type $0 (array (mut eqref)))
 (type $1 (struct (field (mut (ref null $0))) (field (mut i32))))
 (type $2 (array (mut stringref)))
 (type $3 (struct (field (mut (ref null $2))) (field (mut i32))))
 (type $4 (struct (field i64) (field eqref)))
 (type $5 (array (mut (ref null $4))))
 (type $6 (struct (field (mut (ref null $5))) (field (mut i32))))
 (type $7 (struct (field (mut (ref null $6))) (field (mut (ref null $1))) (field (mut i32)) (field (mut f64))))
 (type $8 (struct (field i64) (field i64)))
 (type $9 (struct (field stringref)))
 (type $10 (array (mut f64)))
 (type $11 (struct (field (mut (ref null $10))) (field (mut i32))))
 (type $12 (struct (field (mut i64))))
 (type $13 (struct ))
 (type $14 (struct (field stringref) (field (ref null $13)) (field (ref null $3))))
 (type $15 (struct (field (ref null $11)) (field f64)))
 (type $16 (struct (field (mut (ref null $6))) (field (mut (ref null $1))) (field (mut i32)) (field (mut i64))))
 (type $17 (struct (field f64) (field f64)))
 (type $18 (struct (field (ref null $15)) (field (ref null $8))))
 (type $19 (struct (field (ref null $7)) (field (ref null $13))))
 (type $20 (struct (field f64)))
 (type $21 (struct (field stringref) (field (ref null $17)) (field (ref null $3))))
 (type $22 (struct (field (ref null $17)) (field (ref null $8))))
 (type $23 (struct (field i32)))
 (type $24 (struct (field (ref null $16)) (field (ref null $13))))
 (type $25 (array stringref))
 (type $26 (struct (field i64)))
 (type $27 (array (ref null $14)))
 (type $28 (struct (field (ref null $17)) (field (ref null $25))))
 (type $29 (func (param f64) (result i32)))
 (type $30 (struct (field (ref null $16)) (field (ref null $7)) (field (ref null $7)) (field (ref null $7))))
 (type $31 (struct (field eqref) (field eqref)))
 (type $32 (func (param (ref null $18)) (result (ref null $11))))
 (type $33 (func (param externref i32 i32)))
 (type $34 (array i32))
 (type $35 (struct (field (ref null $13)) (field (ref null $34))))
 (type $36 (func (param stringref) (result i64)))
 (type $37 (func (param stringref stringref) (result i32)))
 (type $38 (func (param (ref null $22)) (result (ref null $11))))
 (type $39 (func (param f64) (result f64)))
 (type $40 (func (param (ref null $11) (ref null $18) i64 i64) (result (ref null $11))))
 (type $41 (func (param stringref)))
 (type $42 (func (param i32) (result externref)))
 (type $43 (func (param externref i32 f64)))
 (type $44 (func (param externref i32 stringref)))
 (type $45 (func (param externref i32 externref)))
 (type $46 (func (param (ref null $1)) (result externref)))
 (type $47 (func (param externref) (result stringref)))
 (type $48 (func (param f64 f64 f64 i64) (result stringref)))
 (type $49 (func (param (ref null $35) (ref null $14) (ref null $25)) (result (ref null $14))))
 (type $50 (func (param (ref null $14)) (result stringref)))
 (type $51 (func (param (ref null $28) (ref null $14) (ref null $27)) (result (ref null $21))))
 (type $52 (func (param (ref null $21)) (result stringref)))
 (type $53 (func (param stringref) (result externref)))
 (type $54 (func (param externref stringref)))
 (type $55 (func (param i64 f64 f64 f64)))
 (type $56 (func (param i64) (result i32)))
 (import "js" "(x) => Math.sin(x)" (func $_x_____Math_sin_x_Float64Float64 (type $39) (param f64) (result f64)))
 (import "js" "x => console.log(x)" (func $x____console_log_x_NothingString (type $41) (param stringref)))
 (import "js" "n => Array(n)" (func $n____Array_n_ExternrefInt32 (type $42) (param i32) (result externref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Float64 (type $43) (param externref i32 f64)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Int32 (type $33) (param externref i32 i32)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32String (type $44) (param externref i32 stringref)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Bool (type $33) (param externref i32 i32)))
 (import "js" "(v, i, x) => v[i] = x" (func $_v__i__x_____v_i____xNothingExternrefInt32Externref (type $45) (param externref i32 externref)))
 (import "js" "(x) => x.join("")" (func $_x_____x_join____StringExternref (type $47) (param externref) (result stringref)))
 (import "js" "(x) => document.getElementById(x)" (func $_x_____document_getElementById_x_ExternrefString (type $53) (param stringref) (result externref)))
 (import "js" "(x, str) => x.innerHTML = str" (func $_x__str_____x_innerHTML___strNothingExternrefString (type $54) (param externref stringref)))
 (global $g18446744070324125971 (ref null $13) (struct.new_default $13))
 (global $g15449656614644359769 (ref null $16) (struct.new $16
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $1
   (array.new_fixed $0 0)
   (i32.const 0)
  )
  (i32.const 0)
  (i64.const 0)
 ))
 (global $g14634224069119460151 (ref null $7) (struct.new $7
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $1
   (array.new_fixed $0 0)
   (i32.const 0)
  )
  (i32.const 0)
  (f64.const 0)
 ))
 (global $g7506304536989855276 (ref null $7) (struct.new $7
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $1
   (array.new_fixed $0 0)
   (i32.const 0)
  )
  (i32.const 0)
  (f64.const 0)
 ))
 (global $g6291794793257401476 (ref null $7) (struct.new $7
  (struct.new $6
   (array.new_fixed $5 0)
   (i32.const 0)
  )
  (struct.new $1
   (array.new_fixed $0 0)
   (i32.const 0)
  )
  (i32.const 0)
  (f64.const 0)
 ))
 (global $g11920047919215398543 (ref null $30) (struct.new $30
  (global.get $g15449656614644359769)
  (global.get $g14634224069119460151)
  (global.get $g7506304536989855276)
  (global.get $g6291794793257401476)
 ))
 (global $g2354498588059205908 (ref null $31) (struct.new $31
  (global.get $g18446744070324125971)
  (global.get $g11920047919215398543)
 ))
 (global $g11897876815793182784 (ref null $4) (struct.new $4
  (i64.const 0)
  (global.get $g2354498588059205908)
 ))
 (global $g5129321006894646915 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g11897876815793182784)
  )
  (i32.const 1)
 ))
 (global $g18235820581163160140 (ref null $1) (struct.new $1
  (array.new_fixed $0 0)
  (i32.const 0)
 ))
 (global $g2545347053408308794 (ref null $7) (struct.new $7
  (global.get $g5129321006894646915)
  (global.get $g18235820581163160140)
  (i32.const 0)
  (f64.const 10)
 ))
 (global $g3150250344273499479 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g11897876815793182784)
  )
  (i32.const 1)
 ))
 (global $g2167236435495776197 (ref null $1) (struct.new $1
  (array.new_fixed $0 0)
  (i32.const 0)
 ))
 (global $g5485395554225102703 (ref null $7) (struct.new $7
  (global.get $g3150250344273499479)
  (global.get $g2167236435495776197)
  (i32.const 0)
  (f64.const 0)
 ))
 (global $g14087156486532758258 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g11897876815793182784)
  )
  (i32.const 1)
 ))
 (global $g6241082678647144550 (ref null $1) (struct.new $1
  (array.new_fixed $0 0)
  (i32.const 0)
 ))
 (global $g12269743818889197448 (ref null $7) (struct.new $7
  (global.get $g14087156486532758258)
  (global.get $g6241082678647144550)
  (i32.const 0)
  (f64.const 0.1)
 ))
 (global $g9199137572315663203 (ref null $6) (struct.new $6
  (array.new_fixed $5 1
   (global.get $g11897876815793182784)
  )
  (i32.const 1)
 ))
 (global $g3932790553540514220 (ref null $1) (struct.new $1
  (array.new_fixed $0 0)
  (i32.const 0)
 ))
 (global $g1246607517337572990 (ref null $16) (struct.new $16
  (global.get $g9199137572315663203)
  (global.get $g3932790553540514220)
  (i32.const 0)
  (i64.const 100)
 ))
 (global $g18446744070808784190 (ref null $13) (struct.new_default $13))
 (global $g8054646434958260984 (ref null $24) (struct.new $24
  (global.get $g1246607517337572990)
  (global.get $g18446744070808784190)
 ))
 (global $g11364165201186046862 stringref (string.const "black"))
 (global $g7856110131526212985 stringref (string.const "gray"))
 (global $g2516736808186709465 stringref (string.const "silver"))
 (global $g13588353848275122834 stringref (string.const "maroon"))
 (global $g1858869381885086697 stringref (string.const "red"))
 (global $g572418428893749895 stringref (string.const "olive"))
 (global $g10253189802433390380 stringref (string.const "yellow"))
 (global $g10612655753838867627 stringref (string.const "green"))
 (global $g1591604155814744739 stringref (string.const "lime"))
 (global $g1573287231293875009 stringref (string.const "teal"))
 (global $g17476495360059241787 stringref (string.const "aqua"))
 (global $g15892184661804899067 stringref (string.const "navy"))
 (global $g1236987772545486268 stringref (string.const "blue"))
 (global $g1999019984422065084 stringref (string.const "purple"))
 (global $g14165383556478187998 stringref (string.const "fuchsia"))
 (global $g3870619759916207137 (ref null $3) (struct.new $3
  (array.new_fixed $2 15
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
 (global $g1438547229416868114 stringref (string.const "<circle cx=\'"))
 (global $g12112487731794977639 stringref (string.const "\' cy=\'"))
 (global $g9947321958457254065 stringref (string.const "\' r=\'"))
 (global $g2709499737511829658 stringref (string.const "\' fill=\'"))
 (global $g2529970597353656762 stringref (string.const "\'></circle>"))
 (global $g9185389319346651987 stringref (string.const "Inexact conversion"))
 (global $g17407009702552809644 stringref (string.const ""))
 (global $g11306146467206975403 stringref (string.const "g"))
 (global $g13938554272579043157 stringref (string.const "svg"))
 (global $g11067766316364101896 stringref (string.const "height"))
 (global $g14451361658936562367 stringref (string.const "width"))
 (global $g8175604835841164500 stringref (string.const "<"))
 (global $g6706693452496592420 stringref (string.const ">"))
 (global $g6774991521086689941 stringref (string.const "</"))
 (global $g14823181248367563234 stringref (string.const " "))
 (global $g5057529045379675022 stringref (string.const "=\""))
 (global $g9200817720073813500 stringref (string.const "\""))
 (global $g10734065529100126465 stringref (string.const "plot"))
 (global $g18446744072438200923 (ref null $13) (struct.new_default $13))
 (global $g7560284475039153232 (ref null $19) (struct.new $19
  (global.get $g12269743818889197448)
  (global.get $g18446744072438200923)
 ))
 (global $g18446744070134173807 (ref null $13) (struct.new_default $13))
 (global $g13541710582255632364 (ref null $19) (struct.new $19
  (global.get $g5485395554225102703)
  (global.get $g18446744070134173807)
 ))
 (global $g18446744070142626107 (ref null $13) (struct.new_default $13))
 (global $g18080941553367720062 (ref null $19) (struct.new $19
  (global.get $g2545347053408308794)
  (global.get $g18446744070142626107)
 ))
 (export "nsamples" (func $nsamples))
 (export "sample_step" (func $sample_step))
 (export "phase" (func $phase))
 (export "radii" (func $radii))
 (func $hash-string (type $36) (param $s stringref) (result i64)
  (return
   (i64.extend_i32_s
    (string.hash
     (local.get $s)
    )
   )
  )
 )
 (func $string-eq (type $37) (param $s1 stringref) (param $s2 stringref) (result i32)
  (return
   (string.eq
    (local.get $s1)
    (local.get $s2)
   )
  )
 )
 (func $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__2_5__Float64__Float64__ (type $38) (param $0 (ref null $22)) (result (ref null $11))
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
  (local $13 (ref null $8))
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (local $19 i64)
  (local $20 (ref null $8))
  (local $21 i64)
  (local $22 i64)
  (local $23 i32)
  (local $24 i64)
  (local $25 i64)
  (local $26 (ref null $17))
  (local $27 f64)
  (local $28 f64)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 (ref null $11))
  (local $33 (ref null $11))
  (local $34 (ref null $8))
  (local $35 i64)
  (local $36 i32)
  (local $37 i64)
  (local $38 (ref null $17))
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
      (struct.get $22 1
       (local.get $0)
      )
     )
     (local.set $14
      (struct.get $8 0
       (local.get $13)
      )
     )
     (local.set $15
      (struct.get $8 1
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
      (struct.get $22 1
       (local.get $0)
      )
     )
     (local.set $21
      (struct.get $8 0
       (local.get $20)
      )
     )
     (local.set $22
      (struct.get $8 1
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
        (struct.get $8 0
         (local.get $20)
        )
       )
       (local.set $25
        (struct.get $8 0
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
         (struct.get $22 0
          (local.get $0)
         )
        )
        (local.set $27
         (struct.get $17 0
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
         (struct.get $17 1
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
          (struct.new $11
           (array.new $10
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
         (struct.new $11
          (array.new $10
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
        (array.set $10
         (struct.get $11 0
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
             (struct.get $22 1
              (local.get $0)
             )
            )
            (local.set $35
             (struct.get $8 1
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
                (struct.get $22 0
                 (local.get $0)
                )
               )
               (local.set $39
                (struct.get $17 0
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
                (struct.get $17 1
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
              (array.set $10
               (struct.get $11 0
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
 (func $julia_collect_to_Vector_Float64_Base_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__Int64Int64 (type $40) (param $0 (ref null $11)) (param $1 (ref null $18)) (param $2 i64) (param $3 i64) (result (ref null $11))
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 f64)
  (local $11 (ref null $8))
  (local $12 i64)
  (local $13 i32)
  (local $14 i64)
  (local $15 (ref null $15))
  (local $16 (ref null $11))
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
         (struct.get $18 1
          (local.get $1)
         )
        )
        (local.set $12
         (struct.get $8 1
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
            (struct.get $18 0
             (local.get $1)
            )
           )
           (local.set $16
            (struct.get $15 0
             (local.get $15)
            )
           )
           (local.set $17
            (array.get $10
             (struct.get $11 0
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
            (struct.get $15 1
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
            (struct.get $15 1
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
          (array.set $10
           (struct.get $11 0
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
 (func $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__ (type $32) (param $0 (ref null $18)) (result (ref null $11))
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 f64)
  (local $6 (ref null $8))
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i64)
  (local $13 (ref null $8))
  (local $14 i64)
  (local $15 i64)
  (local $16 i32)
  (local $17 i64)
  (local $18 i64)
  (local $19 (ref null $15))
  (local $20 (ref null $11))
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 f64)
  (local $26 f64)
  (local $27 f64)
  (local $28 f64)
  (local $29 (ref null $11))
  (local $30 (ref null $11))
  (local $31 (ref null $11))
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
      (struct.get $18 1
       (local.get $0)
      )
     )
     (local.set $7
      (struct.get $8 0
       (local.get $6)
      )
     )
     (local.set $8
      (struct.get $8 1
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
      (struct.get $18 1
       (local.get $0)
      )
     )
     (local.set $14
      (struct.get $8 0
       (local.get $13)
      )
     )
     (local.set $15
      (struct.get $8 1
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
        (struct.get $8 0
         (local.get $13)
        )
       )
       (local.set $18
        (struct.get $8 0
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
         (struct.get $18 0
          (local.get $0)
         )
        )
        (local.set $20
         (struct.get $15 0
          (local.get $19)
         )
        )
        (local.set $21
         (array.get $10
          (struct.get $11 0
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
         (struct.get $15 1
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
         (struct.get $15 1
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
         (struct.new $11
          (array.new $10
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
         (struct.new $11
          (array.new $10
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
        (array.set $10
         (struct.get $11 0
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
 (func $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__4_7__Vector_Float64___Float64__ (type $32) (param $0 (ref null $18)) (result (ref null $11))
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
  (local $13 (ref null $8))
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (local $19 i64)
  (local $20 (ref null $8))
  (local $21 i64)
  (local $22 i64)
  (local $23 i32)
  (local $24 i64)
  (local $25 i64)
  (local $26 (ref null $15))
  (local $27 (ref null $11))
  (local $28 f64)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 (ref null $11))
  (local $33 (ref null $11))
  (local $34 (ref null $8))
  (local $35 i64)
  (local $36 i32)
  (local $37 i64)
  (local $38 (ref null $15))
  (local $39 (ref null $11))
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
      (struct.get $18 1
       (local.get $0)
      )
     )
     (local.set $14
      (struct.get $8 0
       (local.get $13)
      )
     )
     (local.set $15
      (struct.get $8 1
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
      (struct.get $18 1
       (local.get $0)
      )
     )
     (local.set $21
      (struct.get $8 0
       (local.get $20)
      )
     )
     (local.set $22
      (struct.get $8 1
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
        (struct.get $8 0
         (local.get $20)
        )
       )
       (local.set $25
        (struct.get $8 0
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
         (struct.get $18 0
          (local.get $0)
         )
        )
        (local.set $27
         (struct.get $15 0
          (local.get $26)
         )
        )
        (local.set $28
         (array.get $10
          (struct.get $11 0
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
         (struct.get $15 1
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
          (struct.new $11
           (array.new $10
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
         (struct.new $11
          (array.new $10
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
        (array.set $10
         (struct.get $11 0
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
             (struct.get $18 1
              (local.get $0)
             )
            )
            (local.set $35
             (struct.get $8 1
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
                (struct.get $18 0
                 (local.get $0)
                )
               )
               (local.set $39
                (struct.get $15 0
                 (local.get $38)
                )
               )
               (local.set $40
                (array.get $10
                 (struct.get $11 0
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
                (struct.get $15 1
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
              (array.set $10
               (struct.get $11 0
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
 (func $julia_objectVector_Any_ (type $46) (param $0 (ref null $1)) (result externref)
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
  (local $39 (ref null $20))
  (local $40 f64)
  (local $41 i64)
  (local $42 i32)
  (local $43 i64)
  (local $44 i32)
  (local $45 i32)
  (local $46 (ref null $23))
  (local $47 i32)
  (local $48 i64)
  (local $49 i32)
  (local $50 i64)
  (local $51 i32)
  (local $52 i32)
  (local $53 (ref null $9))
  (local $54 stringref)
  (local $55 i64)
  (local $56 i32)
  (local $57 i64)
  (local $58 i32)
  (local $59 i32)
  (local $60 (ref null $26))
  (local $61 i64)
  (local $62 i32)
  (local $63 i64)
  (local $64 i32)
  (local $65 i64)
  (local $66 i32)
  (local $67 i64)
  (local $68 i32)
  (local $69 i32)
  (local $70 (ref null $23))
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
          (ref.test (ref null $20)
           (local.get $11)
          )
         )
         (if
          (local.get $38)
          (block
           (block $block$23$break
            (block
             (local.set $39
              (ref.cast (ref null $20)
               (local.get $11)
              )
             )
             (local.set $40
              (struct.get $20 0
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
             (ref.test (ref null $23)
              (local.get $11)
             )
            )
            (if
             (local.get $45)
             (block
              (block $block$32$break
               (block
                (local.set $46
                 (ref.cast (ref null $23)
                  (local.get $11)
                 )
                )
                (local.set $47
                 (struct.get $23 0
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
              (ref.test (ref null $9)
               (local.get $11)
              )
             )
             (if
              (local.get $52)
              (block
               (block $block$41$break
                (block
                 (local.set $53
                  (ref.cast (ref null $9)
                   (local.get $11)
                  )
                 )
                 (local.set $54
                  (struct.get $9 0
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
               (ref.test (ref null $26)
                (local.get $11)
               )
              )
              (if
               (local.get $59)
               (block
                (block $block$50$break
                 (block
                  (local.set $60
                   (ref.cast (ref null $26)
                    (local.get $11)
                   )
                  )
                  (local.set $61
                   (struct.get $26 0
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
                (ref.test (ref null $23)
                 (local.get $11)
                )
               )
               (if
                (local.get $69)
                (block
                 (block $block$65$break
                  (block
                   (local.set $70
                    (ref.cast (ref null $23)
                     (local.get $11)
                    )
                   )
                   (local.set $71
                    (struct.get $23 0
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
 (func $julia_circFloat64Float64Float64Int64 (type $48) (param $0 f64) (param $1 f64) (param $2 f64) (param $3 i64) (result stringref)
  (local $4 (ref null $3))
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 (ref null $3))
  (local $9 stringref)
  (local $10 (ref null $1))
  (local $11 externref)
  (local $12 stringref)
  (block
   (local.set $4
    (global.get $g3870619759916207137)
   )
   (local.set $5
    (i64.extend_i32_u
     (struct.get $3 1
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
    (global.get $g3870619759916207137)
   )
   (local.set $9
    (array.get $2
     (struct.get $3 0
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
      (struct.new $12
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
    (struct.new $9
     (global.get $g1438547229416868114)
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
    (struct.new $20
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
    (struct.new $9
     (global.get $g12112487731794977639)
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
    (struct.new $20
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
    (struct.new $9
     (global.get $g9947321958457254065)
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
    (struct.new $20
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
    (struct.new $9
     (global.get $g2709499737511829658)
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
    (struct.new $9
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
    (struct.new $9
     (global.get $g2529970597353656762)
    )
   )
   (local.set $11
    (call $julia_objectVector_Any_
     (local.get $10)
    )
   )
   (local.set $12
    (call $_x_____x_join____StringExternref
     (local.get $11)
    )
   )
   (return
    (local.get $12)
   )
  )
 )
 (func $julia____3Base_Pairs_Symbol__Union____Tuple____NamedTuple_____Tuple____WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple____Tuple_String_ (type $49) (param $0 (ref null $35)) (param $1 (ref null $14)) (param $2 (ref null $25)) (result (ref null $14))
  (local $3 (ref null $3))
  (local $4 i64)
  (local $5 (ref null $3))
  (local $6 i64)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 stringref)
  (local $11 (ref null $1))
  (local $12 externref)
  (local $13 stringref)
  (local $14 (ref null $2))
  (local $15 i64)
  (local $16 i32)
  (local $17 i64)
  (local $18 stringref)
  (local $19 (ref null $14))
  (block $block$9$break
   (block
    (local.set $3
     (struct.get $14 2
      (local.get $1)
     )
    )
    (local.set $4
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $3)
      )
     )
    )
    (local.set $5
     (struct.new $3
      (array.new $2
       (global.get $g17407009702552809644)
       (i32.wrap_i64
        (local.get $4)
       )
      )
      (i32.wrap_i64
       (local.get $4)
      )
     )
    )
    (local.set $6
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $3)
      )
     )
    )
    (local.set $7
     (i32.wrap_i64
      (local.get $6)
     )
    )
    (local.set $8
     (i64.extend_i32_s
      (local.get $7)
     )
    )
    (local.set $9
     (i64.eq
      (local.get $6)
      (local.get $8)
     )
    )
   )
   (if
    (local.get $9)
    (br $block$9$break)
    (block
     (call $x____console_log_x_NothingString
      (global.get $g9185389319346651987)
     )
     (block
      (br $block$9$break)
     )
    )
   )
  )
  (block
   (block
    (array.copy $2 $2
     (struct.get $3 0
      (local.get $5)
     )
     (i32.wrap_i64
      (i64.const 0)
     )
     (struct.get $3 0
      (local.get $3)
     )
     (i32.wrap_i64
      (i64.const 0)
     )
     (local.get $7)
    )
    (block
     (local.set $10
      (array.get $25
       (local.get $2)
       (i32.add
        (i32.wrap_i64
         (i64.const 1)
        )
        (i32.const -1)
       )
      )
     )
     (local.set $11
      (struct.new $1
       (array.new $0
        (struct.new $12
         (i64.const 0)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (array.set $0
      (struct.get $1 0
       (local.get $11)
      )
      (i32.add
       (i32.wrap_i64
        (i64.const 1)
       )
       (i32.const -1)
      )
      (struct.new $9
       (local.get $10)
      )
     )
     (local.set $12
      (call $julia_objectVector_Any_
       (local.get $11)
      )
     )
     (local.set $13
      (call $_x_____x_join____StringExternref
       (local.get $12)
      )
     )
     (if
      (i32.le_u
       (struct.get $3 1
        (local.get $5)
       )
       (i32.add
        (struct.get $3 1
         (local.get $5)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (block $newbuff
       (local.set $14
        (array.new $2
         (global.get $g17407009702552809644)
         (i32.mul
          (i32.add
           (struct.get $3 1
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
       (array.copy $2 $2
        (local.get $14)
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $3 0
         (local.get $5)
        )
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $3 1
         (local.get $5)
        )
       )
       (struct.set $3 0
        (local.get $5)
        (local.get $14)
       )
      )
     )
     (struct.set $3 1
      (local.get $5)
      (i32.add
       (struct.get $3 1
        (local.get $5)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (local.set $15
      (i64.extend_i32_u
       (struct.get $3 1
        (local.get $5)
       )
      )
     )
     (local.set $16
      (i64.lt_s
       (local.get $15)
       (i64.const 0)
      )
     )
     (local.set $17
      (if (result i64)
       (local.get $16)
       (i64.const 0)
       (local.get $15)
      )
     )
     (array.set $2
      (struct.get $3 0
       (local.get $5)
      )
      (i32.add
       (i32.wrap_i64
        (local.get $17)
       )
       (i32.const -1)
      )
      (local.get $13)
     )
     (local.set $18
      (struct.get $14 0
       (local.get $1)
      )
     )
     (local.set $19
      (struct.new $14
       (local.get $18)
       (struct.new_default $13)
       (local.get $5)
      )
     )
     (return
      (local.get $19)
     )
    )
   )
  )
 )
 (func $julia__stringWebAssemblyCompiler_JS_Node_NamedTuple_____Tuple____ (type $50) (param $0 (ref null $14)) (result stringref)
  (local $1 i32)
  (local $2 stringref)
  (local $3 i64)
  (local $4 stringref)
  (local $5 i64)
  (local $6 stringref)
  (local $7 i64)
  (local $8 i32)
  (local $9 (ref null $1))
  (local $10 stringref)
  (local $11 (ref null $0))
  (local $12 i64)
  (local $13 (ref null $0))
  (local $14 i64)
  (local $15 (ref null $0))
  (local $16 i64)
  (local $17 (ref null $3))
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
  (local $21 i32)
  (local $22 i64)
  (local $23 i32)
  (local $24 i32)
  (local $25 stringref)
  (local $26 i64)
  (local $27 i32)
  (local $28 (ref null $0))
  (local $29 i64)
  (local $30 i64)
  (local $31 i64)
  (local $32 i64)
  (local $33 i32)
  (local $34 i64)
  (local $35 i32)
  (local $36 i32)
  (local $37 stringref)
  (local $38 i64)
  (local $39 i32)
  (local $40 stringref)
  (local $41 (ref null $0))
  (local $42 i64)
  (local $43 (ref null $0))
  (local $44 i64)
  (local $45 (ref null $0))
  (local $46 i64)
  (local $47 externref)
  (local $48 stringref)
  (block $block$5$break
   (block
    (local.set $9
     (struct.new $1
      (array.new $0
       (struct.new $12
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
    (local.set $10
     (struct.get $14 0
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
     (block $newbuff
      (local.set $11
       (array.new $0
        (struct.new $12
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
       (local.get $11)
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
       (local.get $11)
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
    (local.set $12
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
       (local.get $12)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g8175604835841164500)
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
     (block $newbuff0
      (local.set $13
       (array.new $0
        (struct.new $12
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
       (local.get $13)
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
       (local.get $13)
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
    (local.set $14
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
       (local.get $14)
      )
      (i32.const -1)
     )
     (struct.new $9
      (local.get $10)
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
      (local.set $15
       (array.new $0
        (struct.new $12
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
       (local.get $15)
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
       (local.get $15)
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
    (local.set $16
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
       (local.get $16)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g6706693452496592420)
     )
    )
    (local.set $17
     (struct.get $14 2
      (local.get $0)
     )
    )
    (local.set $18
     (i64.const 1)
    )
    (local.set $19
     (i64.sub
      (local.get $18)
      (i64.const 1)
     )
    )
    (local.set $20
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $17)
      )
     )
    )
    (local.set $21
     (i64.le_s
      (i64.const 0)
      (local.get $20)
     )
    )
    (local.set $22
     (local.get $20)
    )
    (local.set $23
     (i64.lt_u
      (local.get $19)
      (local.get $22)
     )
    )
    (local.set $24
     (i32.and
      (local.get $21)
      (local.get $23)
     )
    )
   )
   (if
    (local.get $24)
    (block
     (block
      (local.set $25
       (array.get $2
        (struct.get $3 0
         (local.get $17)
        )
        (i32.add
         (i32.wrap_i64
          (i64.const 1)
         )
         (i32.const -1)
        )
       )
      )
      (local.set $26
       (i64.add
        (i64.const 1)
        (i64.const 1)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $2
       (local.get $25)
      )
      (local.set $3
       (local.get $26)
      )
     )
     (block
      (br $block$5$break)
     )
    )
    (block
     (local.set $1
      (i32.const 1)
     )
     (block
      (br $block$5$break)
     )
    )
   )
  )
  (block
   (block $block$11$break
    (block
     (local.set $27
      (i32.and
       (i32.xor
        (local.get $1)
        (i32.const -1)
       )
       (i32.const 1)
      )
     )
     (local.set $4
      (local.get $2)
     )
     (local.set $5
      (local.get $3)
     )
    )
    (if
     (local.get $27)
     (loop $shape$6$continue
      (block $block$9$break
       (block
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
         (block $newbuff2
          (local.set $28
           (array.new $0
            (struct.new $12
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
           (local.get $28)
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
           (local.get $28)
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
        (local.set $29
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
           (local.get $29)
          )
          (i32.const -1)
         )
         (struct.new $9
          (local.get $4)
         )
        )
        (local.set $30
         (local.get $5)
        )
        (local.set $31
         (i64.sub
          (local.get $30)
          (i64.const 1)
         )
        )
        (local.set $32
         (i64.extend_i32_u
          (struct.get $3 1
           (local.get $17)
          )
         )
        )
        (local.set $33
         (i64.le_s
          (i64.const 0)
          (local.get $32)
         )
        )
        (local.set $34
         (local.get $32)
        )
        (local.set $35
         (i64.lt_u
          (local.get $31)
          (local.get $34)
         )
        )
        (local.set $36
         (i32.and
          (local.get $33)
          (local.get $35)
         )
        )
       )
       (if
        (local.get $36)
        (block
         (block
          (local.set $37
           (array.get $2
            (struct.get $3 0
             (local.get $17)
            )
            (i32.add
             (i32.wrap_i64
              (local.get $5)
             )
             (i32.const -1)
            )
           )
          )
          (local.set $38
           (i64.add
            (local.get $5)
            (i64.const 1)
           )
          )
          (local.set $6
           (local.get $37)
          )
          (local.set $7
           (local.get $38)
          )
          (local.set $8
           (i32.const 0)
          )
         )
         (block
          (br $block$9$break)
         )
        )
        (block
         (local.set $8
          (i32.const 1)
         )
         (block
          (br $block$9$break)
         )
        )
       )
      )
      (block
       (block $block$10$break
        (local.set $39
         (i32.and
          (i32.xor
           (local.get $8)
           (i32.const -1)
          )
          (i32.const 1)
         )
        )
        (if
         (local.get $39)
         (br $block$10$break)
         (br $block$11$break)
        )
       )
       (block
        (block
         (local.set $4
          (local.get $6)
         )
         (local.set $5
          (local.get $7)
         )
        )
        (block
         (br $shape$6$continue)
        )
       )
      )
     )
     (br $block$11$break)
    )
   )
   (block
    (block $block$13$break
     (block
      (local.set $40
       (struct.get $14 0
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
       (block $newbuff3
        (local.set $41
         (array.new $0
          (struct.new $12
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
         (local.get $41)
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
         (local.get $41)
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
      (local.set $42
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
         (local.get $42)
        )
        (i32.const -1)
       )
       (struct.new $9
        (global.get $g6774991521086689941)
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
       (block $newbuff4
        (local.set $43
         (array.new $0
          (struct.new $12
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
         (local.get $43)
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
         (local.get $43)
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
      (local.set $44
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
         (local.get $44)
        )
        (i32.const -1)
       )
       (struct.new $9
        (local.get $40)
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
       (block $newbuff5
        (local.set $45
         (array.new $0
          (struct.new $12
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
         (local.get $45)
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
         (local.get $45)
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
      (local.set $46
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
         (local.get $46)
        )
        (i32.const -1)
       )
       (struct.new $9
        (global.get $g6706693452496592420)
       )
      )
     )
     (block
      (br $block$13$break)
     )
    )
    (block
     (block
      (local.set $47
       (call $julia_objectVector_Any_
        (local.get $9)
       )
      )
      (local.set $48
       (call $_x_____x_join____StringExternref
        (local.get $47)
       )
      )
      (return
       (local.get $48)
      )
     )
    )
   )
  )
 )
 (func $julia____3Base_Pairs_Symbol__Float64__Tuple_Symbol__Symbol___NamedTuple___height___width___Tuple_Float64__Float64___WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple____Tuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____ (type $51) (param $0 (ref null $28)) (param $1 (ref null $14)) (param $2 (ref null $27)) (result (ref null $21))
  (local $3 (ref null $3))
  (local $4 i64)
  (local $5 (ref null $3))
  (local $6 i64)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 (ref null $14))
  (local $11 stringref)
  (local $12 (ref null $2))
  (local $13 i64)
  (local $14 i32)
  (local $15 i64)
  (local $16 stringref)
  (local $17 (ref null $17))
  (local $18 (ref null $21))
  (block $block$9$break
   (block
    (local.set $3
     (struct.get $14 2
      (local.get $1)
     )
    )
    (local.set $4
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $3)
      )
     )
    )
    (local.set $5
     (struct.new $3
      (array.new $2
       (global.get $g17407009702552809644)
       (i32.wrap_i64
        (local.get $4)
       )
      )
      (i32.wrap_i64
       (local.get $4)
      )
     )
    )
    (local.set $6
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $3)
      )
     )
    )
    (local.set $7
     (i32.wrap_i64
      (local.get $6)
     )
    )
    (local.set $8
     (i64.extend_i32_s
      (local.get $7)
     )
    )
    (local.set $9
     (i64.eq
      (local.get $6)
      (local.get $8)
     )
    )
   )
   (if
    (local.get $9)
    (br $block$9$break)
    (block
     (call $x____console_log_x_NothingString
      (global.get $g9185389319346651987)
     )
     (block
      (br $block$9$break)
     )
    )
   )
  )
  (block
   (block
    (array.copy $2 $2
     (struct.get $3 0
      (local.get $5)
     )
     (i32.wrap_i64
      (i64.const 0)
     )
     (struct.get $3 0
      (local.get $3)
     )
     (i32.wrap_i64
      (i64.const 0)
     )
     (local.get $7)
    )
    (block
     (local.set $10
      (array.get $27
       (local.get $2)
       (i32.add
        (i32.wrap_i64
         (i64.const 1)
        )
        (i32.const -1)
       )
      )
     )
     (local.set $11
      (call $julia__stringWebAssemblyCompiler_JS_Node_NamedTuple_____Tuple____
       (local.get $10)
      )
     )
     (if
      (i32.le_u
       (struct.get $3 1
        (local.get $5)
       )
       (i32.add
        (struct.get $3 1
         (local.get $5)
        )
        (i32.wrap_i64
         (i64.const 1)
        )
       )
      )
      (block $newbuff
       (local.set $12
        (array.new $2
         (global.get $g17407009702552809644)
         (i32.mul
          (i32.add
           (struct.get $3 1
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
       (array.copy $2 $2
        (local.get $12)
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $3 0
         (local.get $5)
        )
        (i32.wrap_i64
         (i64.const 0)
        )
        (struct.get $3 1
         (local.get $5)
        )
       )
       (struct.set $3 0
        (local.get $5)
        (local.get $12)
       )
      )
     )
     (struct.set $3 1
      (local.get $5)
      (i32.add
       (struct.get $3 1
        (local.get $5)
       )
       (i32.wrap_i64
        (i64.const 1)
       )
      )
     )
     (local.set $13
      (i64.extend_i32_u
       (struct.get $3 1
        (local.get $5)
       )
      )
     )
     (local.set $14
      (i64.lt_s
       (local.get $13)
       (i64.const 0)
      )
     )
     (local.set $15
      (if (result i64)
       (local.get $14)
       (i64.const 0)
       (local.get $13)
      )
     )
     (array.set $2
      (struct.get $3 0
       (local.get $5)
      )
      (i32.add
       (i32.wrap_i64
        (local.get $15)
       )
       (i32.const -1)
      )
      (local.get $11)
     )
     (local.set $16
      (struct.get $14 0
       (local.get $1)
      )
     )
     (local.set $17
      (struct.get $28 0
       (local.get $0)
      )
     )
     (local.set $18
      (struct.new $21
       (local.get $16)
       (local.get $17)
       (local.get $5)
      )
     )
     (return
      (local.get $18)
     )
    )
   )
  )
 )
 (func $julia__stringWebAssemblyCompiler_JS_Node_NamedTuple___height___width___Tuple_Float64__Float64___ (type $52) (param $0 (ref null $21)) (result stringref)
  (local $1 i32)
  (local $2 stringref)
  (local $3 i64)
  (local $4 stringref)
  (local $5 i64)
  (local $6 stringref)
  (local $7 i64)
  (local $8 i32)
  (local $9 (ref null $1))
  (local $10 stringref)
  (local $11 (ref null $0))
  (local $12 i64)
  (local $13 (ref null $0))
  (local $14 i64)
  (local $15 (ref null $17))
  (local $16 f64)
  (local $17 f64)
  (local $18 (ref null $0))
  (local $19 i64)
  (local $20 (ref null $0))
  (local $21 i64)
  (local $22 (ref null $0))
  (local $23 i64)
  (local $24 (ref null $0))
  (local $25 i64)
  (local $26 (ref null $0))
  (local $27 i64)
  (local $28 (ref null $0))
  (local $29 i64)
  (local $30 (ref null $0))
  (local $31 i64)
  (local $32 (ref null $0))
  (local $33 i64)
  (local $34 (ref null $0))
  (local $35 i64)
  (local $36 (ref null $0))
  (local $37 i64)
  (local $38 (ref null $0))
  (local $39 i64)
  (local $40 (ref null $3))
  (local $41 i64)
  (local $42 i64)
  (local $43 i64)
  (local $44 i32)
  (local $45 i64)
  (local $46 i32)
  (local $47 i32)
  (local $48 stringref)
  (local $49 i64)
  (local $50 i32)
  (local $51 (ref null $0))
  (local $52 i64)
  (local $53 i64)
  (local $54 i64)
  (local $55 i64)
  (local $56 i32)
  (local $57 i64)
  (local $58 i32)
  (local $59 i32)
  (local $60 stringref)
  (local $61 i64)
  (local $62 i32)
  (local $63 stringref)
  (local $64 (ref null $0))
  (local $65 i64)
  (local $66 (ref null $0))
  (local $67 i64)
  (local $68 (ref null $0))
  (local $69 i64)
  (local $70 externref)
  (local $71 stringref)
  (block $block$5$break
   (block
    (local.set $9
     (struct.new $1
      (array.new $0
       (struct.new $12
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
    (local.set $10
     (struct.get $21 0
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
     (block $newbuff
      (local.set $11
       (array.new $0
        (struct.new $12
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
       (local.get $11)
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
       (local.get $11)
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
    (local.set $12
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
       (local.get $12)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g8175604835841164500)
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
     (block $newbuff0
      (local.set $13
       (array.new $0
        (struct.new $12
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
       (local.get $13)
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
       (local.get $13)
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
    (local.set $14
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
       (local.get $14)
      )
      (i32.const -1)
     )
     (struct.new $9
      (local.get $10)
     )
    )
    (local.set $15
     (struct.get $21 1
      (local.get $0)
     )
    )
    (local.set $16
     (struct.get $17 0
      (local.get $15)
     )
    )
    (local.set $17
     (struct.get $17 1
      (local.get $15)
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
      (local.set $18
       (array.new $0
        (struct.new $12
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
       (local.get $18)
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
       (local.get $18)
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
    (local.set $19
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
       (local.get $19)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g14823181248367563234)
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
     (block $newbuff2
      (local.set $20
       (array.new $0
        (struct.new $12
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
       (local.get $20)
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
       (local.get $20)
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
    (local.set $21
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
       (local.get $21)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g11067766316364101896)
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
     (block $newbuff3
      (local.set $22
       (array.new $0
        (struct.new $12
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
       (local.get $22)
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
       (local.get $22)
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
    (local.set $23
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
       (local.get $23)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g5057529045379675022)
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
     (block $newbuff4
      (local.set $24
       (array.new $0
        (struct.new $12
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
       (local.get $24)
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
       (local.get $24)
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
    (local.set $25
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
       (local.get $25)
      )
      (i32.const -1)
     )
     (struct.new $20
      (local.get $16)
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
     (block $newbuff5
      (local.set $26
       (array.new $0
        (struct.new $12
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
       (local.get $26)
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
       (local.get $26)
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
    (local.set $27
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
       (local.get $27)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g9200817720073813500)
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
     (block $newbuff6
      (local.set $28
       (array.new $0
        (struct.new $12
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
       (local.get $28)
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
       (local.get $28)
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
    (local.set $29
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
       (local.get $29)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g14823181248367563234)
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
     (block $newbuff7
      (local.set $30
       (array.new $0
        (struct.new $12
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
       (local.get $30)
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
       (local.get $30)
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
    (local.set $31
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
       (local.get $31)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g14451361658936562367)
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
     (block $newbuff8
      (local.set $32
       (array.new $0
        (struct.new $12
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
       (local.get $32)
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
       (local.get $32)
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
    (local.set $33
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
       (local.get $33)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g5057529045379675022)
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
     (block $newbuff9
      (local.set $34
       (array.new $0
        (struct.new $12
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
       (local.get $34)
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
       (local.get $34)
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
    (local.set $35
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
       (local.get $35)
      )
      (i32.const -1)
     )
     (struct.new $20
      (local.get $17)
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
     (block $newbuff10
      (local.set $36
       (array.new $0
        (struct.new $12
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
       (local.get $36)
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
       (local.get $36)
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
    (local.set $37
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
       (local.get $37)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g9200817720073813500)
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
     (block $newbuff11
      (local.set $38
       (array.new $0
        (struct.new $12
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
       (local.get $38)
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
       (local.get $38)
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
    (local.set $39
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
       (local.get $39)
      )
      (i32.const -1)
     )
     (struct.new $9
      (global.get $g6706693452496592420)
     )
    )
    (local.set $40
     (struct.get $21 2
      (local.get $0)
     )
    )
    (local.set $41
     (i64.const 1)
    )
    (local.set $42
     (i64.sub
      (local.get $41)
      (i64.const 1)
     )
    )
    (local.set $43
     (i64.extend_i32_u
      (struct.get $3 1
       (local.get $40)
      )
     )
    )
    (local.set $44
     (i64.le_s
      (i64.const 0)
      (local.get $43)
     )
    )
    (local.set $45
     (local.get $43)
    )
    (local.set $46
     (i64.lt_u
      (local.get $42)
      (local.get $45)
     )
    )
    (local.set $47
     (i32.and
      (local.get $44)
      (local.get $46)
     )
    )
   )
   (if
    (local.get $47)
    (block
     (block
      (local.set $48
       (array.get $2
        (struct.get $3 0
         (local.get $40)
        )
        (i32.add
         (i32.wrap_i64
          (i64.const 1)
         )
         (i32.const -1)
        )
       )
      )
      (local.set $49
       (i64.add
        (i64.const 1)
        (i64.const 1)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $2
       (local.get $48)
      )
      (local.set $3
       (local.get $49)
      )
     )
     (block
      (br $block$5$break)
     )
    )
    (block
     (local.set $1
      (i32.const 1)
     )
     (block
      (br $block$5$break)
     )
    )
   )
  )
  (block
   (block $block$11$break
    (block
     (local.set $50
      (i32.and
       (i32.xor
        (local.get $1)
        (i32.const -1)
       )
       (i32.const 1)
      )
     )
     (local.set $4
      (local.get $2)
     )
     (local.set $5
      (local.get $3)
     )
    )
    (if
     (local.get $50)
     (loop $shape$6$continue
      (block $block$9$break
       (block
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
         (block $newbuff12
          (local.set $51
           (array.new $0
            (struct.new $12
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
           (local.get $51)
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
           (local.get $51)
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
        (local.set $52
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
           (local.get $52)
          )
          (i32.const -1)
         )
         (struct.new $9
          (local.get $4)
         )
        )
        (local.set $53
         (local.get $5)
        )
        (local.set $54
         (i64.sub
          (local.get $53)
          (i64.const 1)
         )
        )
        (local.set $55
         (i64.extend_i32_u
          (struct.get $3 1
           (local.get $40)
          )
         )
        )
        (local.set $56
         (i64.le_s
          (i64.const 0)
          (local.get $55)
         )
        )
        (local.set $57
         (local.get $55)
        )
        (local.set $58
         (i64.lt_u
          (local.get $54)
          (local.get $57)
         )
        )
        (local.set $59
         (i32.and
          (local.get $56)
          (local.get $58)
         )
        )
       )
       (if
        (local.get $59)
        (block
         (block
          (local.set $60
           (array.get $2
            (struct.get $3 0
             (local.get $40)
            )
            (i32.add
             (i32.wrap_i64
              (local.get $5)
             )
             (i32.const -1)
            )
           )
          )
          (local.set $61
           (i64.add
            (local.get $5)
            (i64.const 1)
           )
          )
          (local.set $6
           (local.get $60)
          )
          (local.set $7
           (local.get $61)
          )
          (local.set $8
           (i32.const 0)
          )
         )
         (block
          (br $block$9$break)
         )
        )
        (block
         (local.set $8
          (i32.const 1)
         )
         (block
          (br $block$9$break)
         )
        )
       )
      )
      (block
       (block $block$10$break
        (local.set $62
         (i32.and
          (i32.xor
           (local.get $8)
           (i32.const -1)
          )
          (i32.const 1)
         )
        )
        (if
         (local.get $62)
         (br $block$10$break)
         (br $block$11$break)
        )
       )
       (block
        (block
         (local.set $4
          (local.get $6)
         )
         (local.set $5
          (local.get $7)
         )
        )
        (block
         (br $shape$6$continue)
        )
       )
      )
     )
     (br $block$11$break)
    )
   )
   (block
    (block $block$13$break
     (block
      (local.set $63
       (struct.get $21 0
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
       (block $newbuff13
        (local.set $64
         (array.new $0
          (struct.new $12
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
         (local.get $64)
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
         (local.get $64)
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
      (local.set $65
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
         (local.get $65)
        )
        (i32.const -1)
       )
       (struct.new $9
        (global.get $g6774991521086689941)
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
       (block $newbuff14
        (local.set $66
         (array.new $0
          (struct.new $12
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
         (local.get $66)
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
         (local.get $66)
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
      (local.set $67
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
         (local.get $67)
        )
        (i32.const -1)
       )
       (struct.new $9
        (local.get $63)
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
       (block $newbuff15
        (local.set $68
         (array.new $0
          (struct.new $12
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
         (local.get $68)
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
         (local.get $68)
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
      (local.set $69
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
         (local.get $69)
        )
        (i32.const -1)
       )
       (struct.new $9
        (global.get $g6706693452496592420)
       )
      )
     )
     (block
      (br $block$13$break)
     )
    )
    (block
     (block
      (local.set $70
       (call $julia_objectVector_Any_
        (local.get $9)
       )
      )
      (local.set $71
       (call $_x_____x_join____StringExternref
        (local.get $70)
       )
      )
      (return
       (local.get $71)
      )
     )
    )
   )
  )
 )
 (func $julia_set_svgInt64Float64Float64Float64 (type $55) (param $0 i64) (param $1 f64) (param $2 f64) (param $3 f64)
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
  (local $16 (ref null $17))
  (local $17 i32)
  (local $18 (ref null $8))
  (local $19 (ref null $22))
  (local $20 (ref null $11))
  (local $21 f64)
  (local $22 (ref null $15))
  (local $23 i32)
  (local $24 (ref null $8))
  (local $25 (ref null $18))
  (local $26 (ref null $11))
  (local $27 f64)
  (local $28 (ref null $15))
  (local $29 i32)
  (local $30 (ref null $8))
  (local $31 (ref null $18))
  (local $32 (ref null $11))
  (local $33 (ref null $1))
  (local $34 i32)
  (local $35 i32)
  (local $36 i32)
  (local $37 f64)
  (local $38 f64)
  (local $39 stringref)
  (local $40 (ref null $0))
  (local $41 i64)
  (local $42 i32)
  (local $43 i64)
  (local $44 i32)
  (local $45 externref)
  (local $46 stringref)
  (local $47 (ref null $1))
  (local $48 externref)
  (local $49 stringref)
  (local $50 (ref null $3))
  (local $51 (ref null $14))
  (local $52 (ref null $14))
  (local $53 (ref null $1))
  (local $54 externref)
  (local $55 stringref)
  (local $56 (ref null $3))
  (local $57 (ref null $14))
  (local $58 (ref null $21))
  (local $59 stringref)
  (local $60 externref)
  (block $block$4$break
   (block
    (local.set $16
     (struct.new $17
      (local.get $1)
      (local.get $2)
     )
    )
    (local.set $17
     (i64.le_s
      (i64.const 1)
      (local.get $0)
     )
    )
   )
   (if
    (local.get $17)
    (block
     (local.set $4
      (local.get $0)
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
   (block $block$6$break
    (local.set $18
     (struct.new $8
      (i64.const 1)
      (local.get $4)
     )
    )
    (block
     (br $block$6$break)
    )
   )
   (block
    (block $block$9$break
     (block
      (local.set $19
       (struct.new $22
        (local.get $16)
        (local.get $18)
       )
      )
      (local.set $20
       (call $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__2_5__Float64__Float64__
        (local.get $19)
       )
      )
      (local.set $21
       (f64.const 300)
      )
      (local.set $22
       (struct.new $15
        (local.get $20)
        (local.get $21)
       )
      )
      (local.set $23
       (i64.le_s
        (i64.const 1)
        (local.get $0)
       )
      )
     )
     (if
      (local.get $23)
      (block
       (local.set $5
        (local.get $0)
       )
       (block
        (br $block$9$break)
       )
      )
      (block
       (local.set $5
        (i64.const 0)
       )
       (block
        (br $block$9$break)
       )
      )
     )
    )
    (block
     (block $block$11$break
      (local.set $24
       (struct.new $8
        (i64.const 1)
        (local.get $5)
       )
      )
      (block
       (br $block$11$break)
      )
     )
     (block
      (block $block$14$break
       (block
        (local.set $25
         (struct.new $18
          (local.get $22)
          (local.get $24)
         )
        )
        (local.set $26
         (call $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__3_6__Vector_Float64___Float64__
          (local.get $25)
         )
        )
        (local.set $27
         (f64.const 900)
        )
        (local.set $28
         (struct.new $15
          (local.get $20)
          (local.get $27)
         )
        )
        (local.set $29
         (i64.le_s
          (i64.const 1)
          (local.get $0)
         )
        )
       )
       (if
        (local.get $29)
        (block
         (local.set $6
          (local.get $0)
         )
         (block
          (br $block$14$break)
         )
        )
        (block
         (local.set $6
          (i64.const 0)
         )
         (block
          (br $block$14$break)
         )
        )
       )
      )
      (block
       (block $block$16$break
        (local.set $30
         (struct.new $8
          (i64.const 1)
          (local.get $6)
         )
        )
        (block
         (br $block$16$break)
        )
       )
       (block
        (block $block$21$break
         (block
          (local.set $31
           (struct.new $18
            (local.get $28)
            (local.get $30)
           )
          )
          (local.set $32
           (call $julia_collectBase_Generator_UnitRange_Int64___Main___atexample__named__observables_var__4_7__Vector_Float64___Float64__
            (local.get $31)
           )
          )
          (local.set $33
           (struct.new $1
            (array.new $0
             (struct.new $12
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
          (local.set $34
           (i64.le_s
            (i64.const 1)
            (local.get $0)
           )
          )
         )
         (if
          (local.get $34)
          (block
           (local.set $7
            (local.get $0)
           )
           (block
            (br $block$21$break)
           )
          )
          (block
           (local.set $7
            (i64.const 0)
           )
           (block
            (br $block$21$break)
           )
          )
         )
        )
        (block
         (block $block$24$break
          (local.set $35
           (i64.lt_s
            (local.get $7)
            (i64.const 1)
           )
          )
          (if
           (local.get $35)
           (block
            (local.set $8
             (i32.const 1)
            )
            (block
             (br $block$24$break)
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
             (br $block$24$break)
            )
           )
          )
         )
         (block
          (block $block$30$break
           (block
            (local.set $36
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
            (local.get $36)
            (loop $shape$25$continue
             (block $block$28$break
              (block
               (local.set $37
                (array.get $10
                 (struct.get $11 0
                  (local.get $32)
                 )
                 (i32.add
                  (i32.wrap_i64
                   (local.get $11)
                  )
                  (i32.const -1)
                 )
                )
               )
               (local.set $38
                (array.get $10
                 (struct.get $11 0
                  (local.get $26)
                 )
                 (i32.add
                  (i32.wrap_i64
                   (local.get $11)
                  )
                  (i32.const -1)
                 )
                )
               )
               (local.set $39
                (call $julia_circFloat64Float64Float64Int64
                 (local.get $37)
                 (local.get $38)
                 (local.get $3)
                 (local.get $11)
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
                (block $newbuff
                 (local.set $40
                  (array.new $0
                   (struct.new $12
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
                  (local.get $40)
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
                  (local.get $40)
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
               (local.set $41
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
                  (local.get $41)
                 )
                 (i32.const -1)
                )
                (struct.new $9
                 (local.get $39)
                )
               )
               (local.set $42
                (i64.eq
                 (local.get $12)
                 (local.get $7)
                )
               )
              )
              (if
               (local.get $42)
               (block
                (local.set $15
                 (i32.const 1)
                )
                (block
                 (br $block$28$break)
                )
               )
               (block
                (block
                 (local.set $43
                  (i64.add
                   (local.get $12)
                   (i64.const 1)
                  )
                 )
                 (local.set $13
                  (local.get $43)
                 )
                 (local.set $14
                  (local.get $43)
                 )
                 (local.set $15
                  (i32.const 0)
                 )
                )
                (block
                 (br $block$28$break)
                )
               )
              )
             )
             (block
              (block $block$29$break
               (local.set $44
                (i32.and
                 (i32.xor
                  (local.get $15)
                  (i32.const -1)
                 )
                 (i32.const 1)
                )
               )
               (if
                (local.get $44)
                (br $block$29$break)
                (br $block$30$break)
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
            (br $block$30$break)
           )
          )
          (block
           (block
            (local.set $45
             (call $julia_objectVector_Any_
              (local.get $33)
             )
            )
            (local.set $46
             (call $_x_____x_join____StringExternref
              (local.get $45)
             )
            )
            (local.set $47
             (struct.new $1
              (array.new $0
               (struct.new $12
                (i64.const 0)
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
              (i32.wrap_i64
               (i64.const 2)
              )
             )
            )
            (array.set $0
             (struct.get $1 0
              (local.get $47)
             )
             (i32.add
              (i32.wrap_i64
               (i64.const 1)
              )
              (i32.const -1)
             )
             (struct.new $9
              (global.get $g17407009702552809644)
             )
            )
            (array.set $0
             (struct.get $1 0
              (local.get $47)
             )
             (i32.add
              (i32.wrap_i64
               (i64.const 2)
              )
              (i32.const -1)
             )
             (struct.new $9
              (global.get $g11306146467206975403)
             )
            )
            (local.set $48
             (call $julia_objectVector_Any_
              (local.get $47)
             )
            )
            (local.set $49
             (call $_x_____x_join____StringExternref
              (local.get $48)
             )
            )
            (local.set $50
             (struct.new $3
              (array.new $2
               (global.get $g17407009702552809644)
               (i32.wrap_i64
                (i64.const 0)
               )
              )
              (i32.wrap_i64
               (i64.const 0)
              )
             )
            )
            (local.set $51
             (struct.new $14
              (local.get $49)
              (struct.new_default $13)
              (local.get $50)
             )
            )
            (local.set $52
             (call $julia____3Base_Pairs_Symbol__Union____Tuple____NamedTuple_____Tuple____WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple____Tuple_String_
              (struct.new $35
               (struct.new_default $13)
               (array.new_fixed $34 0)
              )
              (local.get $51)
              (array.new_fixed $25 1
               (local.get $46)
              )
             )
            )
            (local.set $53
             (struct.new $1
              (array.new $0
               (struct.new $12
                (i64.const 0)
               )
               (i32.wrap_i64
                (i64.const 2)
               )
              )
              (i32.wrap_i64
               (i64.const 2)
              )
             )
            )
            (array.set $0
             (struct.get $1 0
              (local.get $53)
             )
             (i32.add
              (i32.wrap_i64
               (i64.const 1)
              )
              (i32.const -1)
             )
             (struct.new $9
              (global.get $g17407009702552809644)
             )
            )
            (array.set $0
             (struct.get $1 0
              (local.get $53)
             )
             (i32.add
              (i32.wrap_i64
               (i64.const 2)
              )
              (i32.const -1)
             )
             (struct.new $9
              (global.get $g13938554272579043157)
             )
            )
            (local.set $54
             (call $julia_objectVector_Any_
              (local.get $53)
             )
            )
            (local.set $55
             (call $_x_____x_join____StringExternref
              (local.get $54)
             )
            )
            (local.set $56
             (struct.new $3
              (array.new $2
               (global.get $g17407009702552809644)
               (i32.wrap_i64
                (i64.const 0)
               )
              )
              (i32.wrap_i64
               (i64.const 0)
              )
             )
            )
            (local.set $57
             (struct.new $14
              (local.get $55)
              (struct.new_default $13)
              (local.get $56)
             )
            )
            (local.set $58
             (call $julia____3Base_Pairs_Symbol__Float64__Tuple_Symbol__Symbol___NamedTuple___height___width___Tuple_Float64__Float64___WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple____Tuple_WebAssemblyCompiler_JS_Node_NamedTuple_____Tuple_____
              (struct.new $28
               (struct.new $17
                (f64.const 300)
                (f64.const 900)
               )
               (array.new_fixed $25 2
                (global.get $g11067766316364101896)
                (global.get $g14451361658936562367)
               )
              )
              (local.get $57)
              (array.new_fixed $27 1
               (local.get $52)
              )
             )
            )
            (local.set $59
             (call $julia__stringWebAssemblyCompiler_JS_Node_NamedTuple___height___width___Tuple_Float64__Float64___
              (local.get $58)
             )
            )
            (local.set $60
             (call $_x_____document_getElementById_x_ExternrefString
              (global.get $g10734065529100126465)
             )
            )
            (call $_x__str_____x_innerHTML___strNothingExternrefString
             (local.get $60)
             (local.get $59)
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
 (func $nsamples (type $56) (param $0 i64) (result i32)
  (local $1 (ref null $16))
  (local $2 i32)
  (local $3 (ref null $16))
  (local $4 i64)
  (local $5 i32)
  (local $6 (ref null $16))
  (local $7 i64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (block $block$4$break
   (block
    (local.set $1
     (struct.get $24 0
      (global.get $g8054646434958260984)
     )
    )
    (local.set $2
     (struct.get $16 2
      (local.get $1)
     )
    )
   )
   (if
    (local.get $2)
    (block
     (block $block$3$break
      (block
       (local.set $3
        (struct.get $24 0
         (global.get $g8054646434958260984)
        )
       )
       (local.set $4
        (struct.get $16 3
         (local.get $3)
        )
       )
       (local.set $5
        (i64.eq
         (local.get $4)
         (local.get $0)
        )
       )
      )
      (if
       (local.get $5)
       (br $block$3$break)
       (br $block$4$break)
      )
     )
     (block
      (return
       (i32.const 0)
      )
     )
    )
    (br $block$4$break)
   )
  )
  (block
   (block
    (local.set $6
     (struct.get $24 0
      (global.get $g8054646434958260984)
     )
    )
    (struct.set $16 3
     (local.get $6)
     (local.get $0)
    )
    (local.set $7
     (struct.get $16 3
      (global.get $g1246607517337572990)
     )
    )
    (local.set $8
     (struct.get $7 3
      (global.get $g12269743818889197448)
     )
    )
    (local.set $9
     (struct.get $7 3
      (global.get $g5485395554225102703)
     )
    )
    (local.set $10
     (struct.get $7 3
      (global.get $g2545347053408308794)
     )
    )
    (call $julia_set_svgInt64Float64Float64Float64
     (local.get $7)
     (local.get $8)
     (local.get $9)
     (local.get $10)
    )
    (return
     (i32.const 0)
    )
   )
  )
 )
 (func $sample_step (type $29) (param $0 f64) (result i32)
  (local $1 (ref null $7))
  (local $2 i32)
  (local $3 (ref null $7))
  (local $4 f64)
  (local $5 i32)
  (local $6 (ref null $7))
  (local $7 i64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (block $block$4$break
   (block
    (local.set $1
     (struct.get $19 0
      (global.get $g7560284475039153232)
     )
    )
    (local.set $2
     (struct.get $7 2
      (local.get $1)
     )
    )
   )
   (if
    (local.get $2)
    (block
     (block $block$3$break
      (block
       (local.set $3
        (struct.get $19 0
         (global.get $g7560284475039153232)
        )
       )
       (local.set $4
        (struct.get $7 3
         (local.get $3)
        )
       )
       (local.set $5
        (f64.eq
         (local.get $4)
         (local.get $0)
        )
       )
      )
      (if
       (local.get $5)
       (br $block$3$break)
       (br $block$4$break)
      )
     )
     (block
      (return
       (i32.const 0)
      )
     )
    )
    (br $block$4$break)
   )
  )
  (block
   (block
    (local.set $6
     (struct.get $19 0
      (global.get $g7560284475039153232)
     )
    )
    (struct.set $7 3
     (local.get $6)
     (local.get $0)
    )
    (local.set $7
     (struct.get $16 3
      (global.get $g1246607517337572990)
     )
    )
    (local.set $8
     (struct.get $7 3
      (global.get $g12269743818889197448)
     )
    )
    (local.set $9
     (struct.get $7 3
      (global.get $g5485395554225102703)
     )
    )
    (local.set $10
     (struct.get $7 3
      (global.get $g2545347053408308794)
     )
    )
    (call $julia_set_svgInt64Float64Float64Float64
     (local.get $7)
     (local.get $8)
     (local.get $9)
     (local.get $10)
    )
    (return
     (i32.const 0)
    )
   )
  )
 )
 (func $phase (type $29) (param $0 f64) (result i32)
  (local $1 (ref null $7))
  (local $2 i32)
  (local $3 (ref null $7))
  (local $4 f64)
  (local $5 i32)
  (local $6 (ref null $7))
  (local $7 i64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (block $block$4$break
   (block
    (local.set $1
     (struct.get $19 0
      (global.get $g13541710582255632364)
     )
    )
    (local.set $2
     (struct.get $7 2
      (local.get $1)
     )
    )
   )
   (if
    (local.get $2)
    (block
     (block $block$3$break
      (block
       (local.set $3
        (struct.get $19 0
         (global.get $g13541710582255632364)
        )
       )
       (local.set $4
        (struct.get $7 3
         (local.get $3)
        )
       )
       (local.set $5
        (f64.eq
         (local.get $4)
         (local.get $0)
        )
       )
      )
      (if
       (local.get $5)
       (br $block$3$break)
       (br $block$4$break)
      )
     )
     (block
      (return
       (i32.const 0)
      )
     )
    )
    (br $block$4$break)
   )
  )
  (block
   (block
    (local.set $6
     (struct.get $19 0
      (global.get $g13541710582255632364)
     )
    )
    (struct.set $7 3
     (local.get $6)
     (local.get $0)
    )
    (local.set $7
     (struct.get $16 3
      (global.get $g1246607517337572990)
     )
    )
    (local.set $8
     (struct.get $7 3
      (global.get $g12269743818889197448)
     )
    )
    (local.set $9
     (struct.get $7 3
      (global.get $g5485395554225102703)
     )
    )
    (local.set $10
     (struct.get $7 3
      (global.get $g2545347053408308794)
     )
    )
    (call $julia_set_svgInt64Float64Float64Float64
     (local.get $7)
     (local.get $8)
     (local.get $9)
     (local.get $10)
    )
    (return
     (i32.const 0)
    )
   )
  )
 )
 (func $radii (type $29) (param $0 f64) (result i32)
  (local $1 (ref null $7))
  (local $2 i32)
  (local $3 (ref null $7))
  (local $4 f64)
  (local $5 i32)
  (local $6 (ref null $7))
  (local $7 i64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (block $block$4$break
   (block
    (local.set $1
     (struct.get $19 0
      (global.get $g18080941553367720062)
     )
    )
    (local.set $2
     (struct.get $7 2
      (local.get $1)
     )
    )
   )
   (if
    (local.get $2)
    (block
     (block $block$3$break
      (block
       (local.set $3
        (struct.get $19 0
         (global.get $g18080941553367720062)
        )
       )
       (local.set $4
        (struct.get $7 3
         (local.get $3)
        )
       )
       (local.set $5
        (f64.eq
         (local.get $4)
         (local.get $0)
        )
       )
      )
      (if
       (local.get $5)
       (br $block$3$break)
       (br $block$4$break)
      )
     )
     (block
      (return
       (i32.const 0)
      )
     )
    )
    (br $block$4$break)
   )
  )
  (block
   (block
    (local.set $6
     (struct.get $19 0
      (global.get $g18080941553367720062)
     )
    )
    (struct.set $7 3
     (local.get $6)
     (local.get $0)
    )
    (local.set $7
     (struct.get $16 3
      (global.get $g1246607517337572990)
     )
    )
    (local.set $8
     (struct.get $7 3
      (global.get $g12269743818889197448)
     )
    )
    (local.set $9
     (struct.get $7 3
      (global.get $g5485395554225102703)
     )
    )
    (local.set $10
     (struct.get $7 3
      (global.get $g2545347053408308794)
     )
    )
    (call $julia_set_svgInt64Float64Float64Float64
     (local.get $7)
     (local.get $8)
     (local.get $9)
     (local.get $10)
    )
    (return
     (i32.const 0)
    )
   )
  )
 )
)
