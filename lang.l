%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+		yylval=atoi(yytext); return NUMBER;
ac		return AC;
on|off		yylval=!strcmp(yytext,"on"); return STATE;
target		return TARGET;
temperature	return TEMP;
swing		return SWING;
jet		return JET;
cool		return COOL;
tv 		return TV;
volume		return VOLUME;
channel	return CHANNEL;
fridge		return FRIDGE;
\n		/*ignore*/
[ \t]+		/*ignore*/
.		return *yytext;
%%
