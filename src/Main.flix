// The main entry point.
def main(): Unit & Impure =
    println(List.length(Queens.allLegalBoards(8)));
    println(Queens.numberOfLegalBoards(8));
    println("Hello World!")
