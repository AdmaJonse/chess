package body Pawn is

  ------------------------------------------------------------------------------
  --
  function Make
    (Colour : in Common_Types.Colour)
     return Object_Access is

  begin

    return new Object'(Colour => Colour);

  end Make;

  ------------------------------------------------------------------------------
  --
  function Image
    (This : in Object)
     return Character is

    use type Common_Types.Colour;

  begin

    return (if This.Get_Colour = Common_Types.White then 'P' else 'p');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This : in Object;
     From : in Common_Types.Position_Type;
     To   : in Common_Types.Position_Type)
     return Boolean is

    use Common_Types;

    use type Common_Types.File_Type;
    use type Common_Types.Rank_Type;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if From.File = To.File and From.Rank = To.Rank then
      return False;
    end if;

    -- TODO: Special case: first move can move up to two ranks
    -- TODO: Special case: capture diagonally
    -- TODO: Special case: en passant
    -- TODO: Black ranks should be minus 1, white ranks should be plus 1

    -- TODO: For now, just treat special cases as always valid
    Valid := (To.File = From.File or To.File - From.File = 1 or To.File - From.File = -1) and
             (To.Rank = From.Rank + 1 or To.Rank = From.Rank - 1);

    return Valid;

  end Is_Valid_Move;

end Pawn;
