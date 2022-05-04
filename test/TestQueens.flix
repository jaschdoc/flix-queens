namespace TestQueens {

    use Queens.{allLegalBoards, allLegalBoards2};

    /////////////////////////////////////////////////////////////////////////////
    // allLegalBoards                                                          //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def allLegalBoards01(): Bool & Impure =
        allLegalBoards(4) |> List.length == 2

    @test
    pub def allLegalBoards02(): Bool & Impure =
        allLegalBoards(5) |> List.length == 10

    @test
    pub def allLegalBoards03(): Bool & Impure =
        allLegalBoards(8) |> List.length == 92

    /////////////////////////////////////////////////////////////////////////////
    // allLegalBoards2                                                          //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def allLegalBoards201(): Bool =
        allLegalBoards2(4) |> List.length == 2

    @test
    pub def allLegalBoards202(): Bool =
        allLegalBoards2(5) |> List.length == 10

    @test
    pub def allLegalBoards203(): Bool =
        allLegalBoards2(8) |> List.length == 92

}