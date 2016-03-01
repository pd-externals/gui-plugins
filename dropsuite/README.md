Drag'n'Drop for Pure Data
=========================

plugins to enable drag'n'drop for Pd

# available plugins

## drop-patch-plugin

Allows you to drop Pd-files onto the Pd-window (aka Pd-console) to open them as
top-level patches, and to drop Pd-files into a patch to instantiate them as a
new object.

## text-onto-patch-plugin

Allows you to drag'n'drop text onto a patch to instantiate it as comments.

# INSTALLATION
just copy the `*.tcl` files into your Pd-startup folder:


 - Linux `~/pd-externals/`
 - OSX  `~/Library/Pd/`
 - Windows `%AppData%\Pd\`


they will be automatically used, the next time you start Pd

## PREREQUISITES
gui-plugins only work with Pd>=0.43


# AUTHORS
- IOhannes m zmölnig
- Patrice Colet
- Hans-Christoph Steiner

# LICENSE
This is released under a 3-clause BSD license.
See [LICENSE.md](LICENSE.md) for details.
