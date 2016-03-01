Pure Data GUI plugins
=====================

a collection of GUI plugins for Pure Data.


# included plugins

A number of smallish GUI plugins are included directly,
more plugins are included via `git submodules`.
Please use something like, the following line to update/fetch these via git:

    git submodule update --init


### dropsuite
collection of plugins dealing with drag'n'drop

### patch2svg-plugin
render a Pd-patch as SVG

### tclprompt-plugin
(Re)enable the tcl-prompt that vanished in Pd-0.47

## more info
please consult the README (and LICENSE) files within the various plugin folders
for instructions on how to install and use the resp. plugin.

# Prerequisites
GUI plugins only work with Pd>=0.43.

See the plugin's README for more detailed dependencies.

# Installation
These are only generic installation instructions.
For plugin specific instructions see the documentation that is bundled with the
plugin in question.

In general it is enough to copy the entire plugin directory (if the
directory name ends with `-plugin`) of (in case of small single-file plugins)
the `*-plugin.tcl` file into your Pd startup folder.

The Pd startup folder is system dependent:

 * Linux = `~/pd-externals/deken-plugin/` (`~` being your Home-directory)
 * OSX = `~/Library/Pd/deken-plugin/` (`~` being your Home-directory)
 * Windows = `%AppData%\Pd\deken-plugin\` (type `%AppData%` into the
   file-location bar of the *Windows Explorer* to see the actual value of this
   variable)


# CONTRIBUTING

if you would like to contribute (e.g. you want to have your cool plugin included
either directly of via a `git submodule`; or you want to fix a bug; or you want
to request a new plugin/feature/...), please get in contact with us.

- [Pd-list](http://lists.puredata.info)
- [GitHub ticket](https://github.com/pure-data/gui-plugins/issues)
- we are also happy to accept pull-requests on github.
