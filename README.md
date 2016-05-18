# Príklad na predmet Jazyky a kompilátory

## Zadanie

**V prostredí Flex/Bison zostrojte ku danej gramatike syntaktický analyzátor.**

### Výstup sémantického spracovania
1. Veta „Program bol syntakticky spravny.“ alebo „Program nebol syntakticky spravny.“
1. V prípade syntakticky správneho programu:
	- Počet príkazov if: X
	- Maximálna hĺbka vnorenia príkazu p: X

### Gramatika
1. PROGRAM → begin PRIKAZY end .
1. PRIKAZY → PRIKAZ ; PRIKAZY
1. PRIKAZY → (prázdny znak)
1. PRIKAZ  → if v then PRIKAZ
1. PRIKAZ  → p

### Terminály
begin, end, if, then, p, v, .(bodka), ;(bodkočiarka)

### Neterminály
PROGRAM, PRIKAZY, PRIKAZ

### Začiatočný symbol
PROGRAM

## Inštalácia Flex-u a Bison-u

```
sudo dnf install flex bison
```

## Kompilácia projektu do programu

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

## Spustenie skompilovaného programu

```
./project
```

## Zmazanie skompilovaných súborov a programu

V súbore makefile je zadefinované čistenie, ktoré sa spúšťa príkazom:
```
make clean
```
