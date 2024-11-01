*frameworks.pyx*                              Last change: 2023 Sep 15

Program Frameworks
******************

The modules described in this chapter are frameworks that will largely
dictate the structure of your program.  Currently the modules
described  here are all oriented toward writing command-line
interfaces.

The full list of modules described in this chapter is:

* "turtle" — Turtle graphics

  * Introduction

  * Get started

  * Tutorial

    * Starting a turtle environment

    * Basic drawing

      * Pen control

      * The turtle’s position

    * Making algorithmic patterns

  * How to…

    * Get started as quickly as possible

    * Use the "turtle" module namespace

    * Use turtle graphics in a script

    * Use object-oriented turtle graphics

  * Turtle graphics reference

    * Turtle methods

    * Methods of TurtleScreen/Screen

  * Methods of RawTurtle/Turtle and corresponding functions

    * Turtle motion

      * "forward()"

      * "fd()"

      * "back()"

      * "bk()"

      * "backward()"

      * "right()"

      * "rt()"

      * "left()"

      * "lt()"

      * "goto()"

      * "setpos()"

      * "setposition()"

      * "teleport()"

      * "setx()"

      * "sety()"

      * "setheading()"

      * "seth()"

      * "home()"

      * "circle()"

      * "dot()"

      * "stamp()"

      * "clearstamp()"

      * "clearstamps()"

      * "undo()"

      * "speed()"

    * Tell Turtle’s state

      * "position()"

      * "pos()"

      * "towards()"

      * "xcor()"

      * "ycor()"

      * "heading()"

      * "distance()"

    * Settings for measurement

      * "degrees()"

      * "radians()"

    * Pen control

      * Drawing state

        * "pendown()"

        * "pd()"

        * "down()"

        * "penup()"

        * "pu()"

        * "up()"

        * "pensize()"

        * "width()"

        * "pen()"

        * "isdown()"

      * Color control

        * "pencolor()"

        * "fillcolor()"

        * "color()"

      * Filling

        * "filling()"

        * "begin_fill()"

        * "end_fill()"

      * More drawing control

        * "reset()"

        * "clear()"

        * "write()"

    * Turtle state

      * Visibility

        * "hideturtle()"

        * "ht()"

        * "showturtle()"

        * "st()"

        * "isvisible()"

      * Appearance

        * "shape()"

        * "resizemode()"

        * "shapesize()"

        * "turtlesize()"

        * "shearfactor()"

        * "tilt()"

        * "tiltangle()"

        * "shapetransform()"

        * "get_shapepoly()"

    * Using events

      * "onrelease()"

      * "ondrag()"

    * Special Turtle methods

      * "begin_poly()"

      * "end_poly()"

      * "get_poly()"

      * "clone()"

      * "getturtle()"

      * "getpen()"

      * "getscreen()"

      * "setundobuffer()"

      * "undobufferentries()"

    * Compound shapes

  * Methods of TurtleScreen/Screen and corresponding functions

    * Window control

      * "bgcolor()"

      * "bgpic()"

      * "clearscreen()"

      * "resetscreen()"

      * "screensize()"

      * "setworldcoordinates()"

    * Animation control

      * "delay()"

      * "tracer()"

      * "update()"

    * Using screen events

      * "listen()"

      * "onkey()"

      * "onkeyrelease()"

      * "onkeypress()"

      * "onclick()"

      * "onscreenclick()"

      * "ontimer()"

      * "mainloop()"

      * "done()"

    * Input methods

      * "textinput()"

      * "numinput()"

    * Settings and special methods

      * "mode()"

      * "colormode()"

      * "getcanvas()"

      * "getshapes()"

      * "register_shape()"

      * "addshape()"

      * "turtles()"

      * "window_height()"

      * "window_width()"

    * Methods specific to Screen, not inherited from TurtleScreen

      * "bye()"

      * "exitonclick()"

      * "setup()"

      * "title()"

  * Public classes

    * "RawTurtle"

    * "RawPen"

    * "Turtle"

    * "TurtleScreen"

    * "Screen"

    * "ScrolledCanvas"

    * "Shape"

      * "Shape.addcomponent()"

    * "Vec2D"

  * Explanation

  * Help and configuration

    * How to use help

    * Translation of docstrings into different languages

      * "write_docstringdict()"

    * How to configure Screen and Turtles

  * "turtledemo" — Demo scripts

  * Changes since Python 2.6

  * Changes since Python 3.0

* "cmd" — Support for line-oriented command interpreters

  * "Cmd"

  * Cmd Objects

    * "Cmd.cmdloop()"

    * "Cmd.onecmd()"

    * "Cmd.emptyline()"

    * "Cmd.default()"

    * "Cmd.completedefault()"

    * "Cmd.columnize()"

    * "Cmd.precmd()"

    * "Cmd.postcmd()"

    * "Cmd.preloop()"

    * "Cmd.postloop()"

    * "Cmd.prompt"

    * "Cmd.identchars"

    * "Cmd.lastcmd"

    * "Cmd.cmdqueue"

    * "Cmd.intro"

    * "Cmd.doc_header"

    * "Cmd.misc_header"

    * "Cmd.undoc_header"

    * "Cmd.ruler"

    * "Cmd.use_rawinput"

  * Cmd Example

* "shlex" — Simple lexical analysis

  * "split()"

  * "join()"

  * "quote()"

  * "shlex"

  * shlex Objects

    * "shlex.get_token()"

    * "shlex.push_token()"

    * "shlex.read_token()"

    * "shlex.sourcehook()"

    * "shlex.push_source()"

    * "shlex.pop_source()"

    * "shlex.error_leader()"

    * "shlex.commenters"

    * "shlex.wordchars"

    * "shlex.whitespace"

    * "shlex.escape"

    * "shlex.quotes"

    * "shlex.escapedquotes"

    * "shlex.whitespace_split"

    * "shlex.infile"

    * "shlex.instream"

    * "shlex.source"

    * "shlex.debug"

    * "shlex.lineno"

    * "shlex.token"

    * "shlex.eof"

    * "shlex.punctuation_chars"

  * Parsing Rules

  * Improved Compatibility with Shells

vim:tw=78:ts=8:ft=help:norl: