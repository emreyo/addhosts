addhosts
========

updates /etc/hosts file. useful for blocked/banned domain names.

examples: 

    addhosts vimeo.com
    addhosts pastebin.com
    addhosts kickass.to

This script gets the appropriate information from [Google Public DNS](https://developers.google.com/speed/public-dns/) and updates your `hosts` file according to this information. 

todo: 

	- aliasing
	- delete/update
	- choose dns 
