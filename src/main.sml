
structure FS = OS.FileSys

fun die s = (print s
           ; print "\n"
           ; OS.Process.exit OS.Process.failure
            )

val (INCLUDE_FILE
   , INCLUDE_DIR) =
    case OS.Process.getEnv "HOME" of
      SOME home => (home ^ "/.shackl", home ^ "/.shackl.d")
    | NONE      => die "No environment variable 'HOME'"

fun exists file = FS.access (file, nil)
val remove = FS.remove
fun readFile file =
    let
      val is = TextIO.openIn file
      val s = TextIO.inputAll is
      val _ = TextIO.closeIn is
    in
      s
    end

fun writeFile file s =
    let
      val os = TextIO.openOut file
      val _ = TextIO.output (os, s)
      val _ = TextIO.closeOut os
    in
      ()
    end


fun env () =
    if exists INCLUDE_FILE
    then readFile INCLUDE_FILE
    else "$(SML_LIB)/basis/basis.mlb"

fun main infile =
    if exists infile
    then
      let
        val mlbfile = OS.Path.base infile ^ ".mlb"
        val _ = writeFile mlbfile (env () ^ "\n%pre " ^ infile)
        val _ =
            OS.Process.system
              ("premlton -mlb-path-var \"SHACKL " ^ INCLUDE_DIR ^ "\" "
               ^ mlbfile)
        (* val _ = remove mlbfile *)
      in
        ()
      end
    else die (infile ^ " does not exist")
