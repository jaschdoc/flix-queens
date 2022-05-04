namespace TestChessBoard {

    use ChessBoard.{empty, put};

    /////////////////////////////////////////////////////////////////////////////
    // put                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def put01(): Bool =
        let board = empty(8);
        let ChessBoard(r) = put(2, 2, put(0, 0, board));
        r.positions == Map#{0 => 0, 2 => 2}

}