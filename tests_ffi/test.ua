# Experimental!

LibPath ← ⊡1&args
Lib     ← &ffi ⊂LibPath

⍤⟜≍: 8 Lib {"int" "add" "int" "int"} {3 5}
⍤⟜≍: 13 Lib {"int" "strlen" "const char*"} {"Hello, World!"}
⍤⟜≍: [3 2 1] Lib {"void" "reverse" "int:1" "int"} {[1 2 3]}
⍤⟜≍: [3 2 1] Lib {"int:1" "reversed" "const int:1" "int"} {[1 2 3]}
⍤⟜≍: {1 [2 3]} Lib {"int" "head_tail" "int:1" "int*"} {[1 2 3]}
⍤⟜≍: [0 1 2 3] Lib {"void" "multi_list" "const int:1" "int" "const int:3" "int" "int:5" "int"} {1_2 3_4 [...0]}
⍤⟜≍: "Hello, World!" Lib {"void" "change_string" "const char**"} {"xxx"}
⍤⟜≍: "1 + 2 = 3" Lib {"void" "change_string_to_sum" "int" "int" "const char**"} {1 2 "xxx"}

VecII ← "{double; double}"
⍤⟜≍: 5 Lib {"double" "vec2_len" VecII} {[3 4]}
⍤⟜≍: 5 Lib {"double" "vec2_len_ref" $"const _*"VecII} {[3 4]}
⍤⟜≍: [4 6] Lib {VecII "vec2_add" VecII VecII} {[1 2] [3 4]}
⍤⟜≍: [1 0] Lib {"void" "vec2_normalize" $"_*" VecII} {[5 0]}
⍤⟜≍: [9 12] Lib {VecII "vec2_list_sum" $"const _:1"VecII "int"} {[1_2 3_4 5_6]}
⍤⟜≍: [5_6 3_4 1_2] Lib {"void" "vec2_list_reverse" $"_:1"VecII "int"} {[1_2 3_4 5_6]}

Person ← "{const char*; int}"
⍤⟜≍: {"Dave" 31} Lib {Person "person_new" "const char*" "int"} {"Dave" 31}
⍤⟜≍: {"Dave" 31} Lib {⊂⊙@*Person "person_new_ptr" "const char*" "int"} {"Dave" 31}
⍤⟜≍: 31 Lib {"int" "person_val_age" Person} {{"Dave" 31}}
⍤⟜≍: 31 Lib {"int" "person_ptr_age" $"const _*"Person} {{"Dave" 31}}
TwoPeople ← $"{_; _}" .Person
⍤⟜≍ {{"a" 1} {"b" 2}} Lib {TwoPeople "two_people_new" Person Person} {{"a" 1} {"b" 2}}
TwoPeoplePtrs ← $"{_*; _*}" .Person
⍤⟜≍ {{"a" 1} {"b" 2}} Lib {TwoPeoplePtrs "two_people_new_ptr" .$"const _*"Person} {{"a" 1} {"b" 2}}
TwoInts ← "{const int*; const int*}"
⍤⟜≍: {1 2} Lib {TwoInts "two_ints_new" "const int*" "const int*"} {1 2}

⍤⟜≍: [1 2 3] ⊃&memfree(&memcpy "int"⊙3) Lib {"int*" "array_ptr" "const int:1" "int"} {[1 2 3]}

MDF ← Lib {"const unsigned char*" "dummy_md5" "const unsigned char:1" "unsigned long" "const unsigned char*"}
⍤⟜≍: "hello" &memcpy "char":5 MDF {"hello" NULL}
MDF ← Lib {"const unsigned char*" "dummy_md5" "const unsigned char:1" "unsigned long" "unsigned char*"}
⍤⟜≍: {"hello" NULL} ⍜(°□⊢|&memcpy "char":5) MDF {"hello" NULL}
⍤⟜≍: {.utf₈"hello"} ⍚(&memcpy "unsigned char":5) MDF {"hello" ▽5 0}

VoidStruct ← "{void*; void*}"
⍤⤙≍ {NULL NULL} Lib {VoidStruct "make_void_struct" "int"} {5}
°□₂ Lib {VoidStruct "make_void_struct_a" "int"} {5}
⍤⤙≍ [5] ⊃&memfree(&memcpy "int"⊙1)
⍤⤙≍ NULL
