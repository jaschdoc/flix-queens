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
        def header() = {
            let builder = StringBuilder.new();
            StringBuilder.appendLine!(List.repeat(r.size + 1, " ") |> List.join("_"), builder);
            StringBuilder.toString(builder)
        };
        let sb = StringBuilder.new();
        let f = () -> StringBuilder.appendLine!(List.repeat(r.size + 1, "|") |> List.join("_"), sb);
        List.range(0, r.size) |> List.foreach(_ -> f());
        let s = StringBuilder.toString(sb) |> String.dropRight(1);
        let l = String.split(regex = String.lineSeparator(), s) |> List.reverse;
        let sb1 = StringBuilder.new();
        Map.toList(r.positions) |>
            List.sortBy(match (x, _) -> x) |>
            List.foreach(match (row, col) -> {
                match List.drop(row, l) {
                    case x :: _ =>
                        let y = String.dropLeft(2 * col, x);
                        let ypref = String.dropRight(String.length(x) - 2 * col - 1, x);
                        StringBuilder.appendString!(ypref + "q" + y, sb1)
                    case Nil => bug!("Empty list")
                }
            });
        let res = StringBuilder.toString(sb1) |> String.toList |> List.reverse;
        header() + List.join("", res)
    } as & Pure

}
