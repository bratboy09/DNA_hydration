mol load psf sys.psf
	for {set i 0 } {$i < 5} {incr i} {
		animate read dcd sys.dcd beg $i end $i 
		set sel [atomselect top "nucleic"]
		puts "hi--1"
		$sel writepdb $i.pdb
		puts "hi--2"
		if { $i == 0 } {
			$sel writepsf dry.psf
			$sel writepdb dry.pdb
 		}
		puts "loop-$i"
		$sel delete
		animate delete all
	
	}
puts "file num--$f"

mol delete top
mol load psf dry.psf
	for {set i 0 } {$i < 5} {incr i} {
		animate read pdb $i.pdb
		file delete $i.pdb
	}

animate write dcd {dry.dcd} waitfor all
exit 
