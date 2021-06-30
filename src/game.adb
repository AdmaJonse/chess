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
    
    Checkmate : Boolean := False;
    
  begin
    
    -- Look for the set of possible moves that would escape check.
    -- If no possible move exists, then this is checkmate.
    
    -- There are three ways to escape check:
    -- 1. Move the king to a position that is not attacked.
    -- 2. Block all pieces (there could be more than one in this case) that are attacking the king
    --    If multiple pieces are attacking the king, look for moves that will block each attacker
    --    and then get the union of the set. If the union is empty, the attack cannot be blocked
    -- 3. Capture the piece (there can only be one in this case)  that is attacking the king
    
    return Checkmate;
      
  end Is_Checkmate;
  
  ------------------------------------------------------------------------------
  --
  function Is_Check return Boolean is
    
    Player_Colour   : constant Colour_Type         := This.Current_Turn;
    Opponent_Colour : constant Colour_Type         := (if This.Current_Turn = White then Black else White);
    Opponent_Pieces : Piece.Piece_Vector.Vector    := This.Game_Board.Get_Pieces (Opponent_Colour);
    Player_King     : constant Piece.Object_Access := This.Game_Board.Get_King (Player_Colour);
    
  begin
      
    -- Check if any piece exists that has a valid move to the king's square
    for P in Opponent_Pieces.Iterate loop
        
      declare
        Current_Piece : constant Piece.Object_Access    := Opponent_Pieces.Reference (P).Element.all;
        Valid_Moves   : constant Position_Vector.Vector := Piece.Get_Valid_Moves (Current_Piece);
      begin
        
        if Valid_Moves.Contains (Player_King.Position) then
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
