# Cerinte

In cadrul acestei teme aveti trei cerinte - o cerinta pentru 5p, una pentru 3p, respectiv o cerinta
pentru alte 2p.

Important! NU dati inputul manual la fiecare retestare a programului! Sunt inputuri lungi,
care va vor costa timp. Creati-va un fisier, de exemplu input.txt, in care scrieti inputul dorit,
iar dupa ce aveti un executabil, de exemplu cerinta1, pe care in mod normal l-ati fi rulat cu
./cerinta1, rulati comanda ./cerinta1 < input.txt. Astfel, continutul din fisier va fi redirectat
la STDIN, exact ca atunci cand ati fi introdus manual valorile. Folositi aceasta informatie si pentru
a va testa mai multe inputuri, creandu-va fisiere input0.txt, input1.txt etc., si testandu-le cu
./cerinta1 < input0.txt, ./cerinta1 < input1.txt etc.

## Cerinta 1 - 5p

Se citesc de la tastatura (STDIN) listele de adiacenta ale grafului orientat G si se cere sa se
afiseze matricea de adiacenta. Astfel, se vor citi, cate o valoare pe linie:

• 1 reprezentand numarul cerintei; pentru cerintele 2 si 3, aceasta valoare va fi 2, respectiv 3;

• N <= 100 numarul de noduri ale grafului;

• N linii pe care se vor afla valorile M0, M1, ..., MN−1, reprezentand numarul de legaturi pentru
fiecare nod in parte;

• M0 linii pe care se vor afla vecinii nodului 0, apoi M1 linii pe care se vor afla vecinii nodului
1, ..., apoi MN−1 linii pe care se vor afla vecinii nodului N-1.

De exemplu, pentru graful din Sectiunea 2, considerand nodurile A = 0, B = 1, C = 2, D =
3, inputul ar avea urmatoarea forma (evident, fara comentariile din dreapta, acestea au fost puse
pentru a va fi clar ce inseamna fiecare valoare):
    
    1 // numarul cerintei 
    4 // nr. noduri
    2 // 0 are 2 legaturi (cu 1 si 2)
    2 // 1 are 2 legaturi (cu 2 si 3)
    1 // 2 are 1 legatura (cu 3)
    0 // 3 nu are nicio legatura
    1 // legaturile
    2 // nodului 0
    2 // legaturile
    3 // nodului 1
    3 // legatura nodului 2

In urma primirii acestui input, se va afisa la STDOUT urmatorul output:

    0 1 1 0
    0 0 1 1
    0 0 0 1
    0 0 0 0
reprezentand matricea de adiacenta construita.

## Cerinta 2 - 3p
Pentru aceasta cerinta, se vor citi de la STDIN listele de adiacenta exact ca la Cerinta 1, se
va construi in spate matricea de adiacenta si se va calcula numarul de drumuri de lungime
k dintre doua noduri date, unde k = lungimea, i = nodul sursa, respectiv j = nodul destinatie
vor fi specificate in input.

Un exemplu de input este urmatorul (ca la cerinta anterioara, inputul este format doar din
valorile numerice din stanga, in dreapta sunt comentarii care sa va ajute sa intelegeti ce reprezinta
fiecare valoare):

    2 // numarul cerintei
    4 // nr. noduri
    2 // 0 are 2 legaturi (cu 1 si 2)
    2 // 1 are 2 legaturi (cu 2 si 3)
    1 // 2 are 1 legatura (cu 3)
    0 // 3 nu are nicio legatura
    1 // legaturile
    2 // nodului 0
    2 // legaturile
    3 // nodului 1
    3 // legatura nodului 2
    2 // lungimea drumului
    0 // nodul sursa
    3 // nodul destinatie

Outputul dat la STDOUT va fi, in acest caz, 2. (exista 2 drumuri de la 0 la 3, respectiv de la A
la D in formularea cerintei din sectiunea anterioara).

Pentru rezolvarea acestei cerinte trebuie sa implementati o procedura care sa respecte toate
conventiile prezentate la laborator si in suportul de laborator, cu numele matrix_mult, care sa primeasca doua matrici ca input, patratice si de aceeasi dimensiune, si sa calculeze produsul, stocandu-l
intr-un spatiu definit anterior in sectiunea .data. 

Signatura acestei proceduri va fi matrix_mult(m1, m2, mres, n)
unde m1 si m2 sunt adresele matricelor in memorie, mres este adresa matricei in care se va completa
rezultatul, iar n reprezinta dimensiunea acestora. Daca rezolvarea se face fara implementarea unei
proceduri, sau daca sunt incalcate una sau mai multe dintre conventiile de implementare, NU veti
obtine punctaj.

### _**Important!**_ 
Trebuie ca signatura sa fie respectata strict, NU puteti alege un alt nume
pentru procedura! Veti avea, obligatoriu, o eticheta matrix_mult care va reprezenta adresa de
inceput a procedurii care va rezolva inmultirea. In caz contrar, punctajul pe care il veti obtine la
aceasta cerinta va fi 0.

## Cerinta 3 - 2p

Pentru aceasta cerinta, refaceti Cerinta 2 (deci dati exact acelasi input, dar punand 3 pe prima linie
- corespunzator numarului cerintei), dar de data aceasta alocati spatiul pentru matricea folosita in
mod dinamic, folosind apelul de sistem mmap2.

Aceasta operatie este echivalentul unui malloc din
libc, iar pentru dealocare memoriei echivalentul utilizarii free din libc.
Codul pentru apelul de sistem mmap2 este 192 si asteapta 6 parametri, care vor fi completati in
registrii: eax (192), ebx (0), ecx (dimensiunea de alocat), edx (prot), esi (flags), edi (fd) si ebp (offset).

Pentru a obtine punctajul la aceasta cerinta, pe langa functionalitatea corecta a programului, trebuie
sa scrieti un comentariu pe fiecare linie din apelul de sistem, in care sa explicati ce valoare ati pus
in fiecare dintre acesti registri si de ce.

Gasiti detalii despre felul in care aceast syscall se apeleaza la urmatoarele resurse:

• Tabel de syscall-uri https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html

• Pagina man pentru mmap2 https://www.man7.org/linux/man-pages/man2/mmap2.2.html
