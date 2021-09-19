--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Piece_Factory.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Bishop;
with Common_Types;
with King;
with Knight;
with Pawn;
with Piece;
with Queen;
with Rook;

use Common_Types;

--  begin read only
--  end read only
package body Piece_Factory.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Construct (Gnattest_T : in out Test);
   procedure Test_Construct_0c2b96 (Gnattest_T : in out Test) renames Test_Construct;
--  id:2.2/0c2b96baf9a1532f/Construct/1/0/
   procedure Test_Construct (Gnattest_T : in out Test) is
   --  piece_factory.ads:6:3:Construct
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Piece.Object;
    use type Piece.Object_Access;

    Test_Position : constant Position_Type      := ('A', 1);
    White_Pawn    : constant Piece.Object'Class := Pawn.Make   (White, Test_Position).all;
    Black_Pawn    : constant Piece.Object'Class := Pawn.Make   (Black, Test_Position).all;
    White_Bishop  : constant Piece.Object'Class := Bishop.Make (White, Test_Position).all;
    Black_Bishop  : constant Piece.Object'Class := Bishop.Make (Black, Test_Position).all;
    White_Knight  : constant Piece.Object'Class := Knight.Make (White, Test_Position).all;
    Black_Knight  : constant Piece.Object'Class := Knight.Make (Black, Test_Position).all;
    White_Rook    : constant Piece.Object'Class := Rook.Make   (White, Test_Position).all;
    Black_Rook    : constant Piece.Object'Class := Rook.Make   (Black, Test_Position).all;
    White_Queen   : constant Piece.Object'Class := Queen.Make  (White, Test_Position).all;
    Black_Queen   : constant Piece.Object'Class := Queen.Make  (Black, Test_Position).all;
    White_King    : constant Piece.Object'Class := King.Make   (White, Test_Position).all;
    Black_King    : constant Piece.Object'Class := King.Make   (Black, Test_Position).all;

  begin

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('P', Test_Position).all = White_Pawn,
       "Construction of White Pawn failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('p', Test_Position).all = Black_Pawn,
       "Construction of Black Pawn failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('B', Test_Position).all = White_Bishop,
       "Construction of White Bishop failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('b', Test_Position).all = Black_Bishop,
       "Construction of Black Bishop failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('N', Test_Position).all = White_Knight,
       "Construction of White Knight failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('n', Test_Position).all = Black_Knight,
       "Construction of Black Knight failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('R', Test_Position).all = White_Rook,
       "Construction of White Rook failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('r', Test_Position).all = Black_Rook,
       "Construction of Black Rook failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('Q', Test_Position).all = White_Queen,
       "Construction of White Queen failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('q', Test_Position).all = Black_Queen,
       "Construction of Black Queen failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('K', Test_Position).all = White_King,
       "Construction of White King failed.");

    AUnit.Assertions.Assert
      (Piece_Factory.Construct ('k', Test_Position).all = Black_King,
       "Construction of Black King failed.");

--  begin read only
   end Test_Construct;
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
end Piece_Factory.Test_Data.Tests;
