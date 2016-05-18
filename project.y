%{
    #include <stdio.h>

    /* Prenenné použité v programe. */
    int counter_if    = 0;
    int counter_depth = 0;

    /* Funkcie použité v programe, definované sú nižšie. */
    void incIf();
    void setDepth();
    void printCounters();

    /* Toto aby nevypisovalo chyby, že už je daná funkcia definovaná. Prečo? Neviem. */
    int yylex();
    void yyerror(const char *s);
%}

%token LBEGIN 
%token LEND 
%token LIF 
%token LTHEN 
%token LP 
%token LV 
%token LSEMICOLON 
%token LDOT 
%token LUNKNOWN 

%start PROGRAM 

%%
PROGRAM: LBEGIN STATEMENTS LEND LDOT 
STATEMENTS: STATEMENT LSEMICOLON STATEMENTS {setDepth($1);} 
          | /* akože epsilon */
          ;  
STATEMENT: LIF LV LTHEN STATEMENT           {incIf(); $$ = $4 + 1;} 
         | LP                               {$$ = 1;} 
         ; 
%%

void yyerror(const char *s){
    /* nechcem aby sa vypisovala chyba */
}

void incIf() {
    counter_if++;
}

void setDepth(int depth){
    if (depth > counter_depth) counter_depth = depth;
}

void printCounters() {
    printf("Pocet prikazov if: %d\n", counter_if);
    printf("Maximalna hlbka vnorenia prikazu p: %d\n", counter_depth);
}

int main() {
    printf("Vstupy na testovanie z PDF-ka: \n");
    printf("begin p; p; end.\n");
    printf("begin end.\n");
    printf("begin if v then p; end.\n");
    printf("begin p; if v then if v then p; p; end.\n");
    printf("begin begin end.\n");
    printf("begin if v then p; if v then p; end.\n\n");

    printf("Zadajte vstup:\n");

    if (0 != yyparse()) {
        printf("\nProgram bol syntakticky nespravny.\n");
        return 0;
    }

    printf("\nProgram bol syntakticky spravny.\n");
    printCounters();
    return 0;
}
