# plotwrd-zig
Font generator written for zig.  Writes from top down instead of left to right.

Compile with 

zig build-exe plotwrd.zig -O ReleaseSmall -fstrip -fsingle-threaded

to build a very small font generator.

This version just outputs in text but I have used it since the Apple II/TRS-80 days to draw graphics.
Fairly easy to port ot anything, including C or Assembly language.
That's why I keep it around... it's an old tool.

I wasn't feeling well today so wrote the zig version of plotwrd.

Syntax is:

./plotwrd "Hello there"

And watch it go.

I only support a 5x7 font in this version.  Decwriter II style font, more or less.



![alt text](https://github.com/tpfaff100/plotwrd-zig/blob/main/show.jpg?raw=true)
