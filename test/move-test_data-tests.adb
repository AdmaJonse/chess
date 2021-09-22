--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Move.Test_Data.

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
package body Move.Test_Data.Tests is

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
   procedure Test_Make_87864d (Gnattest_T : in out Test) renames Test_Make;
--  id:2.2/87864d579c66d8e6/Make/1/0/
   procedure Test_Make (Gnattest_T : in out Test) is
   --  move.ads:26:3:Make
--  end read only

    pragma Unreferenced (Gnattest_T);

    Expected_Colour  : constant Colour_Type   := White;
    Expected_From    : constant Position_Type := ('A', 1);
    Expected_To      : constant Position_Type := ('H', 8);
    Expected_Capture : constant Boolean       := True;

    The_Move : constant Move.Object_Access := Move.Make (Expected_Colour, Expected_From, Expected_To, Expected_Capture);

  begin

    AUnit.Assertions.Assert
      (The_Move.Get_By = Expected_Colour,
       "Move Colour does not match expected. Expected: " & Expected_Colour'Image & ", Actual: " & The_Move.Get_By'Image);

    AUnit.Assertions.Assert
      (The_Move.Get_From = Expected_From,
       "Move From position does not match expected. Expected: " & Image (Expected_From) & ", Actual: " & Image (The_Move.Get_From));

    AUnit.Assertions.Assert
      (The_Move.Get_To = Expected_To,
       "Move To position does not match expected. Expected: " & Image (Expected_To) & ", Actual: " & Image (The_Move.Get_To));

    AUnit.Assertions.Assert
      (The_Move.Is_Capture = Expected_Capture,
       "Move capture does not match expected. Expected: " & Expected_Capture'Image & ", Actual: " & The_Move.Is_Capture'Image);

--  begin read only
   end Test_Make;
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
end Move.Test_Data.Tests;
