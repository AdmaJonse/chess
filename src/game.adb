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
    
    Player_Colour   : constant Colour_Type := This.Current_Turn;
    Opponent_Colour : constant Colour_Type := (if This.Current_Turn = White then Black else White);
    Player_Pieces   : Piece.Piece_Vector.Vector := This.Game_Board.Get_Pieces (Player_Colour);
    Opponent_King   : constant Piece.Object_Access := This.Game_Board.Get_King (Opponent_Colour);
    
  begin
      
    -- Check if any piece exists that has a valid move to the king's square
    for P in Player_Pieces.Iterate loop
        
      declare
        Current_Piece : constant Piece.Object_Access    := Player_Pieces.Reference (P).Element.all;
        Valid_Moves   : constant Position_Vector.Vector := Piece.Get_Valid_Moves (Current_Piece);
      begin
        
        if Valid_Moves.Contains (Opponent_King.Position) then
          return True;
        end if;  
        
      end;
      
    end loop;
    
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
