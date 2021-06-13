with Ada.Tags;
with Common_Types;
with King;
with Piece;

use Common_Types;

package body Game is

  ------------------------------------------------------------------------------
  --
  function Make 
    (Game_Board : in Board.Object_Access) 
     return Object_Access is
  begin
    
    return new Object'(Game_Board   => Game_Board,
                       Current_Turn => Common_Types.White);
    
  end Make;
   
  ------------------------------------------------------------------------------
  --
  function Is_Checkmate 
    (This : in Object) 
     return Boolean is
  begin
      
    -- TODO
    return False;
      
  end Is_Checkmate;
  
  ------------------------------------------------------------------------------
  --
  function Is_Check
    (This : in Object) 
     return Boolean is
    
    use type Ada.Tags.Tag;
    
    White_Pieces : Piece.Piece_Vector.Vector := This.Game_Board.Get_Pieces (White);
    Black_Pieces : Piece.Piece_Vector.Vector := This.Game_Board.Get_Pieces (Black);
    
    The_King : Piece.Object_Access;
    
    Check : Boolean := False;
    
  begin
    
    -- TODO: The Piece Is_Valid_Move needs to take intersections into consideration
    --       or everything is going to be check.
    
    if This.Current_Turn = White then
      
      -- Get the king of the opposite colour
      for P in Black_Pieces.Iterate loop
        
        if Black_Pieces.Reference (P).Element.all'Tag = King.Object'Tag then
          The_King := Black_Pieces.Reference (P).Element.all;
        end if;
        
      end loop;
      
      -- Check if any piece exists that has a valid move to the king's square
      for P in White_Pieces.Iterate loop
        
        if White_Pieces.Reference (P).Element.all.Is_Valid_Move (The_King.Position) then
          Check := True;
        end if;
        
      end loop;
      
    else 
      
      for P in White_Pieces.Iterate loop
        
        if White_Pieces.Reference (P).Element.all'Tag = King.Object'Tag then
          The_King := White_Pieces.Reference (P).Element.all;
        end if;
        
      end loop;
      
      -- Check if any piece exists that has a valid move to the king's square
      for P in Black_Pieces.Iterate loop
        
        if Black_Pieces.Reference (P).Element.all.Is_Valid_Move (The_King.Position) then
          Check := True;
        end if;
        
      end loop;
      
    end if;
    
    return Check;
      
  end Is_Check;
   
  ------------------------------------------------------------------------------
  --
  function Is_Draw 
    (This : in Object) 
     return Boolean is
  begin
    
    -- case: insufficient material - king vs king
    -- case: insufficient material - king and bishop vs king
    -- case: insufficient material - king and knight vs king
    -- case: insufficient material - king and bishop vs king and bishop of same coloured sqaure
    -- case: stalemate - no valid moves for one player
    -- case: timeout vs insufficient material (no timer yet)
    -- case: draw by agreement
    -- case: draw by repetition (same board state three times)
    -- case: 50 move rule
      
    -- TODO
    return False;
      
  end Is_Draw;
  
  ------------------------------------------------------------------------------
  --
  function Get_Board 
    (This : in Object) 
     return Board.Object_Access is (This.Game_Board);
  
  ------------------------------------------------------------------------------
  --
  procedure Set_Turn 
    (This   : in out Object;
     Colour : in Common_Types.Colour_Type) is
  begin
    
    This.Current_Turn := Colour;
    
  end Set_Turn;
  
  ------------------------------------------------------------------------------
  --
  function Get_Turn 
    (This : in Object)
     return Common_Types.Colour_Type is (This.Current_Turn);
  
end Game;
