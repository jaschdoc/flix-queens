// The main entry point.
def main(): Unit & Impure =
    println(ChessBoard.empty(8) |> ChessBoard.put((1, 1)));
    println(List.length(Queens.allLegalBoards(5)));
    println(Queens.numberOfLegalBoards(5))
