--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Piece.Test_Data.

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
package body Piece.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Valid_Moves (Gnattest_T : in out Test);
   procedure Test_Get_Valid_Moves_d1098f (Gnattest_T : in out Test) renames Test_Get_Valid_Moves;
--  id:2.2/d1098f42896fc943/Get_Valid_Moves/1/0/
   procedure Test_Get_Valid_Moves (Gnattest_T : in out Test) is
   --  piece.ads:50:3:Get_Valid_Moves
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Valid_Moves;
--  end read only


--  begin read only
   procedure Test_Get_Blocked (Gnattest_T : in out Test);
   procedure Test_Get_Blocked_d70f1d (Gnattest_T : in out Test) renames Test_Get_Blocked;
--  id:2.2/d70f1da9411b7f28/Get_Blocked/1/0/
   procedure Test_Get_Blocked (Gnattest_T : in out Test) is
   --  piece.ads:58:3:Get_Blocked
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Blocked;
--  end read only


--  begin read only
   procedure Test_Get_Path_To_Square (Gnattest_T : in out Test);
   procedure Test_Get_Path_To_Square_5a92a2 (Gnattest_T : in out Test) renames Test_Get_Path_To_Square;
--  id:2.2/5a92a2f6078b5e69/Get_Path_To_Square/1/0/
   procedure Test_Get_Path_To_Square (Gnattest_T : in out Test) is
   --  piece.ads:62:3:Get_Path_To_Square
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Path_To_Square;
--  end read only


--  begin read only
   --  procedure Test_Construct (Gnattest_T : in out Test);
   --  procedure Test_Construct_0c2b96 (Gnattest_T : in out Test) renames Test_Construct;
--  id:2.2/0c2b96baf9a1532f/Construct/1/1/
   --  procedure Test_Construct (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--     begin
--  
--        AUnit.Assertions.Assert
--          (Gnattest_Generated.Default_Assert_Value,
--           "Test not implemented.");
--  
--  begin read only
   --  end Test_Construct;
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
end Piece.Test_Data.Tests;
