# Príklad na predmet Jazyky a kompilátory #

## Zadanie ##

**V prostredí Flex/Bison zostrojte ku danej gramatike syntaktický analyzátor.**

**Výstup sémantického spracovania:**
1. Veta „Program bol syntakticky spravny.“ alebo „Program nebol syntakticky spravny.“
2. V prípade syntakticky správneho programu:
	- Počet príkazov if: X
	- Maximálna hĺbka vnorenia príkazu p: X

**Gramatika:**
1. PROGRAM → begin PRIKAZY end .
2. PRIKAZY → PRIKAZ ; PRIKAZY
3. PRIKAZY → (prázdny znak)
4. PRIKAZ  → if v then PRIKAZ
6. PRIKAZ  → p

**Terminály:** begin, end, if, then, p, v, .(bodka), ;(bodkočiarka)

**Neterminály:** PROGRAM, PRIKAZY, PRIKAZ

**Začiatočný symbol:** PROGRAM

## Inštalácia ##

```
sudo dnf install flex bison
```

## Kompilácia ##

Program sa skompiluje spustením príkazu `make` ak sa tam nachádza súbor makefile.

Ak by nastala nasledovná chyba:
```
/usr/bin/ld: cannot find -ly
/usr/bin/ld: cannot find -lfl
collect2: error: ld returned 1 exit status
makefile:17: recipe for target 'project' failed
make: *** [project] Error 1
```
Je potrebné nainštalovať developer súčasti flex-u a bison-u:
```
sudo dnf install flex-devel bison-devel
```

## Spustenie ##

```
./project
```