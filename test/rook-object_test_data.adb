--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Rook.Object_Test_Data is

   Local_Object : aliased GNATtest_Generated.GNATtest_Standard.Rook.Object;
   procedure Set_Up (Gnattest_T : in out Test_Object) is
   begin
      GNATtest_Generated.GNATtest_Standard.Piece.Object_Test_Data.Object_Tests.Set_Up
        (GNATtest_Generated.GNATtest_Standard.Piece.Object_Test_Data.Object_Tests.Test_Object (Gnattest_T));
      Gnattest_T.Fixture := Local_Object'Access;
   end Set_Up;

   procedure Tear_Down (Gnattest_T : in out Test_Object) is
   begin
      GNATtest_Generated.GNATtest_Standard.Piece.Object_Test_Data.Object_Tests.Tear_Down
        (GNATtest_Generated.GNATtest_Standard.Piece.Object_Test_Data.Object_Tests.Test_Object (Gnattest_T));
   end Tear_Down;

end Rook.Object_Test_Data;
