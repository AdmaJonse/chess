package body Knight is

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

    return (if This.Get_Colour = Common_Types.White then 'N' else 'n');

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

    Valid := (abs(From_Rank - To_Rank) = 2 and abs(From_File - To_File) = 1) or
             (abs(From_Rank - To_Rank) = 1 and abs(From_File - To_File) = 2);

    return Valid;

  end Is_Valid_Move;

end Knight;
