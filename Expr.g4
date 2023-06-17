grammar Expr;
prog:   (expr NEWLINE)* ;
expr:   expr op=(MULT|DIV) expr {if (Convert.ToInt32($expr.text) == 0) NotifyErrorListeners("Los valores numericos deben ser mayores a cero");} ';'{ Console.WriteLine("Token Encontrado:" + $op.text); } 
    |   expr op=(SUM|RES) expr {Console.WriteLine("Token Encontrado:" + $op.text);}
    |   INT                 {Console.WriteLine("Token Encontrado:" + $INT.text);}
    |   '(' expr ')'        
    ;


MULT : '*';
DIV : '/';
SUM: '+';
RES: '-'; 
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;