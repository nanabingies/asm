
.model flat, c
.code

; extern "C" void try(int a, int b, int c, int* s1, int* s2, int* s3);
;
; Description: This function demonstrates a complete assembly
; language prolog and epilog.
;
; Returns: None.
;
; Computes: *s1 = a + b + c
; *s2 = a * a + b * b + c * c
; *s3 = a * a * a + b * b * b + c * c * c

trial proc
	push ebp
	mov ebp, esp
	sub esp, 12
	push ebx

	mov eax, [ebp+8]
	add eax, [ebp+12]
	add eax, [ebp+16]
	mov [ebp-4], eax				; save s1

	mov eax, [ebp+8]
	imul eax, eax
	mov ecx, [ebp+12]
	imul ecx, ecx
	mov edx, [ebp+16]
	imul edx, edx
	mov ebx, eax
	add ebx, ecx
	add ebx, edx
	mov [ebp-8], ebx				; save s2

	imul eax, [ebp+8]
	imul ecx, [ebp+12]
	imul edx, [ebp+16]
	mov ebx, eax
	add ebx, ecx
	add ebx, edx
	mov [ebp-12], ebx				; save s3

	mov eax, [ebp-4]				; s1
	mov ebx, [ebp+20]
	mov [ebx], eax
	mov eax, [ebp-8]
	mov ebx, [ebp+24]
	mov [ebx], eax
	mov eax, [ebp-12]
	mov ebx, [ebp+28]
	mov [ebx], eax

	pop ebx
	mov esp, ebp
	pop ebp
	ret

trial endp

end