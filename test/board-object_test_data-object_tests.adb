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
with Ada.Characters.Latin_1;
with Bishop;
with Common_Types;
with Game;
with King;
with Knight;
with Pawn;
with Piece_Factory;
with Queen;
with Rook;

use Common_Types;
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
   --  board.ads:52:3:Image
--  end read only

    pragma Unreferenced (Gnattest_T);

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
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";
      
      The_Board : Board.Object_Access := Board.Make (Empty_Squares);
      
    begin
      
      AUnit.Assertions.Assert
        (Actual   => The_Board.Image,
         Expected => Board_String,
         Message  => "The image of the empty board was not correct.");
      
    end;

--  begin read only
   end Test_Image;
--  end read only


--  begin read only
   procedure Test_Get_Square (Gnattest_T : in out Test_Object);
   procedure Test_Get_Square_e55c77 (Gnattest_T : in out Test_Object) renames Test_Get_Square;
--  id:2.2/e55c77f7405982db/Get_Square/1/0/
   procedure Test_Get_Square (Gnattest_T : in out Test_Object) is
   --  board.ads:65:3:Get_Square
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    declare

      The_Board : constant Board.Object_Access := Board.Make (Empty_Squares);

    begin

      AUnit.Assertions.Assert
        (The_Board.Get_Square (('A', 1)).all.Is_Empty,
         "Failed to retrieve square from empty board.");

    end;

    declare

      use type Piece.Object'Class;

      The_Board  : constant Board.Object_Access := Board.Make;
      White_Pawn : constant Piece.Object_Access := Piece_Factory.Construct ('P', ('A', 2));

    begin

      AUnit.Assertions.Assert
        (The_Board.Get_Square (('A', 2)).Get_Contents.all = White_Pawn.all,
         "Failed to retrieve square from starting board.");

    end;

--  begin read only
   end Test_Get_Square;
--  end read only


--  begin read only
   procedure Test_Get_Pieces (Gnattest_T : in out Test_Object);
   procedure Test_Get_Pieces_e83e69 (Gnattest_T : in out Test_Object) renames Test_Get_Pieces;
--  id:2.2/e83e69a442f7bec6/Get_Pieces/1/0/
   procedure Test_Get_Pieces (Gnattest_T : in out Test_Object) is
   --  board.ads:78:3:Get_Pieces
--  end read only

    pragma Unreferenced (Gnattest_T);
    
    

  begin
    
    declare
      Empty_Board  : Board.Object_Access       := Board.Make (Board.Empty_Squares);
      White_Pieces : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;
      Black_Pieces : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;
    begin
      
      AUnit.Assertions.Assert
        (Piece.Is_Match (Empty_Board.Get_Pieces (White), White_Pieces),
         "Failed to get white pieces from empty board.");
      
      AUnit.Assertions.Assert
        (Piece.Is_Match (Empty_Board.Get_Pieces (Black), Black_Pieces),
         "Failed to get black pieces from empty board.");
      
    end;
    
    declare
      Starting_Board : Board.Object_Access       := Board.Make;
      White_Pieces   : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;
      Black_Pieces   : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;
    begin
      
      White_Pieces.Append (new Rook.Object'(White, ('A', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('A', 2)));
      White_Pieces.Append (new Knight.Object'(White, ('B', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('B', 2)));
      White_Pieces.Append (new Bishop.Object'(White, ('C', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('C', 2)));
      White_Pieces.Append (new Queen.Object'(White, ('D', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('D', 2)));
      White_Pieces.Append (new King.Object'(White, ('E', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('E', 2)));
      White_Pieces.Append (new Bishop.Object'(White, ('F', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('F', 2)));
      White_Pieces.Append (new Knight.Object'(White, ('G', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('G', 2)));
      White_Pieces.Append (new Rook.Object'(White, ('H', 1)));
      White_Pieces.Append (new Pawn.Object'(White, ('H', 2)));
      
      AUnit.Assertions.Assert
        (Piece.Is_Match (Starting_Board.Get_Pieces (White), White_Pieces),
         "Failed to get white pieces from starting board." & NL &
           "Expcted: " & NL & Piece.Image (Pieces => White_Pieces) & NL &
           "Actual: " & NL & Piece.Image (Pieces => Starting_Board.Get_Pieces (White)) & NL);
      
      
      Black_Pieces.Append (new Pawn.Object'(Black, ('A', 7)));
      Black_Pieces.Append (new Rook.Object'(Black, ('A', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('B', 7)));
      Black_Pieces.Append (new Knight.Object'(Black, ('B', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('C', 7)));
      Black_Pieces.Append (new Bishop.Object'(Black, ('C', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('D', 7)));
      Black_Pieces.Append (new Queen.Object'(Black, ('D', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('E', 7)));
      Black_Pieces.Append (new King.Object'(Black, ('E', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('F', 7)));
      Black_Pieces.Append (new Bishop.Object'(Black, ('F', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('G', 7)));
      Black_Pieces.Append (new Knight.Object'(Black, ('G', 8)));
      Black_Pieces.Append (new Pawn.Object'(Black, ('H', 7)));
      Black_Pieces.Append (new Rook.Object'(Black, ('H', 8)));
      
      AUnit.Assertions.Assert
        (Piece.Is_Match (Starting_Board.Get_Pieces (Black), Black_Pieces),
         "Failed to get black pieces from starting board.");
      
    end;
      

--  begin read only
   end Test_Get_Pieces;
--  end read only


--  begin read only
   procedure Test_Get_King (Gnattest_T : in out Test_Object);
   procedure Test_Get_King_37db7f (Gnattest_T : in out Test_Object) renames Test_Get_King;
--  id:2.2/37db7f9eb10b885b/Get_King/1/0/
   procedure Test_Get_King (Gnattest_T : in out Test_Object) is
   --  board.ads:91:3:Get_King
--  end read only

    pragma Unreferenced (Gnattest_T);
    
    use type Piece.Object'Class;

   begin

    declare
      Starting_Board : constant Board.Object_Access := Board.Make;
      White_King     : constant Piece.Object_Access := Piece_Factory.Construct ('K', ('E', 1));
      Black_King     : constant Piece.Object_Access := Piece_Factory.Construct ('k', ('E', 8));
    begin
      
      AUnit.Assertions.Assert
        (Starting_Board.Get_King (White).all = White_King.all,
         "Could not find the white king on the starting board.");
      
      AUnit.Assertions.Assert
        (Starting_Board.Get_King (Black).all = Black_King.all,
         "Could not find the black king on the starting board.");
      
    end;

--  begin read only
   end Test_Get_King;
--  end read only


--  begin read only
   procedure Test_Get_Checking_Pieces (Gnattest_T : in out Test_Object);
   procedure Test_Get_Checking_Pieces_3f207f (Gnattest_T : in out Test_Object) renames Test_Get_Checking_Pieces;
--  id:2.2/3f207ff9530294f6/Get_Checking_Pieces/1/0/
   procedure Test_Get_Checking_Pieces (Gnattest_T : in out Test_Object) is
   --  board.ads:105:3:Get_Checking_Pieces
--  end read only

    pragma Unreferenced (Gnattest_T);

   begin

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r | n | b | q | k | b | n | r |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p | p | p | p | p | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P | P | P | P | P | P | P | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B | Q | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";
      
      The_Board : constant Board.Object := To_Board (Board_String);

    begin
      
      Game.Set_Board (The_Board'Unrestricted_Access);

      AUnit.Assertions.Assert
        (Piece.Is_Match (The_Board.Get_Checking_Pieces (White), Piece.Piece_Vector.Empty_Vector),
         "Failed to get white checking pieces from starting board.");
      
      AUnit.Assertions.Assert
        (Piece.Is_Match (The_Board.Get_Checking_Pieces (Black), Piece.Piece_Vector.Empty_Vector),
         "Failed to get black checking pieces from starting board.");

    end;
    
    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | R |   |   |   | k |   |   |   |" & NL &
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
        "1 |   |   |   |   | K |   |   | r |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";
      
      The_Board    : constant Board.Object     := To_Board (Board_String);
      White_Piece  : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;
      Black_Piece  : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;

    begin
      
      Game.Set_Board (The_Board'Unrestricted_Access);
      
      White_Piece.Append (Piece_Factory.Construct ('R', ('A', 8)));

      AUnit.Assertions.Assert
        (Piece.Is_Match (The_Board.Get_Checking_Pieces (White), White_Piece),
         "Failed to get white checking pieces.");
      
      Black_Piece.Append (Piece_Factory.Construct ('r', ('H', 1)));                        
                             
      AUnit.Assertions.Assert
        (Piece.Is_Match (The_Board.Get_Checking_Pieces (Black), Black_Piece),
         "Failed to get black checking pieces.");

    end;

--  begin read only
   end Test_Get_Checking_Pieces;
--  end read only


--  begin read only
   procedure Test_To_Board (Gnattest_T : in out Test_Object);
   procedure Test_To_Board_db3c2a (Gnattest_T : in out Test_Object) renames Test_To_Board;
--  id:2.2/db3c2a5536071d9a/To_Board/1/0/
   procedure Test_To_Board (Gnattest_T : in out Test_Object) is
   --  board.ads:125:3:To_Board
--  end read only

      pragma Unreferenced (Gnattest_T);

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
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

    begin

      AUnit.Assertions.Assert
        (To_Board (Board_String) = Empty_Board,
         "To_String failed for empty board.");

    end;
    
    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r | n | b | q | k | b | n | r |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p | p | p | p | p | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P | P | P | P | P | P | P | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B | Q | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

    begin

      AUnit.Assertions.Assert
        (To_Board (Board_String) = Starting_Board,
         "To_String failed for starting board.");

    end;
    
--  begin read only
   end Test_To_Board;
--  end read only


--  begin read only
   --  procedure Test_String_To_Board (Gnattest_T : in out Test);
   --  procedure Test_String_To_Board_2c31b5 (Gnattest_T : in out Test) renames Test_String_To_Board;
--  id:2.2/2c31b53905b424b1/String_To_Board/0/1/
   --  procedure Test_String_To_Board (Gnattest_T : in out Test) is
--  end read only
-- null
--  begin read only
   --  end Test_String_To_Board;
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
