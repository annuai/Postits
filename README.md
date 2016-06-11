# Postits
A Linux Desktop Stickynotes Application
![Postits Preview](http://i.imgur.com/14O4XmN.png)

Stickynotes always was a very useful application when I once was a Windows User. The switch to Linux lost me hundred things, while Sticky Notes was one of them.

Since I had to learn how to Code, this is a small project to bring a beautiful, usable stickynotes Application to the Linux Desktop, especially for GNOME Desktop Environment.

Postits is written using Vala, is in a very early stage, just days old, might not even work on many systems. Almost everything is TODO right now.

####TODO
- [x] Visual Design and Interaction
- [x] Primary UI
- [x] Sqlite Integration
- [ ] Save and Reload Notes
- [ ] Notes Manager and Preferences
- [ ] Bugs
- [ ] Testing
- [ ] Packaging

Libraries required to build<br />
gtk+-3.0<br />
sqlite3<br />
valac (Vala Compiler)

Compile using
 
    valac "postits.vala" --pkg  gtk+-3.0 --pkg sqlite3
Updates soon.

Read about my [Postits Story](http://annu.co/blog/postits-gui-app-development-story/)