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

}