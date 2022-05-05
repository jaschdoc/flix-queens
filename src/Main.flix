// The main entry point.
def main(): Unit & Impure =
    match Environment.getArgs() {
        case x :: _ => match Int32.fromString(x) {
            case Ok(n) =>
                Queens.allLegalBoards(n) |> 
                List.join(String.lineSeparator()) |>
                println
            case Err(_) => System/StdErr.println("\"${x}\" is not a valid number.")
        }
        case Nil => System/StdErr.println("Wrong number of arguments. Please specify the dimensions of the chess board with a single number.")
    }
            
