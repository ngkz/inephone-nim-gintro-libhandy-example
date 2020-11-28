import gintro/[gtk, glib, gobject, gio, handy]

proc toIntVal(i: int): Value =
  let gtype = typeFromName("gint")
  discard init(result, gtype)
  setInt(result, i)

proc appActivate(app: Application) =
  let window = newApplicationWindow(app)
  window.title = "Keypad Example with Python"

  let vbox = newBox(Orientation.vertical, 0)
  let entry = newEntry()
  let keypad = newKeypad(true, true)

  vbox.add(entry)     # widget to show dialed number
  vbox.add(keypad)
  vbox.set_halign(Align.center)
  vbox.set_valign(Align.center)

  setProperty(vbox, "margin", toIntVal(18))
  setProperty(vbox, "spacing", toIntVal(18))
  keypad.set_row_spacing(6)
  keypad.set_column_spacing(6)

  keypad.set_entry(entry)     # attach the entry widget
  window.add(vbox)

  showAll(window)

proc main =
  let app = newApplication("io.github.ngkz.librechute")
  connect(app, "activate", appActivate)
  discard run(app)

when isMainModule:
  main()
