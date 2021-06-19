with Ada.Characters.Latin_1;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Board;
with Common_Types;
with Gnat.OS_Lib;
with Piece;
with Square;

use Ada.Strings.Unbounded;
use Common_Types;

package body Move is
  
  NL : constant Character := Ada.Characters.Latin_1.LF;

  ------------------------------------------------------------------------------
  --
  function Make return Object_Access is (new Object);
  
  ------------------------------------------------------------------------------
  --
  function Get_From 
    (This : in Object) 
     return Common_Types.Position_Type is (This.From);
  
  ------------------------------------------------------------------------------
  --
  function Get_To 
    (This : in Object) 
     return Common_Types.Position_Type is (This.To);
  
  ------------------------------------------------------------------------------
  --
  function Is_Capture 
    (This : in Object)
     return Boolean is (This.Capture);

  ------------------------------------------------------------------------------
  --
  function Get_Move 
    (On_Board  : in Board.Object_Access;
     Player    : in Common_Types.Colour_Type) 
     return Object is
    
    use type Common_Types.Colour_Type;
    use type Piece.Object_Access;
    use type String;
    
    From        : Ada.Strings.Unbounded.Unbounded_String;
    To          : Ada.Strings.Unbounded.Unbounded_String;
    Valid_From  : Boolean := False;
    Valid_To    : Boolean := False;
    From_Square : Square.Object_Access;
    To_Square   : Square.Object_Access;
    The_Piece   : Piece.Object_Access;
    The_Move    : Object;
    Capture     : Boolean := False;
    Blocked     : Common_Types.Position_Vector.Vector;
    
    ----------------------------------------------------------------------------
    --
    function Is_Valid_From return Boolean is
      
      Is_Empty          : constant Boolean := From_Square.Is_Empty;
      Is_Correct_Colour : constant Boolean := not Is_Empty and then The_Piece.Colour = Player;
      No_Moves          : constant Boolean := Piece.Get_Valid_Positions (The_Piece).Is_Empty;
      
    begin
      
      if Is_Empty then
        Ada.Text_IO.Put_Line ("Invalid - the selected square is empty.");
      elsif not Is_Correct_Colour then
        Ada.Text_IO.Put_Line ("Invalid - the selected piece is the wrong colour.");
      elsif No_Moves then
        Ada.Text_IO.Put_Line ("Invalid - the selected piece has no valid moves.");
      end if;
      
      return not Is_Empty and Is_Correct_Colour and not No_Moves;
      
    end Is_Valid_From;
    
    ----------------------------------------------------------------------------
    --
    function Is_Valid_To return Boolean is
      
      Is_Valid_Move         : constant Boolean := The_Piece.Is_Valid_Move (To_Position (To_String (To)), Capture);
      Is_Occupied_By_Player : constant Boolean := (if not To_Square.Is_Empty then To_Square.Get_Contents.Colour = Player else False);
      Is_Blocked            : constant Boolean := Blocked.Contains (To_Position (To_String (To)));
      
    begin
      
      if not Is_Valid_Move then
        Ada.Text_IO.Put_Line ("Invalid - the selected piece can't move there.");
      elsif Is_Occupied_By_Player then
        Ada.Text_IO.Put_Line ("Invalid - the current player already occupies that square.");
      elsif Is_Blocked then
        Ada.Text_IO.Put_Line ("Invalid - the selected square is blocked by another piece.");
      end if;
      
      return Is_Valid_Move and not Is_Occupied_By_Player;
      
    end Is_Valid_To;
    
  begin
    
    Ada.Text_IO.Put_Line ("-----------" & NL & Player'Img & " move" & NL & "-----------");
    The_Move.By := Player;

    -- TODO:  Need to add some sort of method to cancel a move that's in progress.
    
    while not Valid_From loop
      
      Ada.Text_IO.Put ("From square: ");
      From := To_Unbounded_String (Ada.Text_IO.Get_Line);
      
      if From = "exit" then
        raise Common_Types.End_Game;
      end if;
      
      begin
        
        From_Square := Board.Get_Square (On_Board.all, To_Position (To_String (From)));
        The_Piece   := From_Square.Get_Contents;
        Valid_From  := Is_Valid_From;
        
      exception
          
        when Common_Types.Invalid_Square =>
          
          Ada.Text_IO.Put_Line ("Invalid square.");
          Valid_From := False;
          
      end;
      
      if Valid_From then
        The_Move.From := To_Position (To_String (From));
        Blocked       := The_Piece.Get_Blocked_Squares;
        Ada.Text_IO.Put_Line ("Valid Moves: " & Image (Piece.Get_Valid_Positions (The_Piece)));
      end if;
    
    end loop;
    
    while not Valid_To loop
      
      Ada.Text_IO.Put ("To square: ");
      To := To_Unbounded_String (Ada.Text_IO.Get_Line);
      
      if To = "exit" then
        raise End_Game;
      end if;
      
      begin
        
        To_Square := Board.Get_Square (On_Board.all, To_Position (To_String (To)));
        Capture   := not To_Square.Is_Empty and then To_Square.Get_Contents.Colour /= Player;
        Valid_To  := Is_Valid_To;
        
      exception
          
        when Invalid_Square =>
          
          Ada.Text_IO.Put_Line ("Invalid square.");
          Valid_To := False;
          
      end;
      
      if Valid_To then
        
        if Capture then
          Ada.Text_IO.Put_Line (Player'Img & " captures the " & To_Square.Get_Contents.Image & " on square " & To_String (To));
        end if;
        
        The_Move.To := To_Position (To_String (To));
          
      end if;
      
    end loop;
    
    Ada.Text_IO.Put_Line (Image (The_Move));
    
    return The_Move;
    
  end Get_Move;
  
  ------------------------------------------------------------------------------
  --
  procedure Perform_Move 
    (This     : in Object;
     On_Board : in Board.Object_Access) is
    
    From_Square : constant Square.Object_Access := Board.Get_Square (On_Board.all, This.From);
    To_Square   : constant Square.Object_Access := Board.Get_Square (On_Board.all, This.To);
    Move_Piece  : constant Piece.Object_Access  := From_Square.Get_Contents;
    
  begin
  
    To_Square.Set_Contents (Move_Piece);
    From_Square.Set_Empty;
    
    Move_Piece.Position := This.To;
    
    -- TODO: Promote a pawn if it reaches the final rank
    
  end Perform_Move;
  
  ------------------------------------------------------------------------------
  --
  function Image (This : in Object) return String is
    (This.By'Img & ": " & Image (This.From) & " => " & Image (This.To));

end Move;
