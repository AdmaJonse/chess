with Ada.Characters.Latin_1;
with Ada.Text_Io;
with Bishop;
with Common_Types;
with King;
with Knight;
with Pawn;
with Piece;
with Queen;
with Rook;
with Square;

use Common_Types;

package body Board is
  
  NL : constant Character := Ada.Characters.Latin_1.LF;
  
  function Position_Lookup 
    (File : in Common_Types.File;
     Rank : in Common_Types.Rank) 
     return Natural is
  
    Initial : Natural := 
      (if    Rank = 1 then 541
       elsif Rank = 2 then 469
       elsif Rank = 3 then 397
       elsif Rank = 4 then 325
       elsif Rank = 5 then 253
       elsif Rank = 6 then 181
       elsif Rank = 7 then 109
       elsif Rank = 8 then 37
       else  0);
  
    Offset : Natural := To_Num (File) * 4;
    
  begin
  
    return Initial + Offset;
    
  end Position_Lookup;
     
  ------------------------------------------------------------------------------
  --
  function Get_Game_Board (This : in Object) return String is
    
    use type Piece.Object_Access;
    
    Board_String : String :=
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
    
    for Sq of This.Squares loop
      
      if Sq.Get_Contents /= null then
        Board_String (Position_Lookup (Sq.Get_File, Sq.Get_Rank)) := Sq.Get_Contents.Image;
      end if;
    end loop;
    
    return Board_String;
    
  end Get_Game_Board;
  
  ------------------------------------------------------------------------------
  --
  procedure Print (This : in Object'Class) is
  begin
    
    Ada.Text_IO.Put_Line (Get_Game_Board (This));
    
  end Print;
  
  ------------------------------------------------------------------------------
  --
  function Make return Object_Access is
    
    Starting_Board : constant Object :=
      (Squares => 
         ('A' => (Square.Make ('A', 1, new Rook.Object'(Colour => White)), 
                  Square.Make ('A', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('A', 3), 
                  Square.Make ('A', 4), 
                  Square.Make ('A', 5), 
                  Square.Make ('A', 6), 
                  Square.Make ('A', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('A', 8, new Rook.Object'(Colour => Black))),
          'B' => (Square.Make ('B', 1, new Knight.Object'(Colour => White)), 
                  Square.Make ('B', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('B', 3), 
                  Square.Make ('B', 4), 
                  Square.Make ('B', 5), 
                  Square.Make ('B', 6), 
                  Square.Make ('B', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('B', 8, new Knight.Object'(Colour => Black))),
          'C' => (Square.Make ('C', 1, new Bishop.Object'(Colour => White)), 
                  Square.Make ('C', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('C', 3), 
                  Square.Make ('C', 4), 
                  Square.Make ('C', 5), 
                  Square.Make ('C', 6), 
                  Square.Make ('C', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('C', 8, new Bishop.Object'(Colour => Black))),
          'D' => (Square.Make ('D', 1, new Queen.Object'(Colour => White)), 
                  Square.Make ('D', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('D', 3), 
                  Square.Make ('D', 4), 
                  Square.Make ('D', 5), 
                  Square.Make ('D', 6), 
                  Square.Make ('D', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('D', 8, new Queen.Object'(Colour => Black))),
          'E' => (Square.Make ('E', 1, new King.Object'(Colour => White)), 
                  Square.Make ('E', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('E', 3), 
                  Square.Make ('E', 4), 
                  Square.Make ('E', 5), 
                  Square.Make ('E', 6), 
                  Square.Make ('E', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('E', 8, new King.Object'(Colour => Black))),
          'F' => (Square.Make ('F', 1, new Bishop.Object'(Colour => White)), 
                  Square.Make ('F', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('F', 3), 
                  Square.Make ('F', 4), 
                  Square.Make ('F', 5), 
                  Square.Make ('F', 6), 
                  Square.Make ('F', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('F', 8, new Bishop.Object'(Colour => Black))),
          'G' => (Square.Make ('G', 1, new Knight.Object'(Colour => White)), 
                  Square.Make ('G', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('G', 3), 
                  Square.Make ('G', 4), 
                  Square.Make ('G', 5), 
                  Square.Make ('G', 6), 
                  Square.Make ('G', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('G', 8, new Knight.Object'(Colour => Black))),
          'H' => (Square.Make ('H', 1, new Rook.Object'(Colour => White)), 
                  Square.Make ('H', 2, new Pawn.Object'(Colour => White)), 
                  Square.Make ('H', 3), 
                  Square.Make ('H', 4), 
                  Square.Make ('H', 5), 
                  Square.Make ('H', 6), 
                  Square.Make ('H', 7, new Pawn.Object'(Colour => Black)), 
                  Square.Make ('H', 8, new Rook.Object'(Colour => Black)))));

  begin
    
    return new Object'(Starting_Board);
    
  end Make;
  
  function Get_Square 
    (This : in Object_Access;
     File : in Common_Types.File;
     Rank : in Common_Types.Rank) 
     return Square.Object_Access is
    
  begin
    
    return This.Squares (File, Rank);
    
  end Get_Square;
  
  function Get_Square 
    (This     : in Object_Access;
     Position : in String) 
     return Square.Object_Access is
    
    File : Common_Types.File;
    Rank : Common_Types.Rank;
    
  begin
    
    if Position'Length /= 2 then
      raise Common_Types.Invalid_Square;
    end if;
    
    File := Position (Position'First);
    Rank := Common_Types.Rank'Value ((1 => Position (Position'Last)));
    
    return This.Squares (File, Rank);
    
  end Get_Square;
  
end Board;
