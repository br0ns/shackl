
val INCLUDE_FILE = "~/.shackl"

structure FS = OS.FileSys

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
        val _ = OS.Process.system("premlton " ^ mlbfile)
        val _ = remove mlbfile
      in
        ()
      end
    else print (infile ^ " does not exist\n")
