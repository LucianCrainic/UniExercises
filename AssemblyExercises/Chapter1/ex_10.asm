# ----> ITALIAN <----
# Un utente introduce da tastiera due numeri interi 
# (INIT e LUNG). Il programma in linguagguo assembly MIPS 
# deve stampare una serie di numeri interi consecutivi. 
# La serie inizia al valore INIT ed è lunga LUN elementi.
# Esempio:
# INPUT:
# 7
# 4
# OUTPUT: 7 8 9 10

.eqv CONT $t0 
.eqv INCR $t2

.text
.globl main
main:
	li $v0,5 # INPUT NUMERO 1 DA TASTIERA = INIZIO
	syscall
	move $t3,$v0
	
	li $v0,5 # INPUT NUMERO 2 DA TASTIERA = LUNGHEZZA
	syscall
	move $t4,$v0
	
	li CONT,1 # INIZIALIZZAZIONE DEL CONTATORE
	lw $t1, limite # CARICO IL VALORE 0 NEL REGISTRO T1
	add $t6,$t1,$t4 # SOMMO IL LIMITE CHE VALE 0 CON IL VALORE IN t4 CHE SAREBBE LA LUNGHEZZA 
	li INCR,1 # ASSEGNAZIONE DEL PASSO DI INCREMENTO 
	move $a0,$t3 # SCRIVO IN OUTPUT IL VALORE INIZIALE DELLA SEQUENZA, OVVERO QUELLO CHE DO IN INPUT A t3
	li $v0,1
	syscall
	
FOR: bge CONT, $t6, END_FOR # IL FOR HA COME INIZIALIZZAZIONE DEL CONTATORE A 1, LA CONDIZIONE MAGGIORE O UGUALE AL 
			    # VALORE DEL LIMITE OVVERO LA LUNGHEZZA E INCREMENTO IL CONTATORE DI UNO AD OGNI CICLO

	la $a0, newLine # QUESTA PARTE SERVE SOLO PER RENDERE L'OUTPUT SULLA CONSOLE IN MODO PIU CHIARO
	addi  $v0,$0, 4 
	syscall

	add $t7,$t3,1 # AGGIUNO AL VALORE INIZIALE UNO
	move $t3,$t7 # SPOSTO IL VALORE OTTENUTO DALLA SOMMA DA t7 IN t3 COSI POI AL PROSSIMO CICLO SOMMO AD ESSO UNO
	move $a0,$t3 # SPOSTO IL VALORE IN t3 in a0 PER POTERLO STAMPARE SU CONSOLE
	li $v0,1 # STAMPO IN CONSOLE IL RISULTATO DELLA SOMMA
	syscall
	add CONT,CONT,INCR # INCREMENTO IL CONTATORE DI UNO
	j FOR # JUMP PER TORNARE AL FOR E RICOMINCIARE IL CICLO SE POSSIBILE

END_FOR:
	li $v0,10 # CHIUDO IL PROGRAMMA 
	syscall
 
 
  
.data 
limite: .word 0
newLine: .asciiz "\n"
