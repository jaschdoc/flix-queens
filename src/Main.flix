// The main entry point.
def main(): Unit & Impure =

    Queens.allLegalBoards(5) |> 
    List.join(String.lineSeparator()) |>
    println;

    Queens.allLegalBoards(8) |> 
    List.join(String.lineSeparator()) |>
    println;
    
    println(Queens.numberOfLegalBoards(5))
