namespace Queens {

    pub def allLegalBoards(size: Int32): List[ChessBoard] & Impure =
        let res = new MutList(static);
        def loop(i, j, b) = {  
            if (i >= size)
                MutList.push!(b, res)
            else if (j >= size)
                ()
            else if (ChessBoard.isLegalPosition((i, j), b)) {
                loop(i + 1, 0, ChessBoard.put((i, j), b));
                loop(i, j + 1, b)
            } else
                loop(i, j + 1, b)
        };
        loop(0, 0, ChessBoard.empty(size));
        MutList.toList(res)

    pub def numberOfLegalBoards(size: Int32): Int32 & Impure =
        def loop(i, j, b) = {  
            if (i >= size)
                1
            else if (j >= size)
                0
            else if (ChessBoard.isLegalPosition((i, j), b)) {
                loop(i + 1, 0, ChessBoard.put((i, j), b)) + loop(i, j + 1, b)
            } else
                loop(i, j + 1, b)
        };
        loop(0, 0, ChessBoard.empty(size))

}