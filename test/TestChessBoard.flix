namespace TestChessBoard {

    use ChessBoard.{empty, put};

    /////////////////////////////////////////////////////////////////////////////
    // put                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def put01(): Bool =
        let board = empty(8);
        let ChessBoard(r) = put(0, 0, board) |> put(1, 2);
        r.positions == Map#{0 => 0, 1 => 2}

}