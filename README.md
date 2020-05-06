This mod simply looks for a file periodically, which must be created by 
`touch(1)` or something similar, and owned by the same user who is 
running the Minetest server.  This file simply serves as a sort of flag.

If found, the file is immediately deleted, and pop-up warnings are 
issued to all players on the server that it will be rebooting soon.

This mod must be listed in secure.trusted_mods (assuming mod security is 
enabled) in order for the `os.remove()` function to work.

The pop-up function is provided by kaeza's notice mod, from here:

https://github.com/kaeza/minetest-kaeza_misc
