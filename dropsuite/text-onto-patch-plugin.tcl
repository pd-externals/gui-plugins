package require tkdnd

namespace eval ::text_on_patch {
    variable x 0
    variable y 0
}

#------------------------------------------------------------------------------#
# create an object using the dropped filename

bind PatchWindow <<Loaded>> {+::text_on_patch::bind_to_dropped_text %W}

proc ::text_on_patch::bind_to_dropped_text {mytoplevel} {
    ::tkdnd::drop_target register $mytoplevel DND_Text
    bind $mytoplevel <<DropPosition>> {::text_on_patch::setxy %X %Y}
    bind $mytoplevel <<Drop:DND_Text>> {::text_on_patch::make_comments %W %D}
    # TODO bind to DropEnter and DropLeave to make window visually show whether it will accept the drop or not
}

proc ::text_on_patch::setxy {newx newy} {
    variable x $newx
    variable y $newy
    return "copy"
}

proc ::text_on_patch::make_comments {mytoplevel text} {
    variable x
    variable y
    pdwindow::error "::text_on_patch::make_comments $mytoplevel text $x $y"
    foreach line [split [regsub {\\\;} $text {}] "\n"] {
        if {$line ne ""} {
            pdsend "$mytoplevel text $x $y $line"
            set y [expr $y + 20]
        }
    }
    return "copy"
}
