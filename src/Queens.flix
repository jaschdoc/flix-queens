namespace Queens {

    pub def allLegalBoards(size: Int32): List[ChessBoard] & Impure =
        let res = new MutList(static);
        def loop(i, j, b, k) = {  
            if (i >= size)  {
                MutList.push!(b, res);
                k()
            }
            else if (j >= size)
                k()
            else if (ChessBoard.isLegalPosition((i, j), b))
                loop(i + 1, 0, ChessBoard.put((i, j), b), () -> loop(i, j + 1, b, k))
            else
                loop(i, j + 1, b, k)
        };
        loop(0, 0, ChessBoard.empty(size), ks -> ks as & Impure);
        MutList.toList(res)

    pub def allLegalBoards2(size: Int32): List[ChessBoard] =
        def loop(i, j, b) = {
            if (i >= size)
                b :: Nil 
            else if (j >= size)
                Nil
            else if (ChessBoard.isLegalPosition((i, j), b)) {
                loop(i + 1, 0, ChessBoard.put((i, j), b)) ::: loop(i, j + 1, b)
            } else
                loop(i, j + 1, b)
        };
        loop(0, 0, ChessBoard.empty(size))

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

    pub def printSolutions(boards: List[ChessBoard]): Unit & Impure =
        def loop(ks) = match ks {
            case x :: xs => println(ChessBoard.toString(x)); loop(xs)
            case Nil     => println("")
        };
        loop(boards)

}