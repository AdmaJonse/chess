--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Knight.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Knight.Test_Data.Tests is

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
   procedure Test_Make_da7a4a (Gnattest_T : in out Test) renames Test_Make;
--  id:2.2/da7a4a1f3974ac1a/Make/1/0/
   procedure Test_Make (Gnattest_T : in out Test) is
   --  knight.ads:27:3:Make
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    declare
      Black_Object : Knight.Object_Access := Knight.Make (Common_Types.Black, ('A', 1));
    begin
      AUnit.Assertions.Assert
        (Condition => Black_Object.Colour = Common_Types.Black,
         Message   => "Unexpected colour.");

      AUnit.Assertions.Assert
        (Condition => Black_Object.Position.Rank = 1,
         Message   => "Unexpected rank.");

      AUnit.Assertions.Assert
        (Condition => Black_Object.Position.File = 'A',
         Message   => "Unexpected file.");
    end;

    declare
      White_Object : Knight.Object_Access := Knight.Make (Common_Types.White, ('H', 8));
    begin
      AUnit.Assertions.Assert
        (Condition => White_Object.Colour = Common_Types.White,
         Message   => "Unexpected colour.");

      AUnit.Assertions.Assert
        (Condition => White_Object.Position.Rank = 8,
         Message   => "Unexpected rank.");

      AUnit.Assertions.Assert
        (Condition => White_Object.Position.File = 'H',
         Message   => "Unexpected file.");
    end;

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
end Knight.Test_Data.Tests;
