--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Piece.Object_Test_Data.Object_Tests;

with GNATtest_Generated;

package King.Object_Test_Data is

--  begin read only
   type Test_Object is new
     GNATtest_Generated.GNATtest_Standard.Piece.Object_Test_Data.Object_Tests.Test_Object
--  end read only
   with null record;

   procedure Set_Up (Gnattest_T : in out Test_Object);
   procedure Tear_Down (Gnattest_T : in out Test_Object);

end King.Object_Test_Data;
