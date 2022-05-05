// The main entry point.
def main(): Unit & Impure =
    println(ChessBoard.empty(8) |> ChessBoard.put((1, 1)));

    Queens.printSolutions(Queens.allLegalBoards2(8));
    
    Queens.allLegalBoards(5) |> 
    List.join(String.lineSeparator()) |>
    println;

    Queens.allLegalBoards(8) |> 
    List.join(String.lineSeparator()) |>
    println;
    
    println(Queens.numberOfLegalBoards(5))
