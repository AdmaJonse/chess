package Common_Types with Pure is
  
  End_Game       : Exception;
  Invalid_Square : Exception;

  -- The horizontal position on the board.
  subtype File is Character range 'A' .. 'H';
  
  function "-"
    (Left, Right : in Character)
     return Integer is (Character'Pos (Left) - Character'Pos (Right));
  
  function To_Num (Char : File) return Positive is 
    (case Char is 
       when 'A' => 1, 
       when 'B' => 2, 
       when 'C' => 3, 
       when 'D' => 4, 
       when 'E' => 5, 
       when 'F' => 6, 
       when 'G' => 7, 
       when 'H' => 8);
  
  -- The vertical position on the board.
  subtype Rank is Positive range 1 .. 8;
   
  type Colour is (White, Black);

end Common_Types;
