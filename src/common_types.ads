with Ada.Characters.Latin_1;
with Ada.Containers.Vectors;
with Ada.Strings.Fixed;

package Common_Types is
  
  End_Game        : Exception;
  Invalid_Square  : Exception;
  Path_Not_Found  : Exception;
  Piece_Not_Found : Exception;
  
  NL : constant Character := Ada.Characters.Latin_1.LF;
  
  -- The horizontal position on the board.
  subtype File_Type is Character range 'A' .. 'H';
  
  
  --  Subtraction operator for a Character type.
  --  
  --  @param Left   the LHS Character
  --  @param Right  the RHS Character
  --
  --  @return  the difference between these characters as an integer.
  --
  function "+"
    (Left  : in Character;
     Right : in Integer)
     return Character is (Character'Val (Character'Pos (Left) + Right));
  
  
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
  
  
  --  Subtraction operator for a Character type.
  --  
  --  @param Left   the LHS Character
  --  @param Right  an integer to subtract
  --
  --  @return  the resulting character 
  --
  function "-"
    (Left  : in Character;
     Right : in Integer)
     return Character is (Character'Val (Character'Pos (Left) - Right));
  
  
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
  
  
  function "=" 
    (Left, Right : in Position_Type)
     return Boolean is 
    (Left.Rank = Right.Rank and Left.File = Right.File);
  
  
  package Position_Vector is new Ada.Containers.Vectors
    (Index_Type   => Positive,
     Element_Type => Position_Type,
     "="          => "=");
  
  function Image (This : in Position_Vector.Vector) return String;
  
  function Is_Match
    (Left, Right : in Position_Vector.Vector)
     return Boolean;
  
  --  Return a string representation of the position.
  --
  --  @param Position  the position to get the string of.
  --
  --  @return  the string representing the position.
  --
  function Image 
    (Position : in Position_Type) 
     return String is 
    (Position.File & Ada.Strings.Fixed.Trim (Position.Rank'Img, Ada.Strings.Left));
  
  
  --  Return the position record represented by the given string.
  --
  function To_Position 
    (Position : in String) 
     return Common_Types.Position_Type;
  
  
  -- The possible piece colours
  type Colour_Type is (White, Black);

  
end Common_Types;
