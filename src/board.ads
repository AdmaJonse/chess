with Common_Types;
with Bishop;
with Common_Types;
with King;
with Knight;
with Queen;
with Pawn;
with Piece;
with Piece_Factory;
with Rook;
with Square;

use Common_Types;

pragma Elaborate (Square);

--  @summary
--  The chess board
--
--  @description
--  The chess board object provides a representation of the current game board.
--
package Board is

  --  The Board object.
  --
  type Object is tagged private;
   
   
  --  Access the Board object.
  --
  type Object_Access is access all Object'Class;
   
   
  --  Create a new Board object.
  --
  --  @param Squares  the square array used for the initial board position.
  --  
  --  @return  The new Board object.
  --  
  function Make 
    (Squares : in Square.Square_Array := Square.Empty_Squares) 
     return Object_Access;
  
  
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
  function To_Board
    (Board_String : in String)
     return Object;

  
private
   
  type Object is tagged record
    Squares : Square.Square_Array;
  end record;
  
  Starting_Squares : constant Square.Square_Array :=
    ('A' => (Square.Make (new Rook.Object'(White, ('A', 1))),
             Square.Make (new Pawn.Object'(White, ('A', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('A', 7))),
             Square.Make (new Rook.Object'(Black, ('A', 8)))),
     'B' => (Square.Make (new Knight.Object'(White, ('B', 1))),
             Square.Make (new Pawn.Object'(White, ('B', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('B', 7))),
             Square.Make (new Knight.Object'(Black, ('B', 8)))),
     'C' => (Square.Make (new Bishop.Object'(White, ('C', 1))),
             Square.Make (new Pawn.Object'(White, ('C', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('C', 7))),
             Square.Make (new Bishop.Object'(Black, ('C', 8)))),
     'D' => (Square.Make (new Queen.Object'(White, ('D', 1))),
             Square.Make (new Pawn.Object'(White, ('D', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('D', 7))),
             Square.Make (new Queen.Object'(Black, ('D', 8)))),
     'E' => (Square.Make (new King.Object'(White, ('E', 1))),
             Square.Make (new Pawn.Object'(White, ('E', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('E', 7))),
             Square.Make (new King.Object'(Black, ('E', 8)))),
     'F' => (Square.Make (new Bishop.Object'(White, ('F', 1))),
             Square.Make (new Pawn.Object'(White, ('F', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('F', 7))),
             Square.Make (new Bishop.Object'(Black, ('F', 8)))),
     'G' => (Square.Make (new Knight.Object'(White, ('G', 1))),
             Square.Make (new Pawn.Object'(White, ('G', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('G', 7))),
             Square.Make (new Knight.Object'(Black, ('G', 8)))),
     'H' => (Square.Make (new Rook.Object'(White, ('H', 1))),
             Square.Make (new Pawn.Object'(White, ('H', 2))),
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make (new Pawn.Object'(Black, ('H', 7))),
             Square.Make (new Rook.Object'(Black, ('H', 8)))));

  Empty_Squares    : constant Square.Square_Array :=
    ('A' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'B' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'C' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'D' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'E' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'F' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'G' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make),
     'H' => (Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make,
             Square.Make));
  
  Starting_Board   : constant Object := (Squares => Starting_Squares);
  Empty_Board      : constant Object := (Squares => Empty_Squares);

end Board;
