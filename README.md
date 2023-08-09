# Tema Arhitectura sistemelor de calcul


## Formularea temei
Fie G = (V, E) un graf orientat, unde V este multimea varfurilor, E multimea muchiilor orientate,
iar AD(G) matricea de adiacenta asociata acestuia. Ne propunem sa determinam cate drumuri de
lungime k (k indica numarul muchiilor) exista intre doua noduri i si j, (i, j) ∈ V
2
, unde un drum este
o secventa i → k0 → k1... → kn → j, unde (i, k0) ∈ E∧(kp, kp+1) ∈ E, ∀p ∈ {0, 1, ..., n−1}∧(kn, j) ∈
E.

Pentru exemplificare, vom considera graful orientat de mai jos, definit prin:

      G = (V := {A, B, C, D}, E := {(A, B); (A, C); (B, C); (B, D); (C, D)})

Reprezentarea vizuala a acestui graf este urmatoarea:

![image](https://github.com/teodorma/Tema_ASC_Sem1/assets/108132918/118c79a5-57db-4042-9007-e93489a8f381)


Matricea de adiacenta asociata este 
AD(G) :=

     0 1 1 0
     0 0 1 1
     0 0 0 1
     0 0 0 0

Daca vrem sa determinam cate drumuri de lungime k = 1 gasim intre doua varfuri, atunci gasim
deja aceasta informatie in AD(G).

Presupunem ca vrem sa determinam toate drumurile de lungime k = 2 din acest graf. Daca ne
uitam strict la reprezentare, drumurile sunt urmatoarele:

    • A - B - C
    • A - B - D
    • A - C - D
    • B - C - D
Am gasit ca de la A la C exista un singur drum de lungime 2, de la A la D sunt doua drumuri
de lungime 2, respectiv de la B la D exista un singur drum de lungime 2. Putem reprezenta aceasta
informatie tot matriceal:
D2 =
  
    0 0 1 2
    0 0 0 1
    0 0 0 0
    0 0 0 0


Sa presupunem ca vrem sa determinam toate drumurile de lungime k = 3. Din nou, analizand
reprezentarea grafului, gasim ca singura varianta este A - B - C - D. In reprezentare matriceala,
D3 =

    0 0 0 1
    0 0 0 0
    0 0 0 0
    0 0 0 0

Pentru orice alt k ≥ 4, fiecare Dk = 04 (matricea patratica 4 × 4 cu toate elementele egale cu 0),
intrucat nu exista niciun drum de lungime 4 sau cu lungime mai mare decat 4.

Intrebarea este daca exista o relatie intre AD(G) si D2, intre AD(G) si D3 si, in general, intre
AD(G) si Dp, pentru orice p ∈ N∗.

Observam ca matricea

    0 0 1 2
    0 0 0 1
    0 0 0 0
    0 0 0 0

= D2 := AD2
(G) =

    0 1 1 0     0 1 1 0
    0 0 1 1  x  0 0 1 1
    0 0 0 1     0 0 0 1
    0 0 0 0     0 0 0 0



Analog, observam ca
    
    0 0 0 1
    0 0 0 0
    0 0 0 0
    0 0 0 0

= D3 := AD^3
(G) = D2 · AD(G) =

    0 0 1 2     0 1 1 0
    0 0 0 1  x  0 0 1 1
    0 0 0 0     0 0 0 1
    0 0 0 0     0 0 0 0


Atunci, in caz general, intre nodurile (i, j) ∈ V
2
exista un drum de lungime k daca in AD^k
(G) pe
pozitia (i, j) exista o valoare diferita de 0; in acest caz, valoarea ne indica exact numarul de drumuri
existente.
