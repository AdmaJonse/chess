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
    
    Player_Colour   : constant Colour_Type         := This.Current_Turn;
    Opponent_Colour : constant Colour_Type         := (if This.Current_Turn = White then Black else White);
    Player_Pieces   : Piece.Piece_Vector.Vector    := This.Game_Board.Get_Pieces (Player_Colour);
    Opponent_King   : constant Piece.Object_Access := This.Game_Board.Get_King (Opponent_Colour);
    Checking_Pieces : Piece.Piece_Vector.Vector    := This.Game_Board.Get_Checking_Pieces (Player_Colour);
    
    Checkmate    : Boolean := False;
    No_King_Move : Boolean := False;
    
  begin
    
    -- Look for the set of possible moves that would escape check.
    -- If no possible move exists, then this is checkmate.
    
    -- There are three ways to escape check:
    -- 1. Move the king to a position that is not attacked.
    -- 2. Block all pieces (there could be more than one in this case) that are attacking the king
    --    If multiple pieces are attacking the king, look for moves that will block each attacker
    --    and then get the union of the set. If the union is empty, the attack cannot be blocked
    -- 3. Capture the piece (there can only be one in this case)  that is attacking the king
    
    if Checking_Pieces.Is_Empty then
      return False;
    end if;
    
    -- Check for a valid move by the king to get out of check
    declare 
      Valid_Moves : Position_Vector.Vector := Piece.Get_Valid_Moves (Opponent_King);
    begin
      No_King_Move := Valid_Moves.Is_Empty;
    end;
    
    -- TODO: How do we handle cases where multiple pieces are checking?
    --       In this case we'd need to find a single move that can block all checking paths.
    
    -- For now, assume there's only one checking piece?
    
    -- Check if a piece can block the checking piece
    --  for C of Checking_Pieces loop
    --  
    --    for P in Player_Pieces.
    --  
    --  end loop;
    --  
    --    declare
    --      Current_Piece : constant Piece.Object_Access := Player_Pieces.Reference (P).Element.all;
    --      Path          : Piece.Path_Function := null;
    --    begin
    --  
    --  
    --  
    --    exception
    --  
    --      when Path_Not_Found =>
    --  
    --        -- No
    --        null;
    --  
    --    end;
    --  
    --  
    --  end loop;
    --  
    --  
    -- conditions: The king is in check
    -- conditions: The king cannot move to another position that isn't also check
    -- conditions: A piece of the king's colour can't capture the attacking piece
    -- conditions: A piece of the king's colour can't block the attacking piece 
    
    --  Checkmate :=
    --    Is_Check and
    --    No_King_Move and
    --    not Blocking_Move_Found and
    --    not Capture_Found;
    
    return Checkmate;
      
  end Is_Checkmate;
  
  ------------------------------------------------------------------------------
  --
  function Is_Check return Boolean is
    
    Player_Colour   : constant Colour_Type         := This.Current_Turn;
    Opponent_Colour : constant Colour_Type         := (if This.Current_Turn = White then Black else White);
    Player_Pieces   : Piece.Piece_Vector.Vector    := This.Game_Board.Get_Pieces (Player_Colour);
    Opponent_King   : constant Piece.Object_Access := This.Game_Board.Get_King (Opponent_Colour);
    
  begin
      
    -- Check if any piece exists that has a valid move to the king's square
    for P of Player_Pieces loop
        
      declare
        Valid_Moves : constant Position_Vector.Vector := Piece.Get_Valid_Moves (P);
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
  procedure Set_Board (Game_Board : in Board.Object_Access) is
  begin
    
    This.Game_Board := Game_Board;
    
  end Set_Board;
  
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
