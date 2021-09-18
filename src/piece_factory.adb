with Bishop;
with Common_Types;
with King;
with Knight;
with Pawn;
with Queen;
with Rook;

use Common_Types;

package body Piece_Factory is

  ------------------------------------------------------------------------------
  --
  function Construct
    (Piece_Char : in Character;
     Position   : in Position_Type)
     return Piece.Object_Access is

  begin

    case Piece_Char is

      when 'p' =>

        return Piece.Object_Access (Pawn.Make (Colour => Black, Position => Position));

      when 'P' =>

        return Piece.Object_Access (Pawn.Make (Colour => White, Position => Position));

      when 'b' =>

        return Piece.Object_Access (Bishop.Make (Colour => Black, Position => Position));

      when 'B' =>

        return Piece.Object_Access (Bishop.Make (Colour => White, Position => Position));

      when 'n' =>

        return Piece.Object_Access (Knight.Make (Colour => Black, Position => Position));

      when 'N' =>

        return Piece.Object_Access (Knight.Make (Colour => White, Position => Position));

      when 'r' =>

        return Piece.Object_Access (Rook.Make (Colour => Black, Position => Position));

      when 'R' =>

        return Piece.Object_Access (Rook.Make (Colour => White, Position => Position));

      when 'q' =>

        return Piece.Object_Access (Queen.Make (Colour => Black, Position => Position));

      when 'Q' =>

        return Piece.Object_Access (Queen.Make (Colour => White, Position => Position));

      when 'k' =>

        return Piece.Object_Access (King.Make (Colour => Black, Position => Position));

      when 'K' =>

        return Piece.Object_Access (King.Make (Colour => White, Position => Position));

      when others =>

        null;

    end case;

    return null;

  end Construct;

end Piece_Factory;
