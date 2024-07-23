## Todo

The inspiration for this comes from what James Scott Bell called his "white-hot
document":

> So just how do you develop a concept? Every writer should have his own approach.
> Here's a quick overview of mine. One of the great writing books of all time is
> *Techniques of the Selling Writer* by Dwight V. Swain. On the development of
> concepts, Swain advocates the "white-hot document," basically writing as fast as
> you can with the idea gripping your brain. Write down possible characters, plot
> twists, scenes, themes, lines of dialogue. Anything.

I find that 1) I spend a lot of time on my terminal when on my computer, and that 2) I love the
variety of material I can generate with a few short-ish lines of markdown--see
[todo/md-example.md](https://github.com/stephen-lanier/scripts/blob/main/todo/md-example.pdf)
for some cool examples. 

Those two things are what led me to
this iteration on the white-hot document. Because while the program is called `todo`,
I use it for a lot more than just my todo list. I use it as a general
dumping ground for anything and everything I'm thinking about. Later, I go
through and move any keepers to the appropriate file or location, delete
finished items, etc.

This simple script allows me to call `todo` on the terminal. It opens
todo.md on my Desktop if it already exists, or creates it with the date as
markdown h1 `#` if it doesn't. If the file does exist, but it has a different
date than the current one for the first line, it updates the first line to the
current date but otherwise keeps the file the same.

`todo ref` opens a reference of all the cool stuff you can do with markdown. (I
have a markdown previewer already installed on my editor of choice.)

`todo did` moves the file to the trash.

And that's it! I can simply call `todo` from the terminal in any directory, and
it will open Neovim with my todo.md file.

Which reminds me, you need Trash and Neovim installed to use this out of the
box. If you have other preferences (i.e. `rm` instead of `trash`, `vim` instead
of `nvim`), these are simple changes to make for yourself. I don't guarantee
this works on any \*nix machine, only mine ;)

### Contents

- **todo.sh** I symlink this to my `/usr/local/bin` directory
- **md-example.md** contains examples of cool stuff you can do with markdown.
  `todo ref` opens this. No need to symlink
