# My Opinion on Godot (deb-3.2.3-stable)

Very nice. So after dumping some OCD about "what would happen if I changed the extends class of an attached script?"
by considering the `extends` keyword as a effector whose time would have been when adding the class to the tree, and
so would never be used after the fact. The lack of an error was then logically not ever necessary. More of a mind gym
experience, but entirely logical. Then the menu to change a tree item's type is the way.

I think lots of things like this are more logical after a while with Godot. Such as the window panes in the editor
of relevance change when a selection happens, but the unrelevant ones remain unchaged, sort of leaving a confusion
of multiple views onto multiple objects. But logical as soon as understanding the relevance focus.

I remember `flash` comes to mind, but with more `.png`. Now I've gotten used to the GUI, I think now is the time
for a project refactorization. What about the filenames of a script not needing to be named after the class?
If I do all class names in `CamelCase`, and method/function names and field/var names in `snake_case`, that just
leaves me free to pick a style for filenames.

There also appears to be an unnecessary convention of double spacing between methods, which I'd never follow as
I'd fill in thew single inside function spaces with comments to differentiate them from the next function.
So apparently the tree items would be instances of classes implying snake case, yet as saved files which can be
instanced they are classes so should be camel case. Like I said some of the style specification for code is "unnecessary"
and pointless. The instances of classes thing is where it all goes for me. A minor point.

The exporters work fine apparently, and this makes for the most compact Android devkit I've ever had. This in
itself is impressive. For the type of thing I'm doing at the moment I don't need the magic of version 4, as it
seems to kill off the OpenGLES2 video engine. This would be sad as my Chromebook **needs** it to run the editor.

The score so far, an impressive **9/10**.
