with Ada.Characters.Latin_1;
with Ada.Containers.Vectors;
with Ada.Strings.Fixed;

--  @summary  
--  Common types used through the Chess application.
--
--  @description
--  This package defines types that will be used throughout the Chess application.
--  The intent is to minimize package dependencies in order to reduce the 
--  likelihood of circular dependencies.
--
package Common_Types is
  
  
  End_Game        : Exception;
  Invalid_Square  : Exception;
  Path_Not_Found  : Exception;
  Piece_Not_Found : Exception;
  
  
  --  The newline character
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
  
   
  --  A position identifies a square on the chess board. A chess position 
  --  consists of a rank and file. The rank indicates the vertical position, 
  --  ranging from 1 to 8, and the file indicates the horizontal position, 
  --  ranging from A to H.
  --
  type Position_Type is record
    File : File_Type;
    Rank : Rank_Type;
  end record;
  
  
  --  Equality operator for the position type.
  --
  --  @param Left   the first position type to be compared.
  --  @param Right  the second position type to be compared.
  --
  --  @return  boolean indicating whether or not the two positions are the same.
  --
  function "=" 
    (Left, Right : in Position_Type)
     return Boolean is 
    (Left.Rank = Right.Rank and Left.File = Right.File);
  
  
  --  A vector of positions.
  --
  package Position_Vector is new Ada.Containers.Vectors
    (Index_Type   => Positive,
     Element_Type => Position_Type,
     "="          => "=");
  
  
  --  Return a string representation of the given position vector.
  --
  --  @param This  the position vector
  --  
  --  @return  the string representation of the position vector.
  --
  function Image 
    (This : in Position_Vector.Vector) 
     return String;
  
  
  --  Compare two vectors and determine if the contents are the same. Position 
  --  order is not considered when determining match.
  --
  --  @param Left   the first position vector to be compared.
  --  @param Right  the second position vector to be compared.
  --
  --  @return  a boolean indicating whether contents of the two position vectors
  --           are the same.
  --
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
  --  @param  Position  a string representing the position.
  --
  --  @return  the position type defined by the given string.
  --
  function To_Position 
    (Position : in String) 
     return Common_Types.Position_Type;
  
  
  -- The possible piece colours
  type Colour_Type is (White, Black);

  
end Common_Types;
