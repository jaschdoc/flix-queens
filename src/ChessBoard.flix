opaque type ChessBoard = {
    size :: Int32,
    positions :: Map[Int32, Int32]
}

namespace ChessBoard {

    pub def empty(n: Int32): ChessBoard =
        ChessBoard({size = n, positions = Map.empty()})

    pub def put(row: Int32, col: Int32, b: ChessBoard): ChessBoard =
        let ChessBoard(r) = b;
        if (isLegalPosition(row, col, b))
            ChessBoard({ size = r.size, positions = Map.insert(row, col, r.positions) })
        else
            b

    def isLegalPosition(row: Int32, col: Int32, b: ChessBoard): Bool =
        let ChessBoard(r) = b;
        let f = (k, v) -> { // Obviously this is the correct implementation.
            let d = row - k;
            v != col and
                k < row and
                (v != (col + d)) and
                (v != (col - d))
        };
        Map.forall(f, r.positions)

}