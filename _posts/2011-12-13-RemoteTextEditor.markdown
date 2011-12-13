---
layout: post
title: Remote Text Editor
---
I was reading about the [TextMate 2][1] Alpha (?) release, and found an interesting post titled [TextMate 2 + rmate = Awesome][2] and it started making me think... I use a Windows machine 90% of the time, and the rest of the time i use either a Mac or an iPad. When in Windows, I use [Visual Studio][4] or [NotePad++][3] for editing text files. And i started to think: How hard would it be to actually create a remote text editor?

So, thinking about this, i am wondering what and how it would work...

* looking at the idea of rmate above, it seems to open an SSH tunnel between the local and remote machines. the rmate script connects to the local port (local to the remote machine) which tunnels back to the client machine. this gets around a lot of firewall issues... The joys of SSH tunnelling!
* a local service or program is sitting on the local machine waiting for the connection. once connected, the remote machine sends the text to the service, it takes the content and allows you to work on it. when you hit save, it sends it back to the remote machine and it throws it to disk...

My though on this, on how it could be done, is as follows:

* Windows EXE sitting in the desktop tray, liting on a port. 
* connect to your remote machine using a simular SSH tunneling command.
* on the remote machine, have a simular script. 
* the exe knows your text editor of choice (Notepad, Visual Studio, Notepad++, etc), and when a new request comes in, save the file to a temp location, and open your editor. 
* watch that file for changes...
* any time the file changes, send it back over the SSH tunnel to the remote host...

the advantage of this i can see is that your text editor does not need to know about remote connections, and you do not re-write a text editor... now all i need to do is build this... watch this space...

[1]: http://news.ycombinator.com/item?id=3344881
[2]: http://erniemiller.org/2011/12/12/textmate-2-rmate-awesome/
[3]: http://notepad-plus-plus.org/
[4]: http://msdn.microsoft.com/en-gb/vstudio