[
  {
    Ast.name = "main";
    param = [ ("x", Ast.TInt); ("f", Ast.TInt) ];
    body =
      Ast.Seq
        [
          Ast.Let
            ( "f",
              Ast.TBool,
              Ast.Seq
                [
                  Ast.Let ("x", Ast.TBool, Ast.Bool true);
                  Ast.Binary
                    ( Ast.Or,
                      Ast.Id "x",
                      Ast.Binary (Ast.Eq, Ast.Id "f", Ast.Int 23) );
                ] );
          Ast.Ite
            ( Ast.Id "f",
              Ast.Seq [ Ast.Id "x" ],
              Ast.Seq [ Ast.Binary (Ast.Add, Ast.Id "x", Ast.Int 2) ] );
        ];
    return = Ast.TInt;
  };
  {
    Ast.name = "main";
    param = [];
    body =
      Ast.Seq
        [
          Ast.Let ("t", Ast.TInt, Ast.Int 3);
          Ast.Ite
            ( Ast.Binary
                ( Ast.Eq,
                  Ast.Id "t",
                  Ast.Call
                    ( "main",
                      [ Ast.Call ("main", [ Ast.Int 2; Ast.Int 3 ]); Ast.Int 9 ]
                    ) ),
              Ast.Seq [ Ast.PrintInt (Ast.Id "t") ],
              Ast.Seq [ Ast.PrintInt (Ast.Int 90) ] );
        ];
    return = Ast.TUnit;
  };
]
