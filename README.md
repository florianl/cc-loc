cc-loc
======

This is a simple script, to get an overview about changes in [ClearCase](http://en.wikipedia.org/wiki/Rational_ClearCase).
I wrote this script in my spare time to save working hours (and reduce annoyance).


Why ClearCase? Srsly?!
----------------------
At work I had to use it. It's not an option ...

Wish there would be git. I still hope that git will be introduced one day!


Usage
-----

Just run the script in your vobs-folder:

    $ sh loc.sh
      [...]

You can also specify the time, from which changes are counted:

    $ sh loc.sh 2013-12-01

The time must be in the following format: YYYY-MM-DD


License
-------

Copyright (c) 2014, Florian Lehner dev@der-flo.net

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
