opaque type ChessBoard = {
    size :: Int32,
    positions :: Map[Int32, Int32]
}

namespace ChessBoard {

    pub def empty(n: Int32): ChessBoard =
        ChessBoard({size = n, positions = Map.empty()})

    pub def put(row: Int32, col: Int32, b: ChessBoard): ChessBoard =
        let ChessBoard(r) = b;
        ChessBoard({ size = r.size, positions = Map.insert(row, col, r.positions)})


}