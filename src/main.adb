with Ada.Text_IO;

procedure Main is

   Can_Stop : Boolean := False;
   Step : Long_Long_Integer := 2;

   task type Stop_Thread;
   task type Sum_Thread;

   task body Stop_Thread is
   begin
      delay 3.0;
      Can_Stop := True;
   end Stop_Thread;

   task body Sum_Thread is
      Terms : Long_Long_Integer := 0;
      Sum : Long_Long_Integer := 0;
   begin
      loop
         exit when Can_Stop;
         Sum := Sum + (Terms * Step);
         Terms := Terms + 1;
      end loop;


         Ada.Text_IO.Put_Line("Thread " & " - Sum: "&Sum'Img&" - Terms: "&Terms'Img);


   end Sum_Thread;

   B1 : Stop_Thread;
   T1 : Sum_Thread;
   T2 : Sum_Thread;
   T3 : Sum_Thread;
   T4 : Sum_Thread;

begin
   null;
end Main;
