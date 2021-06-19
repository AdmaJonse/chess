--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Board.Object_Test_Data.

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
package body Board.Object_Test_Data.Object_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Image (Gnattest_T : in out Test_Object);
   procedure Test_Image_5a2944 (Gnattest_T : in out Test_Object) renames Test_Image;
--  id:2.2/5a2944ae29c2bdca/Image/1/0/
   procedure Test_Image (Gnattest_T : in out Test_Object) is
   --  board.ads:38:3:Image
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Image;
--  end read only


--  begin read only
   procedure Test_Get_Square (Gnattest_T : in out Test_Object);
   procedure Test_Get_Square_e55c77 (Gnattest_T : in out Test_Object) renames Test_Get_Square;
--  id:2.2/e55c77f7405982db/Get_Square/1/0/
   procedure Test_Get_Square (Gnattest_T : in out Test_Object) is
   --  board.ads:51:3:Get_Square
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Square;
--  end read only


--  begin read only
   procedure Test_Get_Pieces (Gnattest_T : in out Test_Object);
   procedure Test_Get_Pieces_e83e69 (Gnattest_T : in out Test_Object) renames Test_Get_Pieces;
--  id:2.2/e83e69a442f7bec6/Get_Pieces/1/0/
   procedure Test_Get_Pieces (Gnattest_T : in out Test_Object) is
   --  board.ads:64:3:Get_Pieces
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Pieces;
--  end read only


--  begin read only
   procedure Test_Get_King (Gnattest_T : in out Test_Object);
   procedure Test_Get_King_37db7f (Gnattest_T : in out Test_Object) renames Test_Get_King;
--  id:2.2/37db7f9eb10b885b/Get_King/1/0/
   procedure Test_Get_King (Gnattest_T : in out Test_Object) is
   --  board.ads:77:3:Get_King
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_King;
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
end Board.Object_Test_Data.Object_Tests;
