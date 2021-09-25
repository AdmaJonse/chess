--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Move.Object_Test_Data.

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
with Game;
with Piece;
with Piece_Factory;

use Common_Types;
--  begin read only
--  end read only
package body Move.Object_Test_Data.Object_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only


--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Move (Gnattest_T : in out Test_Object);
   procedure Test_Get_Move_e9e644 (Gnattest_T : in out Test_Object) renames Test_Get_Move;
--  id:2.2/e9e64472eee3a697/Get_Move/1/0/
   procedure Test_Get_Move (Gnattest_T : in out Test_Object) is
   --  move.ads:45:3:Get_Move
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Get_Move;
--  end read only


--  begin read only
   procedure Test_Perform_Move (Gnattest_T : in out Test_Object);
   procedure Test_Perform_Move_49b4f5 (Gnattest_T : in out Test_Object) renames Test_Perform_Move;
--  id:2.2/49b4f5d4e169b2f4/Perform_Move/1/0/
   procedure Test_Perform_Move (Gnattest_T : in out Test_Object) is
   --  move.ads:54:3:Perform_Move
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Piece.Object'Class;

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
        "1 | B |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board    : Board.Object := Board.To_Board (Board_String);

      From : constant Position_Type := ('A', 1);
      To   : constant Position_Type := ('H', 8);

      The_Move : Move.Object_Access := Move.Make (White, From, To);

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      The_Move.Perform_Move;

      AUnit.Assertions.Assert
        (Game.Get_Board.Get_Square (From).Is_Empty,
         "The from square is not empty after performing move.");

      AUnit.Assertions.Assert
        (Game.Get_Board.Get_Square (To).Get_Contents.all = Piece_Factory.Construct ('B', To).all,
         "The to square does not contain the white bishop.");

    end;

    declare
      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   | r |   |   |   |   |   |" & NL &
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

      The_Board : Board.Object := Board.To_Board (Board_String);

      From : constant Position_Type := ('C', 8);
      To   : constant Position_Type := ('C', 2);

      The_Move : Move.Object_Access := Move.Make (Black, From, To);

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn (Black);

      The_Move.Perform_Move;

      AUnit.Assertions.Assert
        (Game.Get_Board.Get_Square (From).Is_Empty,
         "The from square is not empty after performing move.");

      AUnit.Assertions.Assert
        (Game.Get_Board.Get_Square (To).Get_Contents.all = Piece_Factory.Construct ('r', To).all,
         "The to square does not contain the black rook.");

    end;

--  begin read only
   end Test_Perform_Move;
--  end read only


--  begin read only
   procedure Test_Image (Gnattest_T : in out Test_Object);
   procedure Test_Image_442bf1 (Gnattest_T : in out Test_Object) renames Test_Image;
--  id:2.2/442bf1d18224eafc/Image/1/0/
   procedure Test_Image (Gnattest_T : in out Test_Object) is
   --  move.ads:63:3:Image
--  end read only

    pragma Unreferenced (Gnattest_T);

    Move_One : constant Move.Object_Access := Move.Make (White, ('A', 1), ('H', 8));
    Move_Two : constant Move.Object_Access := Move.Make (Black, ('C', 6), ('E', 3), False);

   begin

    AUnit.Assertions.Assert
      (Actual   => Move_One.Image,
       Expected => "WHITE: A1 => H8",
       Message  => "Image of move object failed.");

    AUnit.Assertions.Assert
      (Actual   => Move_Two.Image,
       Expected => "BLACK: C6 => E3",
       Message  => "Image of move object failed.");

--  begin read only
   end Test_Image;
--  end read only


--  begin read only
   procedure Test_Get_By (Gnattest_T : in out Test_Object);
   procedure Test_Get_By_e14dc6 (Gnattest_T : in out Test_Object) renames Test_Get_By;
--  id:2.2/e14dc65ae67a3806/Get_By/1/0/
   procedure Test_Get_By (Gnattest_T : in out Test_Object) is
   --  move.ads:74:3:Get_By
--  end read only

    pragma Unreferenced (Gnattest_T);

    Move_One : constant Move.Object_Access := Move.Make (White, ('A', 1), ('H', 8));
    Move_Two : constant Move.Object_Access := Move.Make (Black, ('C', 6), ('E', 3), False);

  begin

    AUnit.Assertions.Assert
      (Move_One.Get_By = White,
       "By accessor for white's move failed.");

    AUnit.Assertions.Assert
      (Move_Two.Get_By = Black,
       "By accessor for black's move failed.");

--  begin read only
   end Test_Get_By;
--  end read only


--  begin read only
   procedure Test_Get_From (Gnattest_T : in out Test_Object);
   procedure Test_Get_From_c7f143 (Gnattest_T : in out Test_Object) renames Test_Get_From;
--  id:2.2/c7f143bdea111f8a/Get_From/1/0/
   procedure Test_Get_From (Gnattest_T : in out Test_Object) is
   --  move.ads:85:3:Get_From
--  end read only

    pragma Unreferenced (Gnattest_T);

    Move_One : constant Move.Object_Access := Move.Make (White, ('A', 1), ('H', 8));
    Move_Two : constant Move.Object_Access := Move.Make (Black, ('C', 6), ('E', 3), False);

  begin

      AUnit.Assertions.Assert
        (Move_One.Get_From = ('A', 1),
         "From accessor for white's move failed.");

      AUnit.Assertions.Assert
        (Move_Two.Get_From = ('C', 6),
         "From accessor for black's move failed.");

--  begin read only
   end Test_Get_From;
--  end read only


--  begin read only
   procedure Test_Get_To (Gnattest_T : in out Test_Object);
   procedure Test_Get_To_59461b (Gnattest_T : in out Test_Object) renames Test_Get_To;
--  id:2.2/59461bd6604462a7/Get_To/1/0/
   procedure Test_Get_To (Gnattest_T : in out Test_Object) is
   --  move.ads:96:3:Get_To
--  end read only

    pragma Unreferenced (Gnattest_T);

    Move_One : constant Move.Object_Access := Move.Make (White, ('A', 1), ('H', 8));
    Move_Two : constant Move.Object_Access := Move.Make (Black, ('C', 6), ('E', 3), False);

  begin

    AUnit.Assertions.Assert
      (Move_One.Get_To = ('H', 8),
       "To accessor for white's move failed.");

    AUnit.Assertions.Assert
      (Move_Two.Get_To = ('E', 3),
       "To accessor for black's move failed.");

--  begin read only
   end Test_Get_To;
--  end read only


--  begin read only
   procedure Test_Is_Capture (Gnattest_T : in out Test_Object);
   procedure Test_Is_Capture_aab72a (Gnattest_T : in out Test_Object) renames Test_Is_Capture;
--  id:2.2/aab72a46ce620afe/Is_Capture/1/0/
   procedure Test_Is_Capture (Gnattest_T : in out Test_Object) is
   --  move.ads:107:3:Is_Capture
--  end read only

    pragma Unreferenced (Gnattest_T);

    Move_One : constant Move.Object_Access := Move.Make (White, ('A', 1), ('H', 8), True);
    Move_Two : constant Move.Object_Access := Move.Make (Black, ('C', 6), ('E', 3), False);

  begin

    AUnit.Assertions.Assert
      (Move_One.Is_Capture,
       "Capture check for white's move failed.");

    AUnit.Assertions.Assert
      (not Move_Two.Is_Capture,
       "Capture check for black's move failed.");

--  begin read only
   end Test_Is_Capture;
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
end Move.Object_Test_Data.Object_Tests;
