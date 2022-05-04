opaque type ChessBoard = {
    size :: Int32,
    positions :: Map[Int32, Int32]
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
        let s = Array.map(row -> Array.intersperse("|", row), [["_"; r.size]; r.size]); // Add grid
        Map.foreach((k, v) -> s[k][v] = "q", r.positions);
        Array.foreach(row -> { row[0] = "|" + row[0]; row[row.length - 1] = row[row.length - 1] + "|" }, s); // Add borders
        Array.reverse!(s);
        let header = String.repeat(r.size, " _") + " " + String.lineSeparator();
        header + Array.map(a -> Array.join("", a), s) |> Array.join(String.lineSeparator())
    } as & Pure

}
