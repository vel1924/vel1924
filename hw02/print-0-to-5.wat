(module
 (import "" "write_i32"  (func $write_i32  (param i32)))
 (import "" "write_i32x" (func $write_i32x (param i32)))
 (import "" "write_i32b" (func $write_i32b (param i32)))
 (import "" "write_char" (func $write_char (param i32)))
 (func $run (export "run") (result i32)
   (local $max i32)
   (local $counter i32)
   i32.const 5
   local.set $max
   i32.const 0
   local.set $counter
   block $done
   loop $repeat
   local.get $counter
    call $write_i32
    i32.const 10
    call $write_char
    local.get $counter
    i32.const 1
    i32.add
    local.set $counter
    local.get $counter
    local.get $max
    i32.le_s
    br_if $repeat
    br $done
    
    

   ;; add your code here
   end $repeat
   end $done
   i32.const 42
 )
)