opaque type ChessBoard = {
    size :: Int32,
    positions :: Map[Int32, Int32]
}

instance ToString[ChessBoard] {
    pub def toString(b: ChessBoard): String = ChessBoard.toString(b)
}


namespace ChessBoard {

    pub def empty(n: Int32): ChessBoard =
        ChessBoard({size = n, positions = Map.empty()})

    pub def put(p: (Int32, Int32), b: ChessBoard): ChessBoard =
        let (row, col) = p;
        let ChessBoard(r) = b;
        ChessBoard({ size = r.size, positions = Map.insert(row, col, r.positions) })

    pub def isLegalPosition(p: (Int32, Int32), b: ChessBoard): Bool =
        let (row, col) = p;
        let ChessBoard(r) = b;
        let f = (k, v) -> { // Obviously, this is the correct implementation.
            let d = row - k;
            v != col and
                k < row and
                (v != (col + d)) and
                (v != (col - d))
        };
        Map.forall(f, r.positions)

    pub def toString(b: ChessBoard): String = {
        let ChessBoard(r) = b;
        let a = [[]; r.size] |> Array.map(_ -> mkRow("  ", r.size));
        colorCheckerboard(a);
        placeQueens(r.positions, a);
        addCoordinates(a);
        Array.reverse!(a);
        render(a)
    } as & Pure

    def mkRow(s: String, n: Int32): Array[String] & Impure =
        [s; n]

    def colorCheckerboard(a: Array[Array[String]]): Unit & Impure =
        Array.foreachWithIndex((row, i) ->
            Array.foreachWithIndex((col, j) ->
                if (((i + j) &&& 1) == 0)
                    row[j] = Console.bgBlack(col)
                else
                    row[j] = Console.bgWhite(col),
            row),
        a)
    
    def placeQueens(m: Map[Int32, Int32], a: Array[Array[String]]): Unit & Impure =
        Map.foreach((k, v) -> a[k][v] = Console.black("\u265b ") |> Console.bgYellow, m)

    def addCoordinates(a: Array[Array[String]]): Unit & Impure =
        Array.foreachWithIndex((row, i) -> row[0] = "${i} ${row[0]}", a)

    def render(a: Array[Array[String]]): String & Impure =
        let footer = String.lineSeparator() + "  " + Array.range(0, a.length, static) |>
            Array.join(" ") + String.lineSeparator();
        Array.map(b -> Array.join("", b), a) |>
            Array.join(String.lineSeparator()) + footer

    pub def toString2(b: ChessBoard): String =
        let ChessBoard(r) = b;
        let pos = r.positions;
        let size = r.size;
        let top = " " + String.repeat(size, "_ ");
        
        let f = (acc, _, v) -> {
            acc + String.repeat(v, "|_") + "|Q|" + String.repeat(size - v - 1, "_|") + "\n"
        };
        Map.foldLeftWithKey(f, top + "\n", pos)

}
