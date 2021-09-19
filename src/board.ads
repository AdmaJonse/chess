with Common_Types;
with Piece;
with Square;

pragma Elaborate (Square);

--  @summary
--  The chess board
--
--  @description
--  The chess board object provides a representation of the current game board.
--
package Board is
  
  
  type Square_Array is array (Common_Types.File_Type, Common_Types.Rank_Type) of Square.Object_Access;

  --  The Board object.
  --
  type Object is tagged private;
   
   
  --  Access the Board object.
  --
  type Object_Access is access all Object'Class;
   
   
  --  Create a new Board object.
  --
  --  @return  The new Board object.
  --  
  function Make return Object_Access;
  
  
  --  Return a string represntation of this board object.
  --
  --  @param This  the board object
  --
  --  @return  a string representing the board.
  --
  function Image 
    (This : in Object) 
     return String;
  
  
  --  Return the square from this board that corresponds to the given rank
  --  and file.
  --
  --  @param This      the board object
  --  @param Position  the rank and file of the square to return
  --
  --  @return  the square from the board corresponding to the rank and file.
  --
  function Get_Square 
    (This     : in Object;
     Position : in Common_Types.Position_Type) 
     return Square.Object_Access;
  
  
  --  Return a vector containing all pieces of the given colour on the board.
  --
  --  @param This    the board object
  --  @param Colour  the piece colour to return
  --
  --  @return  the vector of pieces of the given colour
  --
  function Get_Pieces 
    (This   : in Object;
     Colour : in Common_Types.Colour_Type) 
     return Piece.Piece_Vector.Vector; 
  
  
  --  Return the king for the given colour.
  --
  --  @param This    the board object
  --  @param Colour  the piece colour to return
  --
  --  @return  the king of the given colour
  --
  function Get_King 
    (This   : in Object;
     Colour : in Common_Types.Colour_Type) 
     return Piece.Object_Access; 
  
  
  --  Return the vector of pieces of the given colour that are checking the 
  --  opponent's king.
  --
  --  @param This    the board object
  --  @param Colour  the colour of the checking pieces
  --
  --  @return  the vector of checking pieces of the given colour
  --
  function Get_Checking_Pieces
    (This   : in Object;
     Colour : in Common_Types.Colour_Type)
     return Piece.Piece_Vector.Vector;
  
  
  --  Print this board object to the console.
  --
  --  @param This  the board object
  --
  procedure Print (This : in Object'Class);
  
  
  --  Generate a Board object from the given string representation of the game
  --  board.
  --
  --  @param Board_String  the string representation of the game board.
  --
  --  @return  the board object created from the given string.
  --
  function String_To_Board
    (Board_String : in String)
     return Object;

  
private
   
  type Object is tagged record
    Squares : Square_Array;
  end record;

end Board;
