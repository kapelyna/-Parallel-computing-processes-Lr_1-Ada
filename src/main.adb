with Ada.Text_IO;

procedure Main is   
   Can_Stop : Boolean := False;
   pragma Atomic (Can_Stop);
   Step : Long_Long_Integer := 1;

   task type Stop_Thread;
   task type Sum_Thread(ID:Integer);

   task body Stop_Thread is
   begin
      delay 3.0;
      Can_Stop := True;
   end Stop_Thread;

   task body Sum_Thread is
      Additions : Long_Long_Integer := 0;
      Sum : Long_Long_Integer := 0;
   begin
      loop
         exit when Can_Stop;
         Sum := Sum + (Additions * Step);
         Additions := Additions + 1;
      end loop;


         Ada.Text_IO.Put_Line("Thread " &ID'Img& " - Sum: "&Sum'Img&" - Additions: "&Additions'Img);


   end Sum_Thread;

   B1 : Stop_Thread;
      
Threads : array(1..6) of access Sum_Thread; 
begin
   
   for I in 1..6 loop
      Threads(I) := new Sum_Thread(I);
   end loop;
end Main;
