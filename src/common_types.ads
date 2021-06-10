package Common_Types with Pure is
  
  End_Game       : Exception;
  Invalid_Square : Exception;

  
  -- The horizontal position on the board.
  subtype File_Type is Character range 'A' .. 'H';
  
  
  --  Subtraction operator for a Character type.
  --  
  --  @param Left   the LHS Character
  --  @param Right  the RHS Character
  --
  --  @return  the difference between these characters as an integer.
  --
  function "-"
    (Left, Right : in Character)
     return Integer is (Character'Pos (Left) - Character'Pos (Right));
  
  
  --  Return a numeric representation of the given File.
  --
  --  @param Char  the file to get the numeric representation of.
  --
  --  @return  the numeric representation of the given file.
  --
  function To_Num 
    (Char : File_Type) 
     return Positive is 
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
  subtype Rank_Type is Positive range 1 .. 8;
  
  type Position_Type is record
    File : File_Type;
    Rank : Rank_Type;
  end record;
  
  -- The possible piece colours
  type Colour is (White, Black);

  
end Common_Types;
