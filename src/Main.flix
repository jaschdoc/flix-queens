// The main entry point.
def main(): Unit & Impure =
    println(String.repeat(3, "Hello World!"));

    Queens.printSolutions(Queens.allLegalBoards2(8))
