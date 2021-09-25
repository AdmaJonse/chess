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
   --  board.ads:115:3:Print
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

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
