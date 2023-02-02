
.model flat, c

.data
arr dword 1, 2, 3, 4, 5

.code

trial_ proc
	push ebp
	mov ebp, esp
	push ebx

	mov ecx, [ebp + 8]
	mov ebx, offset arr
	mov eax, [ebx + ecx * 4]
	mov edx, [ebp + 12]
	mov [edx], eax

	pop ebx
	mov esp, ebp
	pop ebp
	ret
trial_ endp

end