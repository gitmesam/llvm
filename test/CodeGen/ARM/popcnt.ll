; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=arm-eabi -mattr=+neon %s -o - | FileCheck %s
; Implement ctpop with vcnt

define <8 x i8> @vcnt8(<8 x i8>* %A) nounwind {
; CHECK-LABEL: vcnt8:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcnt.8 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <8 x i8>, <8 x i8>* %A
	%tmp2 = call <8 x i8> @llvm.ctpop.v8i8(<8 x i8> %tmp1)
	ret <8 x i8> %tmp2
}

define <16 x i8> @vcntQ8(<16 x i8>* %A) nounwind {
; CHECK-LABEL: vcntQ8:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcnt.8 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <16 x i8>, <16 x i8>* %A
	%tmp2 = call <16 x i8> @llvm.ctpop.v16i8(<16 x i8> %tmp1)
	ret <16 x i8> %tmp2
}

define <4 x i16> @vcnt16(<4 x i16>* %A) nounwind {
; CHECK-LABEL: vcnt16:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcnt.8 d16, d16
; CHECK-NEXT:    vpaddl.u8 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <4 x i16>, <4 x i16>* %A
	%tmp2 = call <4 x i16> @llvm.ctpop.v4i16(<4 x i16> %tmp1)
	ret <4 x i16> %tmp2
}

define <8 x i16> @vcntQ16(<8 x i16>* %A) nounwind {
; CHECK-LABEL: vcntQ16:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcnt.8 q8, q8
; CHECK-NEXT:    vpaddl.u8 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <8 x i16>, <8 x i16>* %A
	%tmp2 = call <8 x i16> @llvm.ctpop.v8i16(<8 x i16> %tmp1)
	ret <8 x i16> %tmp2
}

define <2 x i32> @vcnt32(<2 x i32>* %A) nounwind {
; CHECK-LABEL: vcnt32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcnt.8 d16, d16
; CHECK-NEXT:    vpaddl.u8 d16, d16
; CHECK-NEXT:    vpaddl.u16 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <2 x i32>, <2 x i32>* %A
	%tmp2 = call <2 x i32> @llvm.ctpop.v2i32(<2 x i32> %tmp1)
	ret <2 x i32> %tmp2
}

define <4 x i32> @vcntQ32(<4 x i32>* %A) nounwind {
; CHECK-LABEL: vcntQ32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcnt.8 q8, q8
; CHECK-NEXT:    vpaddl.u8 q8, q8
; CHECK-NEXT:    vpaddl.u16 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <4 x i32>, <4 x i32>* %A
	%tmp2 = call <4 x i32> @llvm.ctpop.v4i32(<4 x i32> %tmp1)
	ret <4 x i32> %tmp2
}

define <1 x i64> @vcnt64(<1 x i64>* %A) nounwind {
; CHECK-LABEL: vcnt64:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcnt.8 d16, d16
; CHECK-NEXT:    vpaddl.u8 d16, d16
; CHECK-NEXT:    vpaddl.u16 d16, d16
; CHECK-NEXT:    vpaddl.u32 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <1 x i64>, <1 x i64>* %A
	%tmp2 = call <1 x i64> @llvm.ctpop.v1i64(<1 x i64> %tmp1)
	ret <1 x i64> %tmp2
}

define <2 x i64> @vcntQ64(<2 x i64>* %A) nounwind {
; CHECK-LABEL: vcntQ64:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcnt.8 q8, q8
; CHECK-NEXT:    vpaddl.u8 q8, q8
; CHECK-NEXT:    vpaddl.u16 q8, q8
; CHECK-NEXT:    vpaddl.u32 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <2 x i64>, <2 x i64>* %A
	%tmp2 = call <2 x i64> @llvm.ctpop.v2i64(<2 x i64> %tmp1)
	ret <2 x i64> %tmp2
}

declare <8 x i8>  @llvm.ctpop.v8i8(<8 x i8>) nounwind readnone
declare <16 x i8> @llvm.ctpop.v16i8(<16 x i8>) nounwind readnone
declare <4 x i16> @llvm.ctpop.v4i16(<4 x i16>) nounwind readnone
declare <8 x i16> @llvm.ctpop.v8i16(<8 x i16>) nounwind readnone
declare <2 x i32> @llvm.ctpop.v2i32(<2 x i32>) nounwind readnone
declare <4 x i32> @llvm.ctpop.v4i32(<4 x i32>) nounwind readnone
declare <1 x i64> @llvm.ctpop.v1i64(<1 x i64>) nounwind readnone
declare <2 x i64> @llvm.ctpop.v2i64(<2 x i64>) nounwind readnone

define <8 x i8> @vclz8(<8 x i8>* %A) nounwind {
; CHECK-LABEL: vclz8:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vclz.i8 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <8 x i8>, <8 x i8>* %A
	%tmp2 = call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %tmp1, i1 0)
	ret <8 x i8> %tmp2
}

define <4 x i16> @vclz16(<4 x i16>* %A) nounwind {
; CHECK-LABEL: vclz16:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vclz.i16 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <4 x i16>, <4 x i16>* %A
	%tmp2 = call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %tmp1, i1 0)
	ret <4 x i16> %tmp2
}

define <2 x i32> @vclz32(<2 x i32>* %A) nounwind {
; CHECK-LABEL: vclz32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vclz.i32 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <2 x i32>, <2 x i32>* %A
	%tmp2 = call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %tmp1, i1 0)
	ret <2 x i32> %tmp2
}

define <16 x i8> @vclzQ8(<16 x i8>* %A) nounwind {
; CHECK-LABEL: vclzQ8:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vclz.i8 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <16 x i8>, <16 x i8>* %A
	%tmp2 = call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %tmp1, i1 0)
	ret <16 x i8> %tmp2
}

define <8 x i16> @vclzQ16(<8 x i16>* %A) nounwind {
; CHECK-LABEL: vclzQ16:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vclz.i16 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <8 x i16>, <8 x i16>* %A
	%tmp2 = call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %tmp1, i1 0)
	ret <8 x i16> %tmp2
}

define <4 x i32> @vclzQ32(<4 x i32>* %A) nounwind {
; CHECK-LABEL: vclzQ32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vclz.i32 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <4 x i32>, <4 x i32>* %A
	%tmp2 = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %tmp1, i1 0)
	ret <4 x i32> %tmp2
}

declare <8 x i8>  @llvm.ctlz.v8i8(<8 x i8>, i1) nounwind readnone
declare <4 x i16> @llvm.ctlz.v4i16(<4 x i16>, i1) nounwind readnone
declare <2 x i32> @llvm.ctlz.v2i32(<2 x i32>, i1) nounwind readnone

declare <16 x i8> @llvm.ctlz.v16i8(<16 x i8>, i1) nounwind readnone
declare <8 x i16> @llvm.ctlz.v8i16(<8 x i16>, i1) nounwind readnone
declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1) nounwind readnone

define <8 x i8> @vclss8(<8 x i8>* %A) nounwind {
; CHECK-LABEL: vclss8:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcls.s8 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <8 x i8>, <8 x i8>* %A
	%tmp2 = call <8 x i8> @llvm.arm.neon.vcls.v8i8(<8 x i8> %tmp1)
	ret <8 x i8> %tmp2
}

define <4 x i16> @vclss16(<4 x i16>* %A) nounwind {
; CHECK-LABEL: vclss16:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcls.s16 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <4 x i16>, <4 x i16>* %A
	%tmp2 = call <4 x i16> @llvm.arm.neon.vcls.v4i16(<4 x i16> %tmp1)
	ret <4 x i16> %tmp2
}

define <2 x i32> @vclss32(<2 x i32>* %A) nounwind {
; CHECK-LABEL: vclss32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vldr d16, [r0]
; CHECK-NEXT:    vcls.s32 d16, d16
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <2 x i32>, <2 x i32>* %A
	%tmp2 = call <2 x i32> @llvm.arm.neon.vcls.v2i32(<2 x i32> %tmp1)
	ret <2 x i32> %tmp2
}

define <16 x i8> @vclsQs8(<16 x i8>* %A) nounwind {
; CHECK-LABEL: vclsQs8:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcls.s8 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <16 x i8>, <16 x i8>* %A
	%tmp2 = call <16 x i8> @llvm.arm.neon.vcls.v16i8(<16 x i8> %tmp1)
	ret <16 x i8> %tmp2
}

define <8 x i16> @vclsQs16(<8 x i16>* %A) nounwind {
; CHECK-LABEL: vclsQs16:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcls.s16 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <8 x i16>, <8 x i16>* %A
	%tmp2 = call <8 x i16> @llvm.arm.neon.vcls.v8i16(<8 x i16> %tmp1)
	ret <8 x i16> %tmp2
}

define <4 x i32> @vclsQs32(<4 x i32>* %A) nounwind {
; CHECK-LABEL: vclsQs32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vld1.64 {d16, d17}, [r0]
; CHECK-NEXT:    vcls.s32 q8, q8
; CHECK-NEXT:    vmov r0, r1, d16
; CHECK-NEXT:    vmov r2, r3, d17
; CHECK-NEXT:    mov pc, lr
	%tmp1 = load <4 x i32>, <4 x i32>* %A
	%tmp2 = call <4 x i32> @llvm.arm.neon.vcls.v4i32(<4 x i32> %tmp1)
	ret <4 x i32> %tmp2
}

declare <8 x i8>  @llvm.arm.neon.vcls.v8i8(<8 x i8>) nounwind readnone
declare <4 x i16> @llvm.arm.neon.vcls.v4i16(<4 x i16>) nounwind readnone
declare <2 x i32> @llvm.arm.neon.vcls.v2i32(<2 x i32>) nounwind readnone

declare <16 x i8> @llvm.arm.neon.vcls.v16i8(<16 x i8>) nounwind readnone
declare <8 x i16> @llvm.arm.neon.vcls.v8i16(<8 x i16>) nounwind readnone
declare <4 x i32> @llvm.arm.neon.vcls.v4i32(<4 x i32>) nounwind readnone
