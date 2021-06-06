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
    (This      : in Object;
     From_File : in Common_Types.File;
     From_Rank : in Common_Types.Rank;
     To_File   : in Common_Types.File;
     To_Rank   : in Common_Types.Rank)
     return Boolean is

    use type Common_Types.File;
    use type Common_Types.Rank;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if From_File = To_File and From_Rank = To_Rank then
      return False;
    end if;

    -- Any square on the current rank or file
    Valid := (From_File = To_File and From_Rank /= To_Rank) or
             (From_File /= To_File and From_Rank = To_Rank);

    return Valid;

  end Is_Valid_Move;

end Rook;
