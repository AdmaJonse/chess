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
    (This      : in Object;
     From_File : in Common_Types.File;
     From_Rank : in Common_Types.Rank;
     To_File   : in Common_Types.File;
     To_Rank   : in Common_Types.Rank)
     return Boolean is

    use Common_Types;

    use type Common_Types.File;
    use type Common_Types.Rank;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if From_File = To_File and From_Rank = To_Rank then
      return False;
    end if;

    -- TODO: Special case: first move can move up to two ranks
    -- TODO: Special case: capture diagonally
    -- TODO: Special case: en passant
    -- TODO: Black ranks should be minus 1, white ranks should be plus 1

    -- TODO: For now, just treat special cases as always valid
    Valid := (To_File = From_File or To_File - From_File = 1 or To_File - From_File = -1) and
             (To_Rank = From_Rank + 1 or To_Rank = From_Rank - 1);

    return Valid;

  end Is_Valid_Move;

end Pawn;
