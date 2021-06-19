with Ada.Characters.Latin_1;
with Ada.Tags;
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
  
  ------------------------------------------------------------------------------
  --
  function Position_Lookup 
    (Position : in Common_Types.Position_Type)
     return Natural is
  
    Initial : Natural := 
      (if    Position.Rank = 1 then 541
       elsif Position.Rank = 2 then 469
       elsif Position.Rank = 3 then 397
       elsif Position.Rank = 4 then 325
       elsif Position.Rank = 5 then 253
       elsif Position.Rank = 6 then 181
       elsif Position.Rank = 7 then 109
       elsif Position.Rank = 8 then 37
       else  0);
  
    Offset : Natural := To_Num (Position.File) * 4;
    
  begin
  
    return Initial + Offset;
    
  end Position_Lookup;
     
  ------------------------------------------------------------------------------
  --
  function Image (This : in Object) return String is
    
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
        Board_String (Position_Lookup (Sq.Get_Contents.Position)) := Sq.Get_Contents.Image;
      end if;
    end loop;
    
    return Board_String;
    
  end Image;
  
  ------------------------------------------------------------------------------
  --
  procedure Print (This : in Object'Class) is
  begin
    
    Ada.Text_IO.Put_Line (Image (This));
    
  end Print;
  
  ------------------------------------------------------------------------------
  --
  function Make return Object_Access is
    
    Starting_Board : constant Object :=
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

  begin
    
    return new Object'(Starting_Board);
    
  end Make;
  
  ------------------------------------------------------------------------------
  --
  function Get_Square 
    (This     : in Object;
     Position : in Position_Type) 
     return Square.Object_Access is
    
  begin
    
    return This.Squares (Position.File, Position.Rank);
    
  end Get_Square;
  
  ------------------------------------------------------------------------------
  --
  function Get_Pieces 
    (This   : in Object;
     Colour : in Colour_Type) 
     return Piece.Piece_Vector.Vector is
    
    Pieces : Piece.Piece_Vector.Vector := Piece.Piece_Vector.Empty_Vector;
    
  begin
    
    for File in Common_Types.File_Type loop
      for Rank in Common_Types.Rank_Type loop
        
        if not This.Squares (File, Rank).Is_Empty and then 
          This.Squares (File, Rank).Get_Contents.Colour = Colour then
          
          Pieces.Append (This.Squares (File, Rank).Get_Contents);
          
        end if;
      end loop;
    end loop;
    
    return Pieces;
    
  end Get_Pieces;
  
  ------------------------------------------------------------------------------
  --
  function Get_King 
    (This   : in Object;
     Colour : in Common_Types.Colour_Type) 
     return Piece.Object_Access is
    
    use type Ada.Tags.Tag;
    
    Pieces   : Piece.Piece_Vector.Vector := This.Get_Pieces (Colour);
    
  begin
    
    for P in Pieces.Iterate loop
        
      if Pieces.Reference (P).Element.all'Tag = King.Object'Tag then
        return Pieces.Reference (P).Element.all;
      end if;
        
    end loop;
    
    -- The king doesn't exist for some reason. This should never happen.
    raise Piece_Not_Found;
    
  end Get_King;
  
end Board;
