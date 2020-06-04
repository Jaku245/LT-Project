%{
#include<stdio.h>
#include<string.h>
int ac=0;
int tv=0;
int fridge=0;
%}
%token	NUMBER AC STATE TARGET TEMP SWING MODE JET COOL TV VOLUME CHANNEL FRIDGE
%%
commands: /*empty*/
	| commands command 
	;
command:
	ac_switch
	|
	ac_target_set
	|
	ac_swing_mode
	|
	ac_jet_mode
	|
	tv_switch
	|
	tv_volume
	|
	tv_channel
	|
	fridge_switch
	|
	fridge_temp
	;
ac_switch:
	AC STATE
	{
			if($2)
			{
				ac=1;
				printf("\tAC turned on! Set your temperature.. \n ");
			}
			else
			{	
				ac=0;
				printf("\tAC turned off\n");
			}
		
		
	};
ac_target_set:
	AC TARGET TEMP NUMBER
	{
		printf("\tAC temperature set to %d Set swing and Jet Cool Mode\n",$4);
	};
ac_swing_mode:
	SWING STATE
	{
		if($2 && ac==1)	
		{	
			printf("\tswing mode on\n");
		}
		else if($2 && ac==0)
		{
			printf("\tPlease turn your ac\n");
		}
		else
		{
			printf("\tSwing mode off\n");
		}
	};
ac_jet_mode:
	JET COOL STATE
	{
		if($3 && ac==1){
			printf("\tjet cool mode on\n");
		}
		else if($3 && ac==0)
		{
			printf("\tPlease turn your ac\n");
		}
		else
		{
			printf("\tJet cool mode off\n");
		}
		
	};
tv_switch:
	TV STATE
	{
		if($2){
			tv=1;
			printf("\ttv turned on ..\n");
		}
		else{
			tv=0;
			printf("\ttv turned off ..\n");
		}
	};
tv_volume:
	TV VOLUME NUMBER
	{
	if(tv==1)
		printf("\tTV volume set to %d\n",$3);
	else
		printf("\tTV is off..please turn on tv. \n");
	};
tv_channel:
	TV CHANNEL NUMBER
	{
	if(tv==1)
		printf("\tchannel set to %d\n",$3);	
	else
		printf("\tTV is off..please turn on tv.\n");
	};
fridge_switch:
	FRIDGE STATE
	{
		if($2){
			fridge=1;
			printf("\tfridge turned on ..\n");
		}
		else{
			fridge=0;
			printf("\tfridge turned off..\n");
		}		
	};
fridge_temp:
	FRIDGE TEMP NUMBER
	{
	if(fridge==1)
		printf("\tfridge temperature set to %d\n",$3);
	else
		printf("\tfridge is off..please turn on fridge..\n");
	};
%%
yyerror(char* str){
	fprintf(stdout,"error: %s\n",str);
}
int yywrap(){
	return 1;
}
main(){
	printf("TURN ON OR OFF DEVICE(FRIDGE,TV,AC):\n");
	yyparse();
	
}

	
