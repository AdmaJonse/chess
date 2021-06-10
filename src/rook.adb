package body Rook is

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

    return (if This.Get_Colour = Common_Types.White then 'R' else 'r');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This : in Object;
     From : in Common_Types.Position_Type;
     To   : in Common_Types.Position_Type)
     return Boolean is

    use type Common_Types.File_Type;
    use type Common_Types.Rank_Type;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if From.File = To.File and From.Rank = To.Rank then
      return False;
    end if;

    -- Any square on the current rank or file
    Valid := (From.File = To.File and From.Rank /= To.Rank) or
             (From.File /= To.File and From.Rank = To.Rank);

    return Valid;

  end Is_Valid_Move;

end Rook;
