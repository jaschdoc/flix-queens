namespace TestQueens {

    use Queens.allLegalBoards;

    /////////////////////////////////////////////////////////////////////////////
    // allLegalBoards                                                          //
    /////////////////////////////////////////////////////////////////////////////

    @test
    pub def allLegalBoards01(): Bool & Impure =
        allLegalBoards(4) |> List.length == 2

    @test
    pub def allLegalBoards02(): Bool & Impure =
        allLegalBoards(5) |> List.length == 10

}