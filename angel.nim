import std/terminal, strutils

proc banner() =
    stdout.styledWriteLine(fgCyan, """                                           
                                        ████ 
                                       ░░███ 
  ██████   ████████    ███████  ██████  ░███ 
 ░░░░░███ ░░███░░███  ███░░███ ███░░███ ░███ 
  ███████  ░███ ░███ ░███ ░███░███████  ░███ 
 ███░░███  ░███ ░███ ░███ ░███░███░░░   ░███ 
░░████████ ████ █████░░███████░░██████  █████
 ░░░░░░░░ ░░░░ ░░░░░  ░░░░░███ ░░░░░░  ░░░░░ 
                      ███ ░███               
                     ░░██████                
                      ░░░░░░
                      """)
    stdout.styledWriteLine(fgCyan, "author: prophetniko")
    
proc commandHelp() =
    echo """
    put help stuff here later when angel is more complete
    """

proc commandExit() =
    stdout.styledWriteLine(fgCyan, "exiting angel, happy hunting!")
    quit(0)

proc startup() =
    hideCursor()
    defer: showCursor()

    eraseScreen()
    setCursorPos(0,0)

    banner()

proc repl() =
  echo "enter \"help\" to display help menu"

  while true:
    stdout.write("angel > ")
    stdout.flushFile()

    let raw = stdin.readLine()
    let input = raw.strip()

    if input.len == 0: continue

    let parts = input.splitWhitespace()
    if parts.len == 0: continue 

    let cmd = parts[0].toLowerAscii()

    case cmd
    of "help":
      commandHelp()
    of "exit", "quit", "q":
      commandExit()
    else:
      stdout.styledWriteLine(fgRed, "Unknown command: ", cmd)

    
proc ctrlc() {.noconv.} =
    echo "\n"
    commandExit()

when isMainModule:
  setControlCHook(ctrlc)
  startup()
  repl()
