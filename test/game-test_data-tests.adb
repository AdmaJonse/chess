--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Game.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Common_Types;

use Common_Types;

--  begin read only
--  end read only
package body Game.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Initialize (Gnattest_T : in out Test);
   procedure Test_Initialize_09a67f (Gnattest_T : in out Test) renames Test_Initialize;
--  id:2.2/09a67fe85a5041a3/Initialize/1/0/
   procedure Test_Initialize (Gnattest_T : in out Test) is
   --  game.ads:27:3:Initialize
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Board.Object;

  begin

    Game.Initialize (Board.Make);

    AUnit.Assertions.Assert
      (Game.Get_Board.all = Board.Make.all,
       "Game board is not the starting board.");

    AUnit.Assertions.Assert
      (Game.Get_Turn = White,
       "Game turn is not not white.");

    declare

      use type Board.Object_Access;

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

      Empty_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Initialize (Empty_Board'Unrestricted_Access);

      AUnit.Assertions.Assert
        (Game.Get_Board = Empty_Board'Unrestricted_Access,
         "Game board is not the empty board.");

      AUnit.Assertions.Assert
        (Game.Get_Turn = White,
         "Game turn is not not white.");
    end;

--  begin read only
   end Test_Initialize;
--  end read only


--  begin read only
   procedure Test_Is_Check (Gnattest_T : in out Test);
   procedure Test_Is_Check_a4aaa1 (Gnattest_T : in out Test) renames Test_Is_Check;
--  id:2.2/a4aaa1ad2ab3c658/Is_Check/1/0/
   procedure Test_Is_Check (Gnattest_T : in out Test) is
   --  game.ads:34:3:Is_Check
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

      Starting_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (Starting_Board'Unrestricted_Access);
      Game.Set_Turn (White);

      AUnit.Assertions.Assert
        (not Game.Is_Check,
         "Starting board indicates check for white.");

      Game.Set_Turn (Black);

      AUnit.Assertions.Assert
        (not Game.Is_Check,
         "Starting board indicates check for black.");

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r | n | b | q | k | b | n | r |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p |   | p | p | p | p |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 | Q |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P | P |   | P | P | P | P | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B |   | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn (Black);

      AUnit.Assertions.Assert
        (not Game.Is_Check,
         "Board indicates check for black.");

      Game.Set_Turn (White);

      AUnit.Assertions.Assert
        (Game.Is_Check,
         "Board does not indicate check for white.");

    end;

    declare

      Board_String : constant String :=
        "  - - - - - - - - - - - - - - - - -" & NL &
        "8 | r | n | b | q | k | b | n |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "7 | p | p | p |   | r | p | p |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "6 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "5 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "4 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "3 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "2 | P | P |   |   |   | P | P | P |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 | R | N | B |   | K | B | N | R |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      The_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (The_Board'Unrestricted_Access);
      Game.Set_Turn (White);

      AUnit.Assertions.Assert
        (not Game.Is_Check,
         "Board indicates check for white.");

      Game.Set_Turn (Black);

      AUnit.Assertions.Assert
        (Game.Is_Check,
         "Board does not indicate check for black.");

    end;

--  begin read only
   end Test_Is_Check;
--  end read only


--  begin read only
   procedure Test_Is_Checkmate (Gnattest_T : in out Test);
   procedure Test_Is_Checkmate_cd1bf9 (Gnattest_T : in out Test) renames Test_Is_Checkmate;
--  id:2.2/cd1bf9944344c7bf/Is_Checkmate/1/0/
   procedure Test_Is_Checkmate (Gnattest_T : in out Test) is
   --  game.ads:41:3:Is_Checkmate
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Is_Checkmate;
--  end read only


--  begin read only
   procedure Test_Is_Draw (Gnattest_T : in out Test);
   procedure Test_Is_Draw_248615 (Gnattest_T : in out Test) renames Test_Is_Draw;
--  id:2.2/248615b2827a0899/Is_Draw/1/0/
   procedure Test_Is_Draw (Gnattest_T : in out Test) is
   --  game.ads:48:3:Is_Draw
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Is_Draw;
--  end read only


--  begin read only
   procedure Test_Is_Game_Over (Gnattest_T : in out Test);
   procedure Test_Is_Game_Over_2cf089 (Gnattest_T : in out Test) renames Test_Is_Game_Over;
--  id:2.2/2cf089b27f499bcb/Is_Game_Over/1/0/
   procedure Test_Is_Game_Over (Gnattest_T : in out Test) is
   --  game.ads:55:3:Is_Game_Over
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Is_Game_Over;
--  end read only


--  begin read only
   procedure Test_Get_Board (Gnattest_T : in out Test);
   procedure Test_Get_Board_73aa74 (Gnattest_T : in out Test) renames Test_Get_Board;
--  id:2.2/73aa741c6c7c92b1/Get_Board/1/0/
   procedure Test_Get_Board (Gnattest_T : in out Test) is
   --  game.ads:62:3:Get_Board
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Board.Object_Access;

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

      Starting_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (Starting_Board'Unrestricted_Access);

      AUnit.Assertions.Assert
        (Game.Get_Board = Starting_Board'Unrestricted_Access,
         "Could not get starting board.");

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
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      Empty_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (Empty_Board'Unrestricted_Access);

      AUnit.Assertions.Assert
        (Game.Get_Board = Empty_Board'Unrestricted_Access,
         "Could not get empty board.");

    end;

--  begin read only
   end Test_Get_Board;
--  end read only


--  begin read only
   procedure Test_Set_Board (Gnattest_T : in out Test);
   procedure Test_Set_Board_be6db6 (Gnattest_T : in out Test) renames Test_Set_Board;
--  id:2.2/be6db691bb62137d/Set_Board/1/0/
   procedure Test_Set_Board (Gnattest_T : in out Test) is
   --  game.ads:69:3:Set_Board
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Board.Object_Access;

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

      Starting_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (Starting_Board'Unrestricted_Access);

      AUnit.Assertions.Assert
        (Game.Get_Board = Starting_Board'Unrestricted_Access,
         "Could not set starting board.");

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
        "2 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "1 |   |   |   |   |   |   |   |   |" & NL &
        "  - - - - - - - - - - - - - - - - -" & NL &
        "    A   B   C   D   E   F   G   H  ";

      Empty_Board : Board.Object := Board.To_Board (Board_String);

    begin

      Game.Set_Board (Empty_Board'Unrestricted_Access);

      AUnit.Assertions.Assert
        (Game.Get_Board = Empty_Board'Unrestricted_Access,
         "Could not set empty board.");

    end;

--  begin read only
   end Test_Set_Board;
--  end read only


--  begin read only
   procedure Test_Set_Turn (Gnattest_T : in out Test);
   procedure Test_Set_Turn_e986b6 (Gnattest_T : in out Test) renames Test_Set_Turn;
--  id:2.2/e986b639a9eae583/Set_Turn/1/0/
   procedure Test_Set_Turn (Gnattest_T : in out Test) is
   --  game.ads:76:3:Set_Turn
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    Game.Initialize (Board.Make);
    Game.Set_Turn (Black);

    AUnit.Assertions.Assert
      (Game.Get_Turn = Black,
       "Game turn is not not black.");

    Game.Set_Turn (White);

    AUnit.Assertions.Assert
      (Game.Get_Turn = White,
       "Game turn is not not white.");

--  begin read only
   end Test_Set_Turn;
--  end read only


--  begin read only
   procedure Test_Get_Turn (Gnattest_T : in out Test);
   procedure Test_Get_Turn_f3e85b (Gnattest_T : in out Test) renames Test_Get_Turn;
--  id:2.2/f3e85bf2b19fc18d/Get_Turn/1/0/
   procedure Test_Get_Turn (Gnattest_T : in out Test) is
   --  game.ads:83:3:Get_Turn
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    Game.Initialize (Board.Make);

    AUnit.Assertions.Assert
      (Game.Get_Turn = White,
       "Game turn is not not white.");

    Game.Set_Turn (Black);

    AUnit.Assertions.Assert
      (Game.Get_Turn = Black,
       "Game turn is not not black.");

    Game.Set_Turn (White);

    AUnit.Assertions.Assert
      (Game.Get_Turn = White,
       "Game turn is not not white.");

--  begin read only
   end Test_Get_Turn;
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
end Game.Test_Data.Tests;
