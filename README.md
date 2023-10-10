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
them do the following.

 * A - RED - `ui_cancel` - Xbox B - Nintendo A - Sony Circle
 * B - YELLOW - `ui_escape` - Xbox X - Nintendo Y - Sony Square
 * X - BLUE - `ui_accept` - Xbox A - Nintendo B - Sony Cross
 * Y - GREEN - `ui_select` - Xbox Y - Nintendo X - Sony Triangle

## Implementation

 [X] Output size and view
 [ ] Keyboard, mouse and input
 [ ] ...
 
