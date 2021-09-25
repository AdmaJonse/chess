--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Board.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Common_Types;
use Common_Types;
--  begin read only
--  end read only
package body Board.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Make (Gnattest_T : in out Test);
   procedure Test_Make_d6719c (Gnattest_T : in out Test) renames Test_Make;
--  id:2.2/d6719c13ce2371d2/Make/1/0/
   procedure Test_Make (Gnattest_T : in out Test) is
   --  board.ads:41:3:Make
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

    begin

      AUnit.Assertions.Assert
        (Board.Make (Empty_Squares).all = To_Board (Board_String),
         "Make failed for empty board.");

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r | n | b | q | k | b | n | r |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p | p | p | p | p | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P | P | P | P | P | P | P | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B | Q | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

    begin

      AUnit.Assertions.Assert
        (Board.Make.Image = Board_String,
         "Make failed for starting board.");

    end;


--  begin read only
   end Test_Make;
--  end read only


--  begin read only
   procedure Test_Print (Gnattest_T : in out Test);
   procedure Test_Print_918622 (Gnattest_T : in out Test) renames Test_Print;
--  id:2.2/918622e48a61a252/Print/1/0/
   procedure Test_Print (Gnattest_T : in out Test) is
   --  board.ads:127:3:Print
--  end read only

    pragma Unreferenced (Gnattest_T);


  begin

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board   : constant Board.Object := To_Board (Board_String);
      File_Name   : constant String       := "print_test_output.txt";
      Output_File : Ada.Text_IO.File_Type;
      Result      : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
      First       : Boolean := True;

    begin

      Ada.Text_IO.Create (Output_File, Ada.Text_IO.Out_File, File_Name);
      Ada.Text_IO.Set_Output (Output_File);

      The_Board.Print;

      Ada.Text_IO.Close (Output_File);
      Ada.Text_IO.Set_Output (Ada.Text_IO.Standard_Output);

      Ada.Text_IO.Open (Output_File, Ada.Text_IO.In_File, File_Name);

      while not Ada.Text_IO.End_Of_File (Output_File) loop

        declare
          Line : constant String := Ada.Text_IO.Get_Line (Output_File);
        begin

          if First then
            First := False;
          else
            Ada.Strings.Unbounded.Append (Result, NL);
          end if;

          Ada.Strings.Unbounded.Append (Result, Line);
        end;

      end loop;

      Ada.Text_IO.Delete (Output_File);

      AUnit.Assertions.Assert
        (Actual   => Ada.Strings.Unbounded.To_String (Result),
         Expected => Board_String,
         Message  => "The printed board string does not match the expected board string.");

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r | n | b | q | k | b | n | r |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p | p | p | p | p | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P | P | P | P | P | P | P | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B | Q | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board   : constant Board.Object := To_Board (Board_String);
      File_Name   : constant String       := "print_test_output.txt";
      Output_File : Ada.Text_IO.File_Type;
      Result      : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
      First       : Boolean := True;

    begin

      Ada.Text_IO.Create (Output_File, Ada.Text_IO.Out_File, File_Name);
      Ada.Text_IO.Set_Output (Output_File);

      The_Board.Print;

      Ada.Text_IO.Close (Output_File);
      Ada.Text_IO.Set_Output (Ada.Text_IO.Standard_Output);

      Ada.Text_IO.Open (Output_File, Ada.Text_IO.In_File, File_Name);

      while not Ada.Text_IO.End_Of_File (Output_File) loop

        declare
          Line : constant String := Ada.Text_IO.Get_Line (Output_File);
        begin

          if First then
            First := False;
          else
            Ada.Strings.Unbounded.Append (Result, NL);
          end if;

          Ada.Strings.Unbounded.Append (Result, Line);
        end;

      end loop;

      Ada.Text_IO.Delete (Output_File);

      AUnit.Assertions.Assert
        (Actual   => Ada.Strings.Unbounded.To_String (Result),
         Expected => Board_String,
         Message  => "The printed board string does not match the expected board string.");

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p | p | p | p | p | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   | P |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   | P |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   | P |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   | P |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B | Q | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board   : constant Board.Object := To_Board (Board_String);
      File_Name   : constant String       := "print_test_output.txt";
      Output_File : Ada.Text_IO.File_Type;
      Result      : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
      First       : Boolean := True;

    begin

      Ada.Text_IO.Create (Output_File, Ada.Text_IO.Out_File, File_Name);
      Ada.Text_IO.Set_Output (Output_File);

      The_Board.Print;

      Ada.Text_IO.Close (Output_File);
      Ada.Text_IO.Set_Output (Ada.Text_IO.Standard_Output);

      Ada.Text_IO.Open (Output_File, Ada.Text_IO.In_File, File_Name);

      while not Ada.Text_IO.End_Of_File (Output_File) loop

        declare
          Line : constant String := Ada.Text_IO.Get_Line (Output_File);
        begin

          if First then
            First := False;
          else
            Ada.Strings.Unbounded.Append (Result, NL);
          end if;

          Ada.Strings.Unbounded.Append (Result, Line);
        end;

      end loop;

      Ada.Text_IO.Delete (Output_File);

      AUnit.Assertions.Assert
        (Actual   => Ada.Strings.Unbounded.To_String (Result),
         Expected => Board_String,
         Message  => "The printed board string does not match the expected board string.");

    end;

--  begin read only
   end Test_Print;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Board.Test_Data.Tests;
