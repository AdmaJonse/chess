with Ada.Tags;
with Common_Types;
with King;
with Piece;

use Common_Types;

package body Game is

  ------------------------------------------------------------------------------
  --
  procedure Initialize (Game_Board : in Board.Object_Access) is
  begin
    
    This := new Object'(Game_Board   => Game_Board,
                        Current_Turn => Common_Types.White);
    
  end Initialize;
   
  ------------------------------------------------------------------------------
  --
  function Is_Checkmate return Boolean is
  begin
    
    -- conditions: The king is in check
    -- conditions: The king cannot move to another position that isn't also check
    -- conditions: A piece of the king's colour can't capture the attacking piece
    -- conditions: A piece of the king's colour can't block the attacking piece 
      
    -- TODO
    return False;
      
  end Is_Checkmate;
  
  ------------------------------------------------------------------------------
  --
  function Is_Check return Boolean is
    
    use type Ada.Tags.Tag;
    
    White_Pieces : Piece.Piece_Vector.Vector := This.Game_Board.Get_Pieces (White);
    Black_Pieces : Piece.Piece_Vector.Vector := This.Game_Board.Get_Pieces (Black);    
    The_King     : Piece.Object_Access;
    
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
          return True;
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
          return True;
        end if;
        
      end loop;
      
    end if;
    
    return False;
      
  end Is_Check;
   
  ------------------------------------------------------------------------------
  --
  function Is_Draw return Boolean is
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
  function Is_Game_Over return Boolean is (Is_Checkmate or Is_Draw);
  
  ------------------------------------------------------------------------------
  --
  function Get_Board return Board.Object_Access is (This.Game_Board);
  
  ------------------------------------------------------------------------------
  --
  procedure Set_Turn (Colour : in Common_Types.Colour_Type) is
  begin
    
    This.Current_Turn := Colour;
    
  end Set_Turn;
  
  ------------------------------------------------------------------------------
  --
  function Get_Turn return Common_Types.Colour_Type is (This.Current_Turn);
  
end Game;
