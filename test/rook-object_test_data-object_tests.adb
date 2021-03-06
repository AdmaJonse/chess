--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Rook.Object_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only
with Ada.Characters.Latin_1;
with Board;
with Game;
--  begin read only
--  end read only
package body Rook.Object_Test_Data.Object_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Is_Valid_Move (Gnattest_T : in out Test_Object);
   procedure Test_Is_Valid_Move_218bd0 (Gnattest_T : in out Test_Object) renames Test_Is_Valid_Move;
--  id:2.2/218bd036eebbf00a/Is_Valid_Move/1/0/
   procedure Test_Is_Valid_Move (Gnattest_T : in out Test_Object) is
   --  rook.ads:41:3:Is_Valid_Move
--  end read only

    pragma Unreferenced (Gnattest_T);

    use Common_Types;

    type Position_Array is array (Positive range 1 .. 8) of Position_Type;

    type Test_Record is
    record
      Position      : Position_Type;
      Valid_Moves   : Position_Array;
      Invalid_Moves : Position_Array;
    end record;

    Test_Data : Test_Record :=
      (Position      => To_Position ("B2"),
       Valid_Moves   => (To_Position ("B3"), To_Position ("B4"), To_Position ("B5"), To_Position ("C2"), To_Position ("A2"), To_Position ("D2"), To_Position ("B1"), To_Position ("E2")),
       Invalid_Moves => (To_Position ("A3"), To_Position ("C3"), To_Position ("A1"), To_Position ("C1"), To_Position ("D3"), To_Position ("A7"), To_Position ("H8"), To_Position ("H7")));

    The_Piece : Rook.Object_Access := Rook.Make (White, Test_Data.Position);

  begin

    The_Piece.Position := Test_Data.Position;

    for Move of Test_Data.Valid_Moves loop

      AUnit.Assertions.Assert
        (The_Piece.Is_Valid_Move (Move),
         "Move is not valid.");

    end loop;

    for Move of Test_Data.Invalid_Moves loop

      AUnit.Assertions.Assert
        (not The_Piece.Is_Valid_Move (Move),
         "Move is valid.");

    end loop;

--  begin read only
   end Test_Is_Valid_Move;
--  end read only


--  begin read only
   procedure Test_Get_Paths (Gnattest_T : in out Test_Object);
   procedure Test_Get_Paths_be5243 (Gnattest_T : in out Test_Object) renames Test_Get_Paths;
--  id:2.2/be5243dac935e519/Get_Paths/1/0/
   procedure Test_Get_Paths (Gnattest_T : in out Test_Object) is
   --  rook.ads:56:3:Get_Paths
--  end read only

    pragma Unreferenced (Gnattest_T);

    Test_Position : constant Common_Types.Position_Type := ('E', 5);
    White_Piece   : constant Rook.Object_Access         := Rook.Make (Common_Types.White, Test_Position);
    Black_Piece   : constant Rook.Object_Access         := Rook.Make (Common_Types.Black, Test_Position);

  begin

    for Path of White_Piece.Get_Paths loop

      AUnit.Assertions.Assert
        (White_Piece.Is_Valid_Move (To => Path (Test_Position)),
         "Path specifies invalid move for White Rook.");

    end loop;

    for Path of Black_Piece.Get_Paths loop

      AUnit.Assertions.Assert
        (Black_Piece.Is_Valid_Move (To => Path (Test_Position)),
         "Path specifies invalid move for Black Rook.");

    end loop;

--  begin read only
   end Test_Get_Paths;
--  end read only


--  begin read only
   procedure Test_Image (Gnattest_T : in out Test_Object);
   procedure Test_Image_16ec4b (Gnattest_T : in out Test_Object) renames Test_Image;
--  id:2.2/16ec4bf257e5d477/Image/1/0/
   procedure Test_Image (Gnattest_T : in out Test_Object) is
   --  rook.ads:68:3:Image
--  end read only

      pragma Unreferenced (Gnattest_T);

    White_Piece : constant Rook.Object_Access := Rook.Make (White, To_Position ("A1"));
    Black_Piece : constant Rook.Object_Access := Rook.Make (Black, To_Position ("A2"));

    White_Expected : constant String := (1 => 'R');
    Black_Expected : constant String := (1 => 'r');

  begin

    AUnit.Assertions.Assert
      (Actual   => (1 => White_Piece.Image),
       Expected => White_Expected,
       Message  => "The output string did not match expected value: " & White_Expected);

    AUnit.Assertions.Assert
      (Actual   => (1 => Black_Piece.Image),
       Expected => Black_Expected,
       Message  => "The output string did not match expected value: " & Black_Expected);

--  begin read only
   end Test_Image;
--  end read only


--  begin read only
   procedure Test_Get_Blocked_Squares (Gnattest_T : in out Test_Object);
   procedure Test_Get_Blocked_Squares_144907 (Gnattest_T : in out Test_Object) renames Test_Get_Blocked_Squares;
--  id:2.2/1449071bc3da3a31/Get_Blocked_Squares/1/0/
   procedure Test_Get_Blocked_Squares (Gnattest_T : in out Test_Object) is
   --  rook.ads:81:3:Get_Blocked_Squares
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Position_Vector.Vector;

    Board_String_One : constant String :=
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
      "2 |   | R |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "1 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "    A   B   C   D   E   F   G   H  ";

    Board_String_Two : constant String :=
      "  - - - - - - - - - - - - - - - - -" & NL &
      "8 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "7 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "6 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "5 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "4 |   |   | p |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "3 | p |   | r |   |   |   | p |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "2 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "1 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "    A   B   C   D   E   F   G   H  ";

    Board_String_Three : constant String :=
      "  - - - - - - - - - - - - - - - - -" & NL &
      "8 |   |   |   |   |   |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "7 |   |   |   |   | P |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "6 | p |   |   |   | r |   |   |   |" & NL &
      "  - - - - - - - - - - - - - - - - -" & NL &
      "5 |   |   |   |   | P |   |   |   |" & NL &
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

    Board_One   : Board.Object := Board.To_Board (Board_String_One);
    Board_Two   : Board.Object := Board.To_Board (Board_String_Two);
    Board_Three : Board.Object := Board.To_Board (Board_String_Three);

  begin

    Game.Initialize (Board_One'Unrestricted_Access);

    declare
      Expected_Squares : Position_Vector.Vector          := Position_Vector.Empty_Vector;
      Actual_Squares   : constant Position_Vector.Vector := Game.Get_Board.Get_Square (('B', 2)).Get_Contents.Get_Blocked_Squares;
    begin

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    declare
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector;
    begin

      Game.Set_Board (Board_Two'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('C', 3)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('G', 3));
      Expected_Squares.Append (('H', 3));
      Expected_Squares.Append (('A', 3));
      Expected_Squares.Append (('C', 4));
      Expected_Squares.Append (('C', 5));
      Expected_Squares.Append (('C', 6));
      Expected_Squares.Append (('C', 7));
      Expected_Squares.Append (('C', 8));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    declare
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector;
    begin

      Game.Set_Board (Board_Three'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('E', 6)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('A', 6));
      Expected_Squares.Append (('E', 8));
      Expected_Squares.Append (('E', 4));
      Expected_Squares.Append (('E', 3));
      Expected_Squares.Append (('E', 2));
      Expected_Squares.Append (('E', 1));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

--  begin read only
   end Test_Get_Blocked_Squares;
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
end Rook.Object_Test_Data.Object_Tests;
