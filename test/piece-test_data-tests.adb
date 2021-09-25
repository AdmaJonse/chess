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
with Ada.Characters.Latin_1;
with Board;
with Common_Types;
with Game;
with Piece_Factory;
with Square;

use Common_Types;
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
   procedure Test_Is_Match (Gnattest_T : in out Test);
   procedure Test_Is_Match_31af6f (Gnattest_T : in out Test) renames Test_Is_Match;
--  id:2.2/31af6fec9118d3f8/Is_Match/1/0/
   procedure Test_Is_Match (Gnattest_T : in out Test) is
   --  piece.ads:46:3:Is_Match
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    declare

      Pieces_One : Piece_Vector.Vector := Piece_Vector.Empty_Vector;
      Pieces_Two : Piece_Vector.Vector := Piece_Vector.Empty_Vector;

    begin

      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 1)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 3)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 4)));

      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 1)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 3)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 4)));

      AUnit.Assertions.Assert
        (Is_Match (Pieces_One, Pieces_Two),
         "Is_Match fail for matching contents and order.");

    end;

    declare

      Pieces_One : Piece_Vector.Vector := Piece_Vector.Empty_Vector;
      Pieces_Two : Piece_Vector.Vector := Piece_Vector.Empty_Vector;

    begin

      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 1)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 3)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 4)));

      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 4)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 3)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 1)));

      AUnit.Assertions.Assert
        (Is_Match (Pieces_One, Pieces_Two),
         "Is_Match fail for matching contents, different order.");

    end;

    declare

      Pieces_One : Piece_Vector.Vector := Piece_Vector.Empty_Vector;
      Pieces_Two : Piece_Vector.Vector := Piece_Vector.Empty_Vector;

    begin

      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 1)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces_One.Append (Piece_Factory.Construct ('P', ('A', 3)));

      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 1)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 3)));
      Pieces_Two.Append (Piece_Factory.Construct ('P', ('A', 4)));

      AUnit.Assertions.Assert
        (not Is_Match (Pieces_One, Pieces_Two),
         "Is_Match fail for different vectors.");

    end;

--  begin read only
   end Test_Is_Match;
--  end read only


--  begin read only
   procedure Test_1_Image (Gnattest_T : in out Test);
   procedure Test_Image_bd3b84 (Gnattest_T : in out Test) renames Test_1_Image;
--  id:2.2/bd3b8440a2050565/Image/1/0/
   procedure Test_1_Image (Gnattest_T : in out Test) is
   --  piece.ads:57:3:Image
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    declare

      Pieces   : Piece_Vector.Vector := Piece_Vector.Empty_Vector;
      Expected : constant String     := "A1:P A2:P A3:P A4:P";

    begin

      Pieces.Append (Piece_Factory.Construct ('P', ('A', 1)));
      Pieces.Append (Piece_Factory.Construct ('P', ('A', 2)));
      Pieces.Append (Piece_Factory.Construct ('P', ('A', 3)));
      Pieces.Append (Piece_Factory.Construct ('P', ('A', 4)));

      AUnit.Assertions.Assert
        (Actual   => Image (Pieces),
         Expected => Expected,
         Message  => "Image failed for vector of white pawns.");
    end;

    declare

      Pieces   : Piece_Vector.Vector := Piece_Vector.Empty_Vector;
      Expected : constant String     := "B3:p C4:r D5:k E6:n";

    begin

      Pieces.Append (Piece_Factory.Construct ('p', ('B', 3)));
      Pieces.Append (Piece_Factory.Construct ('r', ('C', 4)));
      Pieces.Append (Piece_Factory.Construct ('k', ('D', 5)));
      Pieces.Append (Piece_Factory.Construct ('n', ('E', 6)));

      AUnit.Assertions.Assert
        (Actual   => Image (Pieces),
         Expected => Expected,
         Message  => "Image failed for vector of black pieces.");
    end;

--  begin read only
   end Test_1_Image;
--  end read only


--  begin read only
   procedure Test_Get_Valid_Moves (Gnattest_T : in out Test);
   procedure Test_Get_Valid_Moves_d1098f (Gnattest_T : in out Test) renames Test_Get_Valid_Moves;
--  id:2.2/d1098f42896fc943/Get_Valid_Moves/1/0/
   procedure Test_Get_Valid_Moves (Gnattest_T : in out Test) is
   --  piece.ads:130:3:Get_Valid_Moves
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Position_Vector.Vector;

  begin

    ----------------------------------------------------------------------------
    --  Pawn
    ----------------------------------------------------------------------------
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
        "2 |   | P |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('B', 3));
      Expected_Moves.Append (('B', 4));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('B', 2)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked white pawn." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

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
        "3 | p | P | p |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   | P |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 3));
      Expected_Moves.Append (('C', 3));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('B', 2)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked white pawn." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   | p |   |   |   |" & NL &
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
        "1 |   |   |   |   |   |   |   | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('E', 6));
      Expected_Moves.Append (('E', 5));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('E', 7)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked black pawn." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   | p |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   | P | p | P |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('D', 6));
      Expected_Moves.Append (('F', 6));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('E', 7)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked black pawn." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    ----------------------------------------------------------------------------
    --  Bishop
    ----------------------------------------------------------------------------
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
        "2 |   | B |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 1));
      Expected_Moves.Append (('A', 3));
      Expected_Moves.Append (('C', 1));
      Expected_Moves.Append (('C', 3));
      Expected_Moves.Append (('D', 4));
      Expected_Moves.Append (('E', 5));
      Expected_Moves.Append (('F', 6));
      Expected_Moves.Append (('G', 7));
      Expected_Moves.Append (('H', 8));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('B', 2)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked white bishop." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

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
        "4 |   |   |   |   | b |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 8));
      Expected_Moves.Append (('B', 1));
      Expected_Moves.Append (('B', 7));
      Expected_Moves.Append (('C', 2));
      Expected_Moves.Append (('C', 6));
      Expected_Moves.Append (('D', 3));
      Expected_Moves.Append (('D', 5));
      Expected_Moves.Append (('F', 3));
      Expected_Moves.Append (('F', 5));
      Expected_Moves.Append (('G', 2));
      Expected_Moves.Append (('G', 6));
      Expected_Moves.Append (('H', 1));
      Expected_Moves.Append (('H', 7));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('E', 4)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked black bishop." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

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
        "3 |   |   | P |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   | B |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 1));
      Expected_Moves.Append (('A', 3));
      Expected_Moves.Append (('C', 1));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('B', 2)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked white bishop." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   | p |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   | P |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   | b |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   | p |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('C', 2));
      Expected_Moves.Append (('D', 3));
      Expected_Moves.Append (('D', 5));
      Expected_Moves.Append (('F', 3));
      Expected_Moves.Append (('F', 5));
      Expected_Moves.Append (('G', 2));
      Expected_Moves.Append (('H', 1));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('E', 4)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked black bishop." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    ----------------------------------------------------------------------------
    --  Knight
    ----------------------------------------------------------------------------
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
        "4 |   |   |   | N |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('B', 3));
      Expected_Moves.Append (('B', 5));
      Expected_Moves.Append (('C', 2));
      Expected_Moves.Append (('C', 6));
      Expected_Moves.Append (('E', 2));
      Expected_Moves.Append (('E', 6));
      Expected_Moves.Append (('F', 3));
      Expected_Moves.Append (('F', 5));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('D', 4)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked white knight." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   | n |   |   |   |   |" & NL &
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

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('B', 5));
      Expected_Moves.Append (('B', 7));
      Expected_Moves.Append (('C', 4));
      Expected_Moves.Append (('C', 8));
      Expected_Moves.Append (('E', 4));
      Expected_Moves.Append (('E', 8));
      Expected_Moves.Append (('F', 5));
      Expected_Moves.Append (('F', 7));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('D', 6)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked black knight." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   | P |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 | p |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   | N |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 4));
      Expected_Moves.Append (('B', 1));
      Expected_Moves.Append (('B', 5));
      Expected_Moves.Append (('D', 1));
      Expected_Moves.Append (('E', 2));
      Expected_Moves.Append (('E', 4));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('C', 3)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked white knight." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   | P |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   | N |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('F', 3));
      Expected_Moves.Append (('F', 5));
      Expected_Moves.Append (('G', 2));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('H', 4)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked black knight." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    ----------------------------------------------------------------------------
    --  Rook
    ----------------------------------------------------------------------------
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
        "2 |   |   |   |   |   | R |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 2));
      Expected_Moves.Append (('B', 2));
      Expected_Moves.Append (('C', 2));
      Expected_Moves.Append (('D', 2));
      Expected_Moves.Append (('E', 2));
      Expected_Moves.Append (('F', 1));
      Expected_Moves.Append (('F', 3));
      Expected_Moves.Append (('F', 4));
      Expected_Moves.Append (('F', 5));
      Expected_Moves.Append (('F', 6));
      Expected_Moves.Append (('F', 7));
      Expected_Moves.Append (('F', 8));
      Expected_Moves.Append (('G', 2));
      Expected_Moves.Append (('H', 2));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('F', 2)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked white rook." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r |   |   |   |   |   |   |   |" & NL &
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

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('A', 1));
      Expected_Moves.Append (('A', 2));
      Expected_Moves.Append (('A', 3));
      Expected_Moves.Append (('A', 4));
      Expected_Moves.Append (('A', 5));
      Expected_Moves.Append (('A', 6));
      Expected_Moves.Append (('A', 7));
      Expected_Moves.Append (('B', 8));
      Expected_Moves.Append (('C', 8));
      Expected_Moves.Append (('D', 8));
      Expected_Moves.Append (('E', 8));
      Expected_Moves.Append (('F', 8));
      Expected_Moves.Append (('G', 8));
      Expected_Moves.Append (('H', 8));


      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('A', 8)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for unblocked black rook." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

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
        "4 |   |   |   |   |   |   | P |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   | p |   |   | R |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('D', 2));
      Expected_Moves.Append (('E', 2));
      Expected_Moves.Append (('F', 2));
      Expected_Moves.Append (('G', 1));
      Expected_Moves.Append (('G', 3));
      Expected_Moves.Append (('H', 2));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('G', 2)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked white rook." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   | p | r | P |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   | p |   |   |   |" & NL &
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

      The_Board      : Board.Object           := Board.To_Board (Board_String);
      Actual_Moves   : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Expected_Moves : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);

      Expected_Moves.Append (('F', 8));

      Actual_Moves := Get_Valid_Moves (Board.Get_Square (The_Board, ('E', 8)).Get_Contents);

      AUnit.Assertions.Assert
        (Is_Match (Actual_Moves, Expected_Moves),
         "Valid moves not found for blocked black rook." & NL &
           "Expected: " & Image (Expected_Moves) & NL &
           "Actual:   " & Image (Actual_Moves));

    end;

--  begin read only
   end Test_Get_Valid_Moves;
--  end read only


--  begin read only
   procedure Test_Get_Blocked (Gnattest_T : in out Test);
   procedure Test_Get_Blocked_d70f1d (Gnattest_T : in out Test) renames Test_Get_Blocked;
--  id:2.2/d70f1da9411b7f28/Get_Blocked/1/0/
   procedure Test_Get_Blocked (Gnattest_T : in out Test) is
   --  piece.ads:171:3:Get_Blocked
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    ----------------------------------------------------------------------------
    --  Bishop
    ----------------------------------------------------------------------------

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   | P |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   | P |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   | B |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | P |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Turn  (White);
      Game.Set_Board (The_Board'Unrestricted_Access);

      Actual_Squares := Game.Get_Board.Get_Square (('D', 4)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('E', 5));
      Expected_Squares.Append (('F', 6));
      Expected_Squares.Append (('G', 7));
      Expected_Squares.Append (('H', 8));
      Expected_Squares.Append (('B', 6));
      Expected_Squares.Append (('A', 7));
      Expected_Squares.Append (('A', 1));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   | b |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   | b |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   | Q |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 | R |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('D', 6)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('F', 4));
      Expected_Squares.Append (('G', 3));
      Expected_Squares.Append (('H', 2));
      Expected_Squares.Append (('C', 7));
      Expected_Squares.Append (('B', 8));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    ----------------------------------------------------------------------------
    --  King
    ----------------------------------------------------------------------------

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | K | p |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | P |   |   |   |   |   |   |" & NL &
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

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Turn  (White);
      Game.Set_Board (The_Board'Unrestricted_Access);

      Actual_Squares := Game.Get_Board.Get_Square (('A', 8)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('B', 7));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

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
        "2 |   | k |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('B', 2)).Get_Contents.Get_Blocked_Squares;

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   | p | p | p |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   | p | k | p |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   | p | p | p |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('E', 4)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('F', 5));
      Expected_Squares.Append (('F', 3));
      Expected_Squares.Append (('D', 5));
      Expected_Squares.Append (('D', 3));
      Expected_Squares.Append (('F', 4));
      Expected_Squares.Append (('D', 4));
      Expected_Squares.Append (('E', 5));
      Expected_Squares.Append (('E', 3));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    ----------------------------------------------------------------------------
    --  Knight
    ----------------------------------------------------------------------------

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   | P |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   | P |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   | N |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | P |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Turn  (White);
      Game.Set_Board (The_Board'Unrestricted_Access);

      Actual_Squares := Game.Get_Board.Get_Square (('D', 4)).Get_Contents.Get_Blocked_Squares;

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   | n |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   | R |   | b |   |   |   |   |" & NL &
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

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('C', 7)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('D', 5));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   | p |   | p |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   | p |   |   |   | p |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   | n |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   | p |   |   |   | p |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   | p |   | p |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('E', 4)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('G', 5));
      Expected_Squares.Append (('G', 3));
      Expected_Squares.Append (('C', 5));
      Expected_Squares.Append (('C', 3));
      Expected_Squares.Append (('F', 6));
      Expected_Squares.Append (('D', 6));
      Expected_Squares.Append (('F', 2));
      Expected_Squares.Append (('D', 2));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    ----------------------------------------------------------------------------
    --  Pawn
    ----------------------------------------------------------------------------

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
        "4 |   | p |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   | P |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Turn  (White);
      Game.Set_Board (The_Board'Unrestricted_Access);

      Actual_Squares := Game.Get_Board.Get_Square (('B', 2)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('A', 3));
      Expected_Squares.Append (('B', 4));
      Expected_Squares.Append (('C', 3));


      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   | p |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   | P |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('E', 5)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('E', 4));
      Expected_Squares.Append (('D', 4));
      Expected_Squares.Append (('F', 4));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   | p |   |   |   |   |   |" & NL &
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

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('C', 7)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('B', 6));
      Expected_Squares.Append (('D', 6));
      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    ----------------------------------------------------------------------------
    --  Queen
    ----------------------------------------------------------------------------

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
        "2 |   | Q |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Turn  (White);
      Game.Set_Board (The_Board'Unrestricted_Access);

      Actual_Squares := Game.Get_Board.Get_Square (('B', 2)).Get_Contents.Get_Blocked_Squares;

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 | p |   |   |   | p |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   | q |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   | p |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('C', 3)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('E', 5));
      Expected_Squares.Append (('F', 6));
      Expected_Squares.Append (('G', 7));
      Expected_Squares.Append (('H', 8));
      Expected_Squares.Append (('E', 1));
      Expected_Squares.Append (('A', 5));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 |   |   |   |   |   |   | p |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 |   |   |   | P |   |   | q | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   | P |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn  (Black);

      Actual_Squares := Game.Get_Board.Get_Square (('G', 7)).Get_Contents.Get_Blocked_Squares;

      Expected_Squares.Append (('H', 7));
      Expected_Squares.Append (('C', 7));
      Expected_Squares.Append (('B', 7));
      Expected_Squares.Append (('A', 7));
      Expected_Squares.Append (('G', 8));
      Expected_Squares.Append (('G', 1));

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));

    end;

    ----------------------------------------------------------------------------
    --  Rook
    ----------------------------------------------------------------------------

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
        "2 |   | R |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Turn  (White);
      Game.Set_Board (The_Board'Unrestricted_Access);

      Actual_Squares := Game.Get_Board.Get_Square (('B', 2)).Get_Contents.Get_Blocked_Squares;

      AUnit.Assertions.Assert
        (Is_Match (Actual_Squares, Expected_Squares),
         "Does not match expected blocked squares." & NL &
           "Expected: " & Image (Expected_Squares) & NL &
           "Actual:   " & Image (Actual_Squares));
    end;

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
        "4 |   |   | p |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 | p |   | r |   |   |   | p |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";


      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
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

      Board_String : constant String :=
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

      The_Board        : Board.Object           := Board.To_Board (Board_String);
      Expected_Squares : Position_Vector.Vector := Position_Vector.Empty_Vector;
      Actual_Squares   : Position_Vector.Vector := Position_Vector.Empty_Vector;

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
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
   end Test_Get_Blocked;
--  end read only


--  begin read only
   procedure Test_Get_Path_To_Square (Gnattest_T : in out Test);
   procedure Test_Get_Path_To_Square_5a92a2 (Gnattest_T : in out Test) renames Test_Get_Path_To_Square;
--  id:2.2/5a92a2f6078b5e69/Get_Path_To_Square/1/0/
   procedure Test_Get_Path_To_Square (Gnattest_T : in out Test) is
   --  piece.ads:184:3:Get_Path_To_Square
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
