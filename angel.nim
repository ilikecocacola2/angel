import std/terminal

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
    
proc startup() =
    hideCursor()
    defer: showCursor()

    eraseScreen()
    setCursorPos(0,0)

    banner()

startup()
