
; trial_(int* arr, int* sum, int n)

.code

trial_ proc
	push rbp
	push rbx
	push r13

	xor rbx, rbx				; index
	xor r13, r13				; sum = 0
	xor r11, r11

label_1:
	mov rax, [rcx + rbx]
	mov r10, rdx
	add r13, rax				; sum += arr[index]
	add rbx, 8
	add r11, 1
	cmp r11, r8
	jl label_1
	
	mov [rdx], r13
	mov eax, 1
	pop r13
	pop rbx
	pop rbp
	ret
trial_ endp

end