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
        def renderBoard() = {
            let sb = StringBuilder.new();
            StringBuilder.appendLine!(List.repeat(r.size + 1, " ") |> List.join("_"), sb);
            let f = () -> StringBuilder.appendLine!(List.repeat(r.size + 1, "|") |> List.join("_"), sb);
            List.range(0, r.size) |> List.foreach(_ -> f());
            StringBuilder.toString(sb) |> String.dropRight(1)
        };
        def _placeQueens(s) = {
            let _ss = String.split(regex = String.lineSeparator(), s);
            ()
        };

        renderBoard()
    } as & Pure

}
