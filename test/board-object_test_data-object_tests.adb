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
with Common_Types;

with Pawn;
with Bishop;
with Knight;
with Rook;
with Queen;
with King;

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
   procedure Test_Get_Checking_Pieces (Gnattest_T : in out Test_Object);
   procedure Test_Get_Checking_Pieces_3f207f (Gnattest_T : in out Test_Object) renames Test_Get_Checking_Pieces;
--  id:2.2/3f207ff9530294f6/Get_Checking_Pieces/1/0/
   procedure Test_Get_Checking_Pieces (Gnattest_T : in out Test_Object) is
   --  board.ads:91:3:Get_Checking_Pieces
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Checking_Pieces;
--  end read only


--  begin read only
   procedure Test_String_To_Board (Gnattest_T : in out Test_Object);
   procedure Test_String_To_Board_2c31b5 (Gnattest_T : in out Test_Object) renames Test_String_To_Board;
--  id:2.2/2c31b53905b424b1/String_To_Board/1/0/
   procedure Test_String_To_Board (Gnattest_T : in out Test_Object) is
   --  board.ads:111:3:String_To_Board
--  end read only

    pragma Unreferenced (Gnattest_T);

    NL : constant Character := Ada.Characters.Latin_1.LF;

    Board_One : constant Board.Object :=
        (Squares =>
           ('A' => (Square.Make (new Rook.Object'(White, ('A', 1))),
                    Square.Make (new Pawn.Object'(White, ('A', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('A', 7))),
                    Square.Make (new Rook.Object'(Black, ('A', 8)))),
            'B' => (Square.Make (new Knight.Object'(White, ('B', 1))),
                    Square.Make (new Pawn.Object'(White, ('B', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('B', 7))),
                    Square.Make (new Knight.Object'(Black, ('B', 8)))),
            'C' => (Square.Make (new Bishop.Object'(White, ('C', 1))),
                    Square.Make (new Pawn.Object'(White, ('C', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('C', 7))),
                    Square.Make (new Bishop.Object'(Black, ('C', 8)))),
            'D' => (Square.Make (new Queen.Object'(White, ('D', 1))),
                    Square.Make (new Pawn.Object'(White, ('D', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('D', 7))),
                    Square.Make (new Queen.Object'(Black, ('D', 8)))),
            'E' => (Square.Make (new King.Object'(White, ('E', 1))),
                    Square.Make (new Pawn.Object'(White, ('E', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('E', 7))),
                    Square.Make (new King.Object'(Black, ('E', 8)))),
            'F' => (Square.Make (new Bishop.Object'(White, ('F', 1))),
                    Square.Make (new Pawn.Object'(White, ('F', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('F', 7))),
                    Square.Make (new Bishop.Object'(Black, ('F', 8)))),
            'G' => (Square.Make (new Knight.Object'(White, ('G', 1))),
                    Square.Make (new Pawn.Object'(White, ('G', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('G', 7))),
                    Square.Make (new Knight.Object'(Black, ('G', 8)))),
            'H' => (Square.Make (new Rook.Object'(White, ('H', 1))),
                    Square.Make (new Pawn.Object'(White, ('H', 2))),
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make,
                    Square.Make (new Pawn.Object'(Black, ('H', 7))),
                    Square.Make (new Rook.Object'(Black, ('H', 8))))));

    Board_String_One : constant String :=
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

    Board_Two : constant Board.Object :=
      (Squares =>
         ('A' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'B' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'C' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'D' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'E' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'F' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'G' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make),
          'H' => (Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make,
                  Square.Make)));

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
      (Actual   => Board.Image (Board.String_To_Board (Board_String_One)),
       Expected => Board.Image (Board_One),
       Message  => "Generated board does not match expected. ");

    AUnit.Assertions.Assert
      (Actual   => Board.Image (Board.String_To_Board (Board_String_Two)),
       Expected => Board.Image (Board_Two),
       Message  => "Generated board does not match expected. ");

--  begin read only
   end Test_String_To_Board;
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
