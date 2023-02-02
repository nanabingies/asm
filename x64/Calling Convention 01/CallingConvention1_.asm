
	.code
; extern "C" Int64 Cc1_(Int8 a, Int16 b, Int32 c, Int64 d, Int8 e, Int16 f, Int32 g, Int64 h);
;
; Description: The following function illustrates how to create and
; use a basic x86-64 stack frame pointer.

Cc1_ proc frame

; Function prolog
	push rbp					; save caller's rbp register
	.pushreg rbp

	sub rsp, 16					; allocate local storage space
	.allocstack 16

	mov rbp, rsp				; save frame pointer
	.setframe rbp, 0

RBP_RA = 24						; offset from rbp to ret addr
	.endprolog					; mark end of prolog

; Save argument registers to home area (optional)
	mov [rbp + RBP_RA + 8], rcx
	mov [rbp + RBP_RA + 16], rdx
	mov [rbp + RBP_RA + 24], r8
	mov [rbp + RBP_RA + 32], r9

; Sum the argument values a, b, c, and d
	movsx rcx, cl					; rcx = a
	movsx rdx, dx					; rdx = b
	movsxd r8, r8d					; r8 = c
	add rcx, rdx					; rcx = a + b
	add r8, r9						; r8 = c + d
	add r8, rcx						; a + b + c + d
	mov [rbp], r8					; Save result

; Sum the argument values e, f, g, and h
	movsx rcx, byte ptr [rbp + RBP_RA + 40]		; rcx = e
	movsx rdx, word ptr [rbp + RBP_RA + 48]		; rdx = f
	movsxd r8, dword ptr [rbp + RBP_RA + 56]	; r8 = g
	add rcx, rdx								; rcx = e + f
	add r8, qword ptr [rbp + RBP_RA + 64]		; r8 = g + h
	add r8, rcx									; r8 = e + f + g + h

; Compute the final sum
	mov rax, [rbp]
	add rax, r8

; Function epilog
	add rsp, 16									; release stack space
	pop rbp										; restore caller's rbp register
	ret
Cc1_ endp

end