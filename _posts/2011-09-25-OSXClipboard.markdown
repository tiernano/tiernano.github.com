---

layout: post

title: OSX Clipboard Tip
---

Ever want to take the output of a command from the OSX Terminal and stick it in the clipboard for something? Ever want to use the output of the clipboard in your Terminal command? With this handy tip, you can!

Check out the full details at [hints.macworld.com][1], but the basic gist is:

ls -al | pbcopy

(contents of the ls -al command now in your clipboard for pasting)

pbpaste > somefile 

(paste the contents of the clipboard into the file, somefile... saves you having to open your favorite text editor and pasting in that way!



[1]: http://hints.macworld.com/article.php?story=20010627221216167

