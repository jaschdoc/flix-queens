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

    @Parallel
    pub def parAllLegalBoards(size: Int32): List[ChessBoard] = {
        def seqLoop(i, j, b, k) = {
            if (i >= size)
                k(b :: Nil)
            else if (j >= size)
                k(Nil)
            else if (ChessBoard.isLegalPosition((i, j), b))
                seqLoop(i + 1, 0, ChessBoard.put((i, j), b),
                    xs -> seqLoop(i, j + 1, b, ys -> xs ::: ys)) // Should be ls -> k(ks ::: ls)
            else
                seqLoop(i, j + 1, b, k)
        };
        def loop(i, j, b, n, cs) = {
            if (i >= size)
                b :: List.flatMap(c -> <- c, cs)
            else if (j >= size)
                List.flatMap(c -> <- c, cs)
            else if (ChessBoard.isLegalPosition((i, j), b))
                if (n <= 1)
                    seqLoop(i + 1, 0, ChessBoard.put((i, j), b),
                        ks -> seqLoop(i, j + 1, b, ls -> ks ::: ls))
                else {
                    let c = chan List[ChessBoard] 1;
                    spawn (c <- loop(i, j + 1, b, (n - 2) / 2, Nil));
                    loop(i + 1, 0, ChessBoard.put((i, j), b), (n - 2) / 2, c :: cs)
                }
            else
                loop(i, j + 1, b, n, cs)
        };
        loop(0, 0, ChessBoard.empty(size), Environment.getVirtualProcessors() * 4 - 1, Nil)
    } as & Pure

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