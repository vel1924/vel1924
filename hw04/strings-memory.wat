(module
 (import "" "write_i32"  (func $write_i32  (param i32)))
 (import "" "write_i32x" (func $write_i32x (param i32)))
 (import "" "write_i32b" (func $write_i32b (param i32)))
 (import "" "write_char" (func $write_char (param i32)))
 (memory (export "memory") 1)
 ;;(data (offset (i32.const 16)) "Hello world!\00")
( func $copy_string_nul_terminated (param $src i32) (param $dst i32)
   (local $ch i32)

   block $done
     loop $repeat
       local.get $src
       i32.load8_u
       local.set $ch

       local.get $dst
       local.get $ch
       i32.store8

       local.get $ch
       i32.eqz
       br_if $done

       local.get $src
       i32.const 1
       i32.add
       local.set $src

       local.get $dst
       i32.const 1
       i32.add
       local.set $dst

       br $repeat
     end $repeat
   end $done
 )
 (func $run (export "run") (result i32)
   ;; the string begins at address 16 in memory
 (local $n i32)
 (local $m i32)
 i32.const 0
 local.set $n
 i32.const 160
 local.set $m
 block $done
 loop $rep
 local.get $n
 local.get $m
 i32.eq
 br_if $done
local.get $n
local.get $m
   call $copy_string_nul_terminated
    local.get $m
       i32.const -1
       i32.sub
   local.set $m
  local.get $n
       i32.const 1
       i32.add
       local.set $n

   end $rep
   end $done
   i32.const 0
 )
)
