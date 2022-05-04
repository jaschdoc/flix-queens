opaque type ChessBoard = {
    size :: Int32,
    positions :: Map[Int32, Int32]
}

namespace ChessBoard {

    pub def empty(n: Int32): ChessBoard =
        ChessBoard({size = n, positions = Map.empty()})

    pub def put(row: Int32, col: Int32, b: ChessBoard): ChessBoard =
        let ChessBoard(r) = b;
        if (legalPosition(row, col, b)) {
            ChessBoard({ size = r.size, positions = Map.insert(row, col, r.positions)})
        } else {
            b
        }

    def legalPosition(row: Int32, col: Int32, b: ChessBoard): Bool =
        let ChessBoard(r) = b;
        let f = (acc, k, v) -> (v != col and ((row - k) != (col - v)) and ((row - k) != (col + v)) and acc);
        Map.foldLeftWithKey(f, true, r.positions)

}