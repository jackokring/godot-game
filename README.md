# godot-game

It might not be much and it might get better. Check `exports` for binaries when exported.

 * `Game.x86_64` Linux.
 * `Game.zip` MacOS.
 * `Game.exe` Windows.
 * `Game.apk` Android.
 * The rest is for WASM web browsing.
 
Performance may vary. Ironically, `Game.arm64` is not available but runs using the `.deb`
installed on the development system.

If you import the project, some directories might need fixing.

## Gameplay

### Strange Controllers

The controller I have is generic. The buttons A, B, X, Y are arranged strange. But, I made
them do the following, with some minor other things like L and R for `ui_home` and `ui_end`.
The mouse buttons also double as L and R, for android tapping. The two minor keys `ui_page_up`
and `ui_page_down` use L2 and R2, as they are limited to complex controllers.

 * A - RED - `ui_cancel` - Xbox B - Nintendo A - Sony Circle - `Right Button/Escape` - `(Start/R3/Options)`: Primary pause and menu options key.
 * B - YELLOW - `ui_escape` - Xbox X - Nintendo Y - Sony Square - `Left Button (Down)/Backslash` -> NORMAL
 * X - BLUE - `ui_accept` - Xbox A - Nintendo B - Sony Cross - `Down Button (Up)/Enter` - `(Select/L3/Share)`: Primary confirm and "fire" key.
 * Y - GREEN - `ui_select` - Xbox Y - Nintendo X - Sony Triangle - `Up Button (Left)/Space` -> STRANGE
 
So this obviously makes `Down Button` change between the input formats as it is detected as the normal `Left Button` on my joypad, and remains
the `Down Button` accept on many other joypads. As the alternate can be kept or set by `Up Button`. So both `Up` and `Down` set the mapping
making `Left` actually toggle between the two control layouts.


## Implementation

- [ ] Refactor code `ClassNames`/`instance_names` and decide if filenames are instances of the class class. Essential before code becomes to complex to easily refactor.
- [ ] Add tab control to GUI. Fix movement links.
- [ ] Decide on left button menu action fix handling by return of `bool`.
- [ ] Add simple player sprite control.
- [X] Output size and view, MarginContainer - Custom Constants
- [X] Keyboard, mouse and input
- [X] Translate test
- [X] Font resources and theme hierarchy
- [ ] ...
 
