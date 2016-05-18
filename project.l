/*
Všade som pridal prefix L aby nevznikali kolízie, napr. čisto token BEGIN nemôžeme použiť.
*/

%{
    #include "project.tab.h"
%}

%%
[ \t]+ 
[b][e][g][i][n] return(LBEGIN);
[e][n][d]       return(LEND);
[i][f]          return(LIF);
[t][h][e][n]    return(LTHEN);
[p]             return(LP);
[v]             return(LV);
[;]             return(LSEMICOLON);
[.]             return(LDOT);
[\n]            yyterminate();
.               return(LUNKNOWN);
%%
