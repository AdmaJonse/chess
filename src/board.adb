with Ada.Characters.Latin_1;
with Ada.Strings.Fixed;
with Ada.Tags;
with Ada.Text_Io;
with Bishop;
with Common_Types;
with King;
with Knight;
with Queen;
with Pawn;
with Piece_Factory;
with Rook;

use Common_Types;

package body Board is
  
  Invalid_Index : Exception;
  
  ------------------------------------------------------------------------------
  --
  function Make 
    (Squares : in Square.Square_Array := Square.Empty_Squares) 
     return Object_Access is
    
    use type Square.Square_Array;

  begin
    
    if Squares = Square.Empty_Squares then
      return new Object'((Squares => Starting_Squares));
    else
      return new Object'((Squares => Squares));
    end if;
    
  end Make;
  
  ------------------------------------------------------------------------------
  --
  --  Description:
  --    This function is used to determine the index in the game board string
  --    (see the Image function) of a given position. We determine the index
  --    using the position's rank as the starting point, then offset based 
  --    on the position's file.
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
  --  Description:
  --    This function is used to determine the rank and file of a given index
  --    in the game board string (see the Image function).
  --
  function Position_Lookup 
    (Index : in Natural)
     return Position_Type is
  begin
    
    for Rank in Rank_Type loop
      for File in File_Type loop
        
        if Position_Lookup ((Rank => Rank, File => File)) = Index then
          return (Rank => Rank, File => File);
        end if;
        
      end loop;
    end loop;
    
    -- The given index does not correspond to a position in the board string.
    raise Invalid_Index;
    
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
      
      if not Sq.Is_Empty then
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
    
    Pieces : Piece.Piece_Vector.Vector := This.Get_Pieces (Colour);
    
  begin
    
    for P of Pieces loop
        
      if P'Tag = King.Object'Tag then
        return P;
      end if;
        
    end loop;
    
    -- The king doesn't exist for some reason. This should never happen.
    raise Piece_Not_Found;
    
  end Get_King;
  
  ------------------------------------------------------------------------------
  --
  function Get_Checking_Pieces
    (This   : in Object;
     Colour : in Common_Types.Colour_Type)
     return Piece.Piece_Vector.Vector is
    
    use type Ada.Tags.Tag;
    
    Checking_Pieces : Piece.Piece_Vector.Vector    := Piece.Piece_Vector.Empty_Vector;
    Opponent_Colour : constant Colour_Type         := (if Colour = White then Black else White);
    Player_Pieces   : Piece.Piece_Vector.Vector    := This.Get_Pieces (Colour);
    Opponent_King   : constant Piece.Object_Access := This.Get_King (Opponent_Colour);
    
  begin
    
    for P of Player_Pieces loop
      
      if P'Tag /= King.Object'Tag and then 
        Piece.Get_Valid_Moves (P).Contains (Opponent_King.Position) then
        
        Checking_Pieces.Append (P);
        
      end if;
      
    end loop;
    
    return Checking_Pieces;
    
  end Get_Checking_Pieces;
  
  ------------------------------------------------------------------------------
  --
  function To_Board
    (Board_String : in String)
     return Object is
    
    Game_Board : Object := Empty_Board;
    
  begin
    
    for Index in Board_String'Range loop
      
      if Ada.Strings.Fixed.Index ("pPrRbBnNqQkK", (1 => Board_String (Index))) > 0 then
        
        begin
          
          declare
            Position : Position_Type := Position_Lookup (Index);
          begin
            Game_Board.Squares (Position.File, Position.Rank) := Square.Make (Piece_Factory.Construct (Board_String (Index), Position));
          end;
          
        exception
          when Invalid_Index =>
            null;
        end;
        
      end if;
      
    end loop;
    
    return Game_Board;
    
  end To_Board;
  
end Board;
