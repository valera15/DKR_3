program zad_1;
uses crt;
var S,b,a: real;
    i: integer;
 /// реализовать программу вычисления S фигуры, ограниченной кривой 
 ///  2*x^3+(1)*x^2+(4)*x+(15) и осью OX (в положительной части по оси OY)
 /// пределы интегрирования вводятся пользователем
 /// вычисление определенного интеграла должно выполнять численно, 
 ///  с применением метода левых прямоугольников
 /// требуется реализовать возможность оценки погрешности полученного результата
 /// взаимодействие с пользователем должно осуществляться посредством case-меню
 /// необходимо использовать процедуры и функции там, где это целесообразно
 
// f - функция до интегрирования 
  function f(x:real): real;
  begin
    f:=2*power(x,3)+power(x,2)+4*x+15;
  end;
  
// Fdop - дополненная функция (после интегрирования)
  function Fdop(x:real): real;
  begin
    Fdop:=(1/2)*power(x,4)+(1/3)*power(x,3)+2*power(x,2)+15*x;
  end;
  
// aannaia - функция для поиска пересечения графика с ф-ей
  function aannaia: real;
  var knopka: boolean;
      d,x: real;
    begin
     /// aannaia - самая крайняя левая точка; knopka - flag; d - шаг (0,000001)
     /// x - длина отрезка (от 0 до точки пересечения ф-ии на оси x)
       d:=0.000001;
       x:=0;
       repeat
       knopka:=true;
       if 0<=f(x) then 
         begin
         knopka:=false;
         x:=x-d;
         x:=(round(x*1000000))/1000000;
         end;
       until knopka=true;
       aannaia:=x;
    end;

// metod_pramoyg - метод левых прямоугольников
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure metod_pramoyg;
var dx,x,y: real;
    n: integer;
  begin
   /// dx - кол-во оснований для прямоугольников на оси OX 
    writeln (' Введите кол-во прямоугольников');
    write (' ');
    readln (n);
    if (n=0) or (n<0) then
      begin
      writeln (' Ошибка ввода, пусть n=10');
      writeln (' ');
      n:=10;
      end;
    dx:=(b-a)/n;
    y:=0;
    x:=a;
    while x<b do
      begin
      y:=y+f(x);
      x:=x+dx;
      end;
    y:=y*dx;
    writeln (' Площадь интеграла, рассчитанное по формуле прямоугольников: ',y);
    writeln (' Погрешность - ',(Fdop(b)-Fdop(a))-y );
    writeln (' ');
    write (' ');
  end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  begin
    a:=aannaia;
    writeln (' Введите пределы ф-ии');
    writeln (' Левый придел больше чем ',a);
    write (' ');
    readln (a,b);
    writeln (' Нахождение интеграла 2*x^3+(1)*x^2+(4)*x+(15)');
    writeln (' Выберите метод интегрирования');
    writeln (' 1 - базовый метод интегрирования');
    writeln (' 2 - метод левых прямоугольников');
    write (' ');
    readln (i);
    case i of
      1: begin
         S:=Fdop(b)-Fdop(a);
         writeln (' Площадь интеграла, рассчитанное по базовой формуле: ',S);
         writeln (' Погрешность - ', 0 );
         writeln (' ');
         write (' ');
         end;
      2: metod_pramoyg;
    end;
  end.