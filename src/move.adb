with Ada.Characters.Latin_1;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Board;
with Common_Types;
with Gnat.OS_Lib;
with Piece;

use Ada.Strings.Unbounded;

package body Move is
  
  NL : constant Character := Ada.Characters.Latin_1.LF;

  ------------------------------------------------------------------------------
  --
  function Make return Object_Access is (new Object);
  
  ------------------------------------------------------------------------------
  --
  function Get_From 
    (This : in Object) 
     return Square.Object_Access is (This.From);
  
  ------------------------------------------------------------------------------
  --
  function Get_To 
    (This : in Object) 
     return Square.Object_Access is (This.To);

  ------------------------------------------------------------------------------
  --
  function Get_Move 
    (On_Board  : in Board.Object_Access;
     Player    : in Common_Types.Colour) 
     return Object is
    
    use type Common_Types.Colour;
    use type Piece.Object_Access;
    use type String;
    
    From           : Ada.Strings.Unbounded.Unbounded_String;
    To             : Ada.Strings.Unbounded.UNbounded_String;
    Valid_From     : Boolean := False;
    Valid_To       : Boolean := False;
    From_Square    : Square.Object_Access;
    To_Square      : Square.Object_Access;
    The_Move       : Object;
    
    ----------------------------------------------------------------------------
    --
    function Is_Valid_From return Boolean is
      
      Is_Empty          : constant Boolean := From_Square.Is_Empty;
      Is_Correct_Colour : constant Boolean := not Is_Empty and then From_Square.Get_Contents.Get_Colour = Player;
      
    begin
      
      if Is_Empty then
        Ada.Text_IO.Put_Line ("Invalid - the selected square is empty.");
      elsif not Is_Correct_Colour then
        Ada.Text_IO.Put_Line ("Invalid - the selected piece is the wrong colour.");
      end if;
      
      return not Is_Empty and Is_Correct_Colour;
      
    end Is_Valid_From;
    
    ----------------------------------------------------------------------------
    --
    function Is_Valid_To return Boolean is
      
      Is_Valid_Move         : constant Boolean := From_Square.Get_Contents.Is_Valid_Move (From_Square.Get_File, From_Square.Get_Rank, To_Square.Get_File, To_Square.Get_Rank);
      Is_Occupied_By_Player : constant Boolean := (if not To_Square.Is_Empty then To_Square.Get_Contents.Get_Colour = Player else False);
      
    begin
      
      if not Is_Valid_Move then
        Ada.Text_IO.Put_Line ("Invalid - the selected piece can't move there.");
      elsif Is_Occupied_By_Player then
        Ada.Text_IO.Put_Line ("Invalid - the current player already occupies that square.");
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
        
        From_Square := Board.Get_Square (On_Board, To_String (From));
        Valid_From  := Is_Valid_From;
        
      exception
          
        when Common_Types.Invalid_Square =>
          
          Ada.Text_IO.Put_Line ("Invalid square.");
          Valid_From := False;
          
      end;
      
      if Valid_From then
        The_Move.From := From_Square;
      end if;
    
    end loop;
    
    while not Valid_To loop
      
      Ada.Text_IO.Put ("To square: ");
      To := To_Unbounded_String (Ada.Text_IO.Get_Line);
      
      if To = "exit" then
        raise Common_Types.End_Game;
      end if;
      
      begin
        
        To_Square  := Board.Get_Square (On_Board, To_String (To));
        Valid_To   := Is_Valid_To;
        
      exception
          
        when Common_Types.Invalid_Square =>
          
          Ada.Text_IO.Put_Line ("Invalid square.");
          Valid_To := False;
          
      end;
      
      if Valid_To then
        
        -- Capture
        if not To_Square.Is_Empty and then To_Square.Get_Contents.Get_Colour /= Player then
          Ada.Text_IO.Put_Line (Player'Img & " captures the " & To_Square.Get_Contents.Image & " on square " & Square.Image (To_Square));
          -- TODO: Finalize the captured piece?
        end if;
        
        The_Move.To := To_Square;
          
      end if;
      
    end loop;
    
    The_Move.Print;
    
    return The_Move;
    
  end Get_Move;
  
  ------------------------------------------------------------------------------
  --
  procedure Perform_Move 
    (This     : in Object;
     On_Board : in Board.Object_Access) is
    
    From : Square.Object_Access := This.Get_From;
    To   : Square.Object_Access := This.Get_To;
    
  begin
  
    Board.Get_Square (On_Board, To.Get_File, To.Get_Rank).Set_Contents (Board.Get_Square (On_Board, From.Get_File, From.Get_Rank).Get_Contents);
    Board.Get_Square (On_Board, From.Get_File, From.Get_Rank).Set_Empty;
    
  end Perform_Move;
  
  ------------------------------------------------------------------------------
  --
  procedure Print (This : in Object) is
  begin
    
    Ada.Text_IO.Put_Line (This.By'Img & ": " & Square.Image (This.From) & " => " & Square.Image (This.To));
    
  end Print;

end Move;
