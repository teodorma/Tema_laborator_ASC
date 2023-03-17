.data
	nrCerinta: .space 4
	n: .space 4
    m1: .space 1600
    m2: .space 1600
    mres: .space 1600
    k: .space 4
    sursa: .space 4
    destinatie: .space 4
	index: .space 4
	index2: .long 0
	columnIndex: .space 4
	lineIndex: .space 4
	i: .space 4
	j: .space 4
	left: .space 4
	right: .space 4
	formatScanf: .asciz "%ld"
	Printfmatr: .asciz "%ld "
	printfk: .asciz "%ld"
	newLine: .asciz "\n"
	a: .space 4

.text

matrix_mult:
        pushl %ebp
        mov %esp, %ebp
        pushl %ebx
        pushl %esi
        pushl %edi
        
        movl 8(%ebp), %edi
        movl 12(%ebp), %esi
        
        subl $16, %esp
        movl $0, -4(%ebp) #i
        movl $0, -8(%ebp) #j
        movl $0, -12(%ebp) #k
        

        for1:
            movl -4(%ebp), %eax
            cmpl %eax, 20(%ebp) #n
            je exit_proc
            movl $0, -8(%ebp)
            movl $0, -12(%ebp)
            for2:
                movl -8(%ebp), %eax
                cmpl %eax,20(%ebp)
                je for1_next
                movl $0, -12(%ebp)
                movl $0, -16(%ebp)
                for3:
                    movl -12(%ebp), %eax
                    cmpl %eax, 20(%ebp)
                    je for2_next
                     
                    movl -4(%ebp), %eax
                    mull 20(%ebp)               #m1
                    addl -12(%ebp), %eax
                    
                    movl (%edi, %eax, 4), %ecx
                                        
                    movl -12(%ebp), %eax
                    mull 20(%ebp)               #m2
                    addl -8(%ebp), %eax
                    
                    movl (%esi, %eax, 4), %edx
                    
                    movl %edx, %eax
                    mull %ecx
                    addl %eax, -16(%ebp)  
                    
                    incl -12(%ebp)   
                    jmp for3
            for2_next:
                movl -4(%ebp), %eax
                mull 20(%ebp)               #mres
                addl -8(%ebp), %eax
                
                movl -16(%ebp), %ecx
                
                movl 16(%ebp), %edx
                movl %ecx,(%edx,%eax,4)

                incl -8(%ebp)
                jmp for2
        for1_next:
            incl -4(%ebp)
            jmp for1
            
        exit_proc:
        addl $16, %esp
        popl %esi
        popl %esi
        popl %esi
        popl %ebx
        ret

.global main
main:
        pusha
	push $nrCerinta
	push $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	push $n
	push $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $0, index
        movl $0, index2

et_for0:
	movl index, %ecx
	cmp %ecx, n
	je et_for1
	
	pusha
	push $i
	push $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	popa
	
	
	movl i, %ebx
	movl %ebx, (%esi, %ecx, 4)
	incl index
	jmp et_for0
	
et_for1: 
        movl index2, %ecx
	cmp %ecx, n
	je et_cerinta
	
	movl (%esi, %ecx, 4),%ebx
	et_for2:
		cmpl $0,%ebx
		je et_for1_next
		
		pusha
		push $j
		push $formatScanf
		call scanf
		popl %ebx
		popl %ebx
		popa
		
                 movl index2, %eax
                 mull n
                 addl j, %eax
                 
                 lea m1, %edi
                 movl $1, (%edi, %eax, 4)

		decl %ebx
		jmp et_for2
	et_for1_next:
	incl index2
	jmp et_for1

et_cerinta:
	movl $1, %eax
        cmp nrCerinta, %eax            
	je et_cerinta1
	jmp et_cerinta2	

et_cerinta1:
	jmp et_afis_matr

et_cerinta2:
        pushl $k
        pushl $formatScanf
        call scanf
        popl %ebx
        popl %ebx
        
        pushl $sursa
        pushl $formatScanf
        call scanf 
        popl %ebx
        popl %ebx 
        
        pushl $destinatie
        pushl $formatScanf
        call scanf 
        popl %ebx
        popl %ebx
        
        movl $0, i
        movl $1, index
        movl $0, index2
        movl n, %eax
        mull n
        movl %eax, %ecx
        movl %ecx, index2
        movl $0, %eax
        
        et_loop1: 
                movl i, %ecx
	        cmp %ecx, index2
                je et_loop2

                movl i, %eax
                addl $1, %eax
                     
                lea m1, %edi
                lea m2, %esi
                movl (%edi, %eax, 4), %ebx
                movl %ebx, (%esi, %eax, 4)
                incl i
        	       jmp et_loop1
            
          et_loop2:
	       movl index, %ecx
	       cmp %ecx, k
	       je et_afisare_k
              
               push n
               push $mres
               push $m2
               push $m1
               call matrix_mult
               popl %ebx
               popl %ebx
               popl %ebx
	       popl %ebx
                
               movl $0, i
               et_loop3:
                    movl i, %ecx
	            cmp %ecx, index2
                    je et_loop2_next

                    movl i, %eax
                    addl $1, %eax
                     
                    lea mres, %edi
                    lea m1, %esi
                    movl (%edi, %eax, 4), %ebx
                    movl %ebx, (%esi, %eax, 4)
                    incl i
        	    jmp et_loop3
                et_loop2_next:
                incl index
                jmp et_loop2
               
           et_afisare_k:
               lea mres, %edi
               movl sursa, %eax
               mull n
               addl destinatie, %eax
               movl (%edi, %eax, 4), %ecx
               movl %ecx, j
               push j
               push $printfk
               call printf
               popl %ebx
               popl %ebx
               
               push $0
               call fflush
               popl %ebx
               
               jmp et_exit

et_afis_matr:
	movl $0, lineIndex
	for_lines:
		movl lineIndex, %ecx
		cmp %ecx, n
		je et_exit
		movl $0, columnIndex
		for_columns:
			movl columnIndex, %ecx
			cmp %ecx, n
			je cont

			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			
			lea m1, %edi
			movl (%edi, %eax, 4), %ebx
			pushl %ebx
			pushl $Printfmatr
			call printf
			popl %ebx
			popl %ebx
			pushl $0
			call fflush
			popl %ebx
			incl columnIndex
			jmp for_columns
			
	cont:
	movl $4, %eax
	movl $1, %ebx
	movl $newLine, %ecx
	movl $0, %edx
	int $0x80
	incl lineIndex
	jmp for_lines

et_exit:
movl $1, %eax
movl $0, %ebx
int $0x80



