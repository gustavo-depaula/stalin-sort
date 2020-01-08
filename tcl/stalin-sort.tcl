#!/bin/sh
# the next line restarts using tclsh \
    exec tclsh "$0" ${1+"$@"}

# leg20200107: A straight forward Tcl implementation of
#
# [StalinSort](https://github.com/gustavo-depaula/stalin-sort)
#
# Make this script executable and run it for some tests.


proc StalinSort l {
    set p [lindex $l 0]
    set s {}
    foreach e $l {
	if {$e < $p} continue
	lappend s $e
	set p $e
    }
    return $s
}


# Tests
if {![info exists argv0] ||
    [file dirname [file normalize [info script]/...]]
    ne[file dirname [file normalize $argv0/...]]} return

proc test s {puts "$s: `[eval $s]'"}
test "StalinSort {}"
test "StalinSort 1"
test "StalinSort {1 2 5 3 5 7}"
test "StalinSort {a b e c e g}"
