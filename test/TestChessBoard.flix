namespace TestChessBoard {

    use ChessBoard.{empty, put, isLegalPosition};

    /////////////////////////////////////////////////////////////////////////////
    // empty                                                                   //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def empty01(): Bool =
        let ChessBoard(r) = empty(8);
        r.positions == Map#{}


    /////////////////////////////////////////////////////////////////////////////
    // put                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def put01(): Bool =
        let board = empty(8);
        let ChessBoard(r) = board |> put((0, 0));
        r.positions == Map#{0 => 0}

    @test
    pub def put02(): Bool =
        let board = empty(8) |> put((0, 0));
        let ChessBoard(r) = if(isLegalPosition((1, 1), board)) put((1, 1), board) else board;
        r.positions == Map#{0 => 0}

    @test
    pub def put03(): Bool =
        let board = empty(8);
        let ChessBoard(r) = board |> put((0, 0)) |> put((1, 2));
        r.positions == Map#{0 => 0, 1 => 2}

    @test
    pub def put04(): Bool =
        let board = empty(8);
        let ChessBoard(r) = board |>
                            put((0, 5)) |>
                            put((1, 0)) |>
                            put((2, 4)) |>
                            put((3, 1)) |>
                            put((4, 7)) |>
                            put((5, 2)) |>
                            put((6, 6)) |>
                            put((7, 3));
        r.positions == Map#{0 => 5, 1 => 0, 2 => 4, 3 => 1, 4 => 7, 5 => 2, 6 => 6, 7 => 3}

    /////////////////////////////////////////////////////////////////////////////
    // toString                                                                //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def toString01(): Bool =
        let s = ChessBoard.toString(empty(4));
        s == String.replace(from = "\n", to = String.lineSeparator(), " _ _ _ _ \n|_|_|_|_|\n|_|_|_|_|\n|_|_|_|_|\n|_|_|_|_|")

    @test
    pub def toString02(): Bool =
        let s = ChessBoard.toString(empty(8));
        s == String.replace(from = "\n", to = String.lineSeparator(), " _ _ _ _ _ _ _ _ \n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|")

    @test
    pub def toString03(): Bool & Impure =
        let s = ChessBoard.toString(empty(8) |> put((0, 0)));
        println(s);
        s == String.replace(from = "\n", to = String.lineSeparator(), " _ _ _ _ _ _ _ _ \n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|_|\n|q|_|_|_|_|_|_|_|")

}