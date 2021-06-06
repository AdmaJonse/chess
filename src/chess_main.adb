with Ada.Text_IO;
with Board;
with Common_Types;
with Game;
with Move;

procedure Chess_Main is
   
  Chess_Game  : constant Game.Object_Access := Game.Make;
  Chess_Board : Board.Object_Access := Board.Make;
   
begin
   
  while not Chess_Game.Is_Game_Over loop
    
    Chess_Board.Print;
    
    -- TODO: Track move history in a separate object
      
    declare
      White_Move : Move.Object := Move.Get_Move (Chess_Board, Common_Types.White);
    begin
      White_Move.Perform_Move (Chess_Board);
    end;
    
    Chess_Board.Print;
    
    declare
      Black_Move : Move.Object := Move.Get_Move (Chess_Board, Common_Types.Black);
    begin
      Black_Move.Perform_Move (Chess_Board);
    end;
    
  end loop;
  
exception
    
  when Common_Types.End_Game =>
    
    Ada.Text_IO.Put_Line ("Ending game...");
    
end Chess_Main;
