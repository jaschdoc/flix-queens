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
        let s = [[" "; r.size]; r.size]; // Array.map(row -> Array.intersperse("|", row), [[" "; r.size]; r.size]); // Add grid
        Array.foreachWithIndex((row, i) ->
            Array.foreachWithIndex((col, j) ->
                if (((i + j) &&& 1) == 0)
                    row[j] = Console.bgBlack(col)
                else
                    row[j] = Console.bgWhite(col),
            row),
        s); //
        // Map.foreach((k, v) -> s[k][v] = "q", r.positions);
        // Array.foreachWithIndex((row, i) -> { row[0] = "${i} " + row[0]; row[row.length - 1] = row[row.length - 1] + "|" }, s); // Add borders
        //Array.reverse!(s);
        let header = ""; //String.repeat(r.size, " _") + " " + String.lineSeparator();
        let footer = ""; //String.lineSeparator() + "  " + Array.range(0, r.size, static) |> Array.join(" ");
        header + Array.map(a -> Array.join("|", a), s) |>
            Array.join(String.lineSeparator()) |>
            String.replace(from = "q", to = Console.green("♛")) +
            footer
    } as & Pure

}
