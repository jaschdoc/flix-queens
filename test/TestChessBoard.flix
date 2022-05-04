namespace TestChessBoard {

    use ChessBoard.{empty, put};

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
        let ChessBoard(r) = put(0, 0, board);
        r.positions == Map#{0 => 0}

    @test
    pub def put02(): Bool =
        let board = empty(8);
        let ChessBoard(r) = board |> put(0, 0) |> put(1, 1);
        r.positions == Map#{0 => 0}

    @test
    pub def put03(): Bool =
        let board = empty(8);
        let ChessBoard(r) = board |> put(0, 0) |> put(1, 2);
        r.positions == Map#{0 => 0, 1 => 2}

}