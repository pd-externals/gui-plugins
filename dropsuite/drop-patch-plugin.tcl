# META NAME drop-patch
# META DESCRIPTION drop patch-files onto patches to create objects
# META DESCRIPTION drop patch-files onto Pd-console to open patches

# META AUTHOR IOhannes m zmölnig <zmoelnig@iem.at>
# META AUTHOR Patrice Colet <colet.patrice@free.fr>
# META AUTHOR Hans-Christoph Steiner <eighthave@users.sourceforge.net>

package require tkdnd

namespace eval ::dnd_object_create {
    variable x 0
    variable y 0
}

#------------------------------------------------------------------------------#
# create an object using the dropped filename

proc ::dnd_object_create::bind_to_canvas {mytoplevel} {
    ::tkdnd::drop_target register $mytoplevel DND_Files
    bind $mytoplevel <<DropPosition>> {+::dnd_object_create::setxy %X %Y}
    bind $mytoplevel <<Drop:DND_Files>> {::dnd_object_create::dropped_object_files %W %D}
}


proc ::dnd_object_create::setxy {newx newy} {
    variable x $newx
    variable y $newy
    return "copy"
}


proc ::dnd_object_create::open_dropped_files {files} {
    foreach file $files {
        open_file $file
   }
}


proc ::dnd_object_create::dropped_object_files {mytoplevel files} {
    foreach file $files {
	set ext  [file extension $file]
	set obj  [file rootname [file tail $file]]
	set dir  [file dirname $file]
    if {$ext == ".pd"} {
        set found 0
        foreach pathdir [concat $::sys_searchpath $::sys_staticpath] {
            ## if pathdir is relative, prepend pwd to it
            set pathdir [file normalize $pathdir]
            # check if the dropped file is in a subdirectory of our PATH
            if { [string first $pathdir $dir ] == 0 } {
                set found 1
                set obj [string trimleft [file rootname [string range $file [string length $pathdir ] end]] /]
                ::pdwindow::debug "dropping $obj from $pathdir on $::focused_window\n"
                ::dnd_object_create::make_object $mytoplevel $obj
                break
                }
	    }
        if { 0 == $found } {
            set obj [file rootname $file]
            ::pdwindow::debug "dropping $obj on $::focused_window\n"
            ::dnd_object_create::make_object $mytoplevel $obj
        }
        }
    }
    return "link"
}


proc ::dnd_object_create::make_object {w obj} {
    variable x
    variable y
    set posx [expr $x - [winfo rootx $w]]
    set posy [expr $y - [winfo rooty $w]]
    pdsend "$w obj $posx $posy $obj"
    return "dropped"
}

bind PatchWindow <<Loaded>> {+::dnd_object_create::bind_to_canvas %W}
::tkdnd::drop_target register .pdwindow DND_Files
bind .pdwindow <<Drop:DND_Files>> {::dnd_object_create::open_dropped_files %D}

::pdwindow::post "drop on canvas loaded\n"
