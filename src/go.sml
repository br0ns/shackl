
fun go () =
    if length (CommandLine.arguments ()) <> 1
    then print ("Usage: " ^ CommandLine.name () ^ " <file.sml>\n")
    else main (hd (CommandLine.arguments ()))

;go ();
