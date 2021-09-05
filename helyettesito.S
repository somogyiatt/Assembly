.intel_syntax noprefix
.data

.text
.global encrypt
encrypt:
	push ebp
	mov ebp, esp 	//prolog
	
	push esi
	push edi
	push ebx
	push edx
	
	xor ebx, ebx	//biztosan uresek legyenek
	xor edi, edi
	xor esi, esi
	xor eax, eax
	xor edx, edx
	xor ecx, ecx
	
	mov eax, [ebp+8]	//1. arg
	mov edi, [ebp+12]	//2. arg

	mov bl, [eax + esi]	
	cmp bl, 0		//ures input
	je ures
	
ciklus:
	xor bl, bl
	xor edx, edx
	
	mov bl, [eax + esi]	//input[0] betoltetse bl-be
	
	cmp bl, 0		//vege van?
	je vege
		
	sub bl, 'a'	
	add dl, [edi+ebx]
				
	mov ecx, [ebp+16]
	mov [ecx + esi], dl
	
	inc esi
	
	jmp ciklus

ures:
	mov ecx, [ebp+16]
			
vege:
	mov [ecx+esi], byte ptr 0
	pop edx
	pop ebx
	pop edi
	pop esi
	
	mov esp, ebp
	pop ebp			//epilog
	ret