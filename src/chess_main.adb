with Ada.Text_IO;
with Board;
with Common_Types;
with Game;
with Move;

procedure Chess_Main is
  
  use type Common_Types.Colour_Type;
  
begin
    
  Game.Initialize (Game_Board => Board.Make);
   
  while not Game.Is_Game_Over loop
    
    Game.Get_Board.Print;
    
    declare
      The_Move : constant Move.Object := Move.Get_Move (Game.Get_Turn);
    begin
      The_Move.Perform_Move;
    end;
    
    -- TODO: Track move history in a separate object   
    
    if Game.Is_Checkmate then
      Ada.Text_IO.Put_Line ("Checkmate!");
    elsif Game.Is_Draw then
      Ada.Text_IO.Put_Line ("Draw!");
    elsif Game.Is_Check then
      Ada.Text_IO.Put_Line ("Check!");
    end if;
    
    Game.Set_Turn 
      (if Game.Get_Turn = Common_Types.White then Common_Types.Black 
       else Common_Types.White);
    
    if Game.Is_Game_Over then
      Ada.Text_IO.Put_Line ("Game over.");
      exit;
    end if;
    
  end loop;
  
exception
    
  when Common_Types.End_Game =>
    
    Ada.Text_IO.Put_Line ("Ending game...");
    
end Chess_Main;
