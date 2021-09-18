with Common_Types;
with Piece;

package Piece_Factory is

  function Construct
    (Piece_Char : in Character;
     Position   : in Common_Types.Position_Type)
     return Piece.Object_Access;

end Piece_Factory;
