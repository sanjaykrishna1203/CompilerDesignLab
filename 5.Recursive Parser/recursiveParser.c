#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int i = 0, j = 0;
char str[30];

void E();
void EPrime();
void T();
void TPrime();
void F();

void E()
{
    printf("\nE->TE'");
    T();
    EPrime();
}

void EPrime()
{
    if(str[i] == '+')
    {
        printf("\n E'->+TE'");
        i++;
        T();
        EPrime();
    } else if((str[i] == ')') || (str[i] == '$')) {
        printf("\nE'->^");
    }
}

void T()
{
    printf("\n T->FT'");
    F();
    TPrime();
}

void TPrime()
{
    if(str[i] == '*')
    {
        printf("\nT'->*FT'");
        i++;
        F();
        TPrime();
    } else if((str[i] == ')') || (str[i] == '+' || str[i] == '$')){
        printf("\nT'->^");    
    }
}

void F()
{
    if(str[i] == 'a')
    {
        printf("\n F->a");
        i++;
    } else if(str[i] == '(') {
        printf("\n F->(E)");
        i++;
        E();
        if(str[i] == ')')
        {
            i++;
        }
    } else {
        j = 1;  
    }
}

int main()
{
    int len;
    scanf("%s", str);
    len = strlen(str);
    str[len] = '$';
    E();
    if(str[i] == '$' && j == 0)   
    {
        printf("String Successfully Parsed");
    } else {
        printf("Syntax Error");
    }
    return 0;
}