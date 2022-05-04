opaque type ChessBoard = {
    size :: Int32,
    positions :: Map[Int32, Int32]
}

namespace ChessBoard {

    pub def empty(n: Int32): ChessBoard =
        ChessBoard({size = n, positions = Map.empty()})

    pub def put(row: Int32, col: Int32, b: ChessBoard): ChessBoard =
        let ChessBoard(r) = b;
        if (isLegalPosition(row, col, b)) {
            ChessBoard({ size = r.size, positions = Map.insert(row, col, r.positions)})
        } else {
            b
        }

    def isLegalPosition(row: Int32, col: Int32, b: ChessBoard): Bool =
        let ChessBoard(r) = b;
        //let f = (acc k, v) -> (v != col and ((row - k) != (col - v)) and ((row - k) != (col + v)) and acc);
        let f = (k, v) -> {
            if (v == col)
                false // There is a queen below it
            else if (k < row)
                let d = row - k;
                (v != (col + d)) and (v != (col - d)) // There is a queen in the diagonal if true
            else 
                true // The position is legal for this (k, v) pair
        };
        Map.forall(f, r.positions)

}