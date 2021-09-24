--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Square.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only
with Piece_Factory;
--  begin read only
--  end read only
package body Square.Test_Data.Tests is

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
   procedure Test_Make_9d81be (Gnattest_T : in out Test) renames Test_Make;
--  id:2.2/9d81be68280609db/Make/1/0/
   procedure Test_Make (Gnattest_T : in out Test) is
   --  square.ads:37:3:Make
--  end read only

    pragma Unreferenced (Gnattest_T);

    The_Square : Square.Object_Access := Square.Make;

   begin

    AUnit.Assertions.Assert
      (The_Square.Is_Empty,
       "The empty square Make operation failed.");

    The_Square := Square.Make (Contents => Piece_Factory.Construct ('P', ('A', 1)));

    AUnit.Assertions.Assert
      (The_Square.Get_Contents.Image = 'P',
       "The square Make operation failed.");

--  begin read only
   end Test_Make;
--  end read only


--  begin read only
   procedure Test_Get_Contents (Gnattest_T : in out Test);
   procedure Test_Get_Contents_aad8cf (Gnattest_T : in out Test) renames Test_Get_Contents;
--  id:2.2/aad8cf4753555089/Get_Contents/1/0/
   procedure Test_Get_Contents (Gnattest_T : in out Test) is
   --  square.ads:59:3:Get_Contents
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    declare
      The_Square : Square.Object_Access := Square.Make (Piece_Factory.Construct ('P', ('A', 1)));
    begin
      AUnit.Assertions.Assert
        (The_Square.Get_Contents.Image = 'P',
         "Could not retrieve contents from Square.");
    end;

    declare
      The_Square : Square.Object_Access := Square.Make;
      The_Piece  : Piece.Object_Access;
    begin

      The_Piece := The_Square.Get_Contents;

      AUnit.Assertions.Assert
        (False,
         "Exception not raised when retrieving contents from empty square.");

    exception

      when Square.No_Contents_Error =>

        AUnit.Assertions.Assert
          (True,
           "Assertion failed in No Contents Error exception case.");

      when others =>

        AUnit.Assertions.Assert
          (False,
           "Unexpected exception raised when retrieving contents from empty square.");

    end;

--  begin read only
   end Test_Get_Contents;
--  end read only


--  begin read only
   procedure Test_Set_Contents (Gnattest_T : in out Test);
   procedure Test_Set_Contents_662ea0 (Gnattest_T : in out Test) renames Test_Set_Contents;
--  id:2.2/662ea0a14dfa2553/Set_Contents/1/0/
   procedure Test_Set_Contents (Gnattest_T : in out Test) is
   --  square.ads:69:3:Set_Contents
--  end read only

    pragma Unreferenced (Gnattest_T);

    The_Square : Square.Object_Access := Square.Make;

    begin

      AUnit.Assertions.Assert
        (The_Square.Is_Empty,
         "The square is not empty.");

      The_Square.Set_Contents (Piece_Factory.Construct ('P', ('A', 1)));

      AUnit.Assertions.Assert
        (not The_Square.Is_Empty,
         "The square is empty.");

--  begin read only
   end Test_Set_Contents;
--  end read only


--  begin read only
   procedure Test_Set_Empty (Gnattest_T : in out Test);
   procedure Test_Set_Empty_51e4ce (Gnattest_T : in out Test) renames Test_Set_Empty;
--  id:2.2/51e4ce9cb07f31f9/Set_Empty/1/0/
   procedure Test_Set_Empty (Gnattest_T : in out Test) is
   --  square.ads:78:3:Set_Empty
--  end read only

    pragma Unreferenced (Gnattest_T);

    The_Square : Square.Object_Access := Square.Make (Piece_Factory.Construct ('P', ('A', 1)));

  begin

    AUnit.Assertions.Assert
      (not The_Square.Is_Empty,
       "The square is empty.");

    The_Square.Set_Empty;

    AUnit.Assertions.Assert
      (The_Square.Is_Empty,
       "The square is not empty.");

--  begin read only
   end Test_Set_Empty;
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
end Square.Test_Data.Tests;
