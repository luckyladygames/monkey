monkey
------

monkey is a small JavaScript library, written in CoffeeScript for monkey
patching dependent functionality into objects. Dependency Injection (DI) comes
from the object-oriented programming world. 

After looking at a few patterns for doing DI for node.js development I
eventually settled on monkey-patching to be the most idiomatic javascript way.

API
---

`monkey` provides two core functions: 

* `monkey.patch`
* `monkey.unpatch` 

Here is an example where `monkey` will be most likely used, in testing. 

    user = new User
    monkey.patch user, 
        save: () -> true
        find: () -> new User 

    ... run some tests ... 

    # revert user back to normal
    monkey.unpatch user

    # do some other change to user
    monkey.patch user, 
        save: () -> false
        find: () -> null

    ... etc ..


