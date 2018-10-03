; ModuleID = 'internal_module.o'
source_filename = "internal_module.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$inner_fn = comdat any

$sancov.module_ctor = comdat any

@str = private unnamed_addr constant [14 x i8] c"Hello, world!\00"
@__sancov_lowest_stack = external thread_local(initialexec) global i64
@__sancov_gen_ = private global [3 x i32] zeroinitializer, section "__sancov_guards", comdat($inner_fn), align 4, !associated !0
@__start___sancov_guards = external hidden global i32*
@__stop___sancov_guards = external hidden global i32*
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 2, void ()* @sancov.module_ctor, i8* bitcast (void ()* @sancov.module_ctor to i8*) }]
@llvm.compiler.used = appending global [1 x i8*] [i8* bitcast ([3 x i32]* @__sancov_gen_ to i8*)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define dso_local void @inner_fn(i32 %param) local_unnamed_addr #0 comdat !dbg !9 {
entry:
  call void @__sanitizer_cov_trace_pc_guard(i32* getelementptr inbounds ([3 x i32], [3 x i32]* @__sancov_gen_, i32 0, i32 0)), !dbg !15
  call void asm sideeffect "", ""(), !dbg !15
  call void @llvm.dbg.value(metadata i32 %param, metadata !14, metadata !DIExpression()), !dbg !16
  %tobool = icmp eq i32 %param, 0, !dbg !17
  br i1 %tobool, label %entry.if.end_crit_edge, label %if.then, !dbg !19

entry.if.end_crit_edge:                           ; preds = %entry
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([3 x i32]* @__sancov_gen_ to i64), i64 4) to i32*)), !dbg !19
  call void asm sideeffect "", ""(), !dbg !19
  br label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc_guard(i32* inttoptr (i64 add (i64 ptrtoint ([3 x i32]* @__sancov_gen_ to i64), i64 8) to i32*)), !dbg !20
  call void asm sideeffect "", ""(), !dbg !20
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str, i64 0, i64 0)), !dbg !20
  br label %if.end, !dbg !22

if.end:                                           ; preds = %if.then, %entry.if.end_crit_edge
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #2

declare void @__sanitizer_cov_trace_pc_indir(i64)

declare void @__sanitizer_cov_trace_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_const_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_const_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_const_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_const_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_div4(i32 zeroext)

declare void @__sanitizer_cov_trace_div8(i64)

declare void @__sanitizer_cov_trace_gep(i64)

declare void @__sanitizer_cov_trace_switch(i64, i64*)

declare void @__sanitizer_cov_trace_pc()

declare void @__sanitizer_cov_trace_pc_guard(i32*)

declare void @__sanitizer_cov_trace_pc_guard_init(i32*, i32*)

define internal void @sancov.module_ctor() comdat {
  call void @__sanitizer_cov_trace_pc_guard_init(i32* bitcast (i32** @__start___sancov_guards to i32*), i32* bitcast (i32** @__stop___sancov_guards to i32*))
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{void (i32)* @inner_fn}
!1 = distinct !DICompileUnit(language: DW_LANG_C99, file: !2, producer: "clang version 8.0.0 (git@github.com:rust-lang-nursery/clang.git d0fc1788123de9844c8088b977cd142021cea1f2) (git://github.com/llvm-mirror/llvm 58c3a74c2c1382be27547ff355b8144762368806)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, nameTableKind: None)
!2 = !DIFile(filename: "internal_module.c", directory: "/home/aaron/repos/llvm_lto_bug")
!3 = !{}
!4 = !{i32 2, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 1, !"ThinLTO", i32 0}
!8 = !{!"clang version 8.0.0 (git@github.com:rust-lang-nursery/clang.git d0fc1788123de9844c8088b977cd142021cea1f2) (git://github.com/llvm-mirror/llvm 58c3a74c2c1382be27547ff355b8144762368806)"}
!9 = distinct !DISubprogram(name: "inner_fn", scope: !2, file: !2, line: 3, type: !10, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: true, unit: !1, retainedNodes: !13)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DILocalVariable(name: "param", arg: 1, scope: !9, file: !2, line: 3, type: !12)
!15 = !DILocation(line: 3, scope: !9)
!16 = !DILocation(line: 3, column: 19, scope: !9)
!17 = !DILocation(line: 4, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !2, line: 4, column: 9)
!19 = !DILocation(line: 4, column: 9, scope: !9)
!20 = !DILocation(line: 5, column: 9, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !2, line: 4, column: 16)
!22 = !DILocation(line: 6, column: 5, scope: !21)
!23 = !DILocation(line: 7, column: 1, scope: !9)

^0 = module: (path: "internal_module.o", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "str", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 1, live: 0, dsoLocal: 1)))) ; guid = 1752258582345015968
^2 = gv: (name: "llvm.global_ctors", summaries: (variable: (module: ^0, flags: (linkage: appending, notEligibleToImport: 1, live: 1, dsoLocal: 0), refs: (^20)))) ; guid = 2412314959268824392
^3 = gv: (name: "__sanitizer_cov_trace_const_cmp8") ; guid = 2473145876016219888
^4 = gv: (name: "__sanitizer_cov_trace_cmp4") ; guid = 5018646996130850444
^5 = gv: (name: "__sancov_lowest_stack") ; guid = 6654216280168409139
^6 = gv: (name: "__start___sancov_guards") ; guid = 6799398565936623177
^7 = gv: (name: "__sancov_gen_", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 1, live: 0, dsoLocal: 1)))) ; guid = 6927588600395777354
^8 = gv: (name: "__sanitizer_cov_trace_switch") ; guid = 7061704830261766840
^9 = gv: (name: "llvm.dbg.value") ; guid = 7457163675545648777
^10 = gv: (name: "__sanitizer_cov_trace_cmp2") ; guid = 8451427915961062607
^11 = gv: (name: "puts") ; guid = 8979701042202144121
^12 = gv: (name: "__sanitizer_cov_trace_pc") ; guid = 9061209228041926790
^13 = gv: (name: "llvm.compiler.used", summaries: (variable: (module: ^0, flags: (linkage: appending, notEligibleToImport: 1, live: 1, dsoLocal: 0), refs: (^7)))) ; guid = 9610627770985738006
^14 = gv: (name: "__sanitizer_cov_trace_const_cmp2") ; guid = 10580386791518891738
^15 = gv: (name: "__sanitizer_cov_trace_div8") ; guid = 11566840411063362728
^16 = gv: (name: "__sanitizer_cov_trace_const_cmp4") ; guid = 12446786791515449308
^17 = gv: (name: "__sanitizer_cov_trace_cmp1") ; guid = 13525610201317726004
^18 = gv: (name: "__sanitizer_cov_trace_pc_guard_init") ; guid = 13597560502212403216
^19 = gv: (name: "__sanitizer_cov_trace_cmp8") ; guid = 14167442291085246584
^20 = gv: (name: "sancov.module_ctor", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 1, live: 0, dsoLocal: 1), insts: 2, calls: ((callee: ^18)), refs: (^21, ^6)))) ; guid = 15519873793823047513
^21 = gv: (name: "__stop___sancov_guards") ; guid = 15940490427905992113
^22 = gv: (name: "inner_fn", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 1, live: 0, dsoLocal: 1), insts: 12, calls: ((callee: ^24), (callee: ^11)), refs: (^7, ^1)))) ; guid = 15977235462198696358
^23 = gv: (name: "__sanitizer_cov_trace_div4") ; guid = 16253657737629886783
^24 = gv: (name: "__sanitizer_cov_trace_pc_guard") ; guid = 17067797485420006302
^25 = gv: (name: "__sanitizer_cov_trace_pc_indir") ; guid = 17461222965458560480
^26 = gv: (name: "__sanitizer_cov_trace_const_cmp1") ; guid = 17774338629471938427
^27 = gv: (name: "__sanitizer_cov_trace_gep") ; guid = 17989816636015774849
