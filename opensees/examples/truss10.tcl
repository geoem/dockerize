# Linear Elastic analysis for 10 bar truss
# The script creates 3 dat output files with displacements, forces and stresses-strains.
#
# Author Manolis Georgioudakis <geoem@mail.ntua.gr>

# Units: kips, in, sec

# Create ModelBuilder (with two-dimensions and 2 DOF/node)
model BasicBuilder -ndm 2 -ndf 2

#  nodeId    x       y 
node  1   720.0   360.0
node  2   720.0     0.0
node  3   360.0   360.0
node  4   360.0     0.0
node  5     0.0   360.0
node  6     0.0     0.0

#  nodeID xResrnt yRestrnt
fix  5 1 1
fix  6 1 1

# uniaxialMaterial Elastic matID   E
uniaxialMaterial Elastic    1   10000

# element truss  trussID node1 node2 A matID
element truss  1 5 3  30.522  1
element truss  2 3 1   0.100  1
element truss  3 6 4  23.199  1
element truss  4 4 2  15.223  1
element truss  5 4 3   0.100  1
element truss  6 2 1  0.5513  1
element truss  7 4 5  7.4572  1
element truss  8 6 3  21.036  1
element truss  9 2 3  21.528  1
element truss 10 4 1   0.100  1

# Create a Plain load pattern with a linear TimeSeries
pattern Plain 1 "Linear" {
	# Create the nodal load - command: load nodeID xForce yForce
	load 2 0 -100
	load 4 0 -100
}

# --- Start of analysis generation ---
set tinicial [clock clicks -milliseconds]

# Create the system of equation, a SPD using a band storage scheme
system BandSPD

# Create the DOF numberer, the reverse Cuthill-McKee algorithm
numberer RCM

# Create the constraint handler, a Plain handler is used as homo constraints
constraints Plain

# Create the integration scheme, the LoadControl scheme using steps of 1.0
integrator LoadControl 1.0

# Create the solution algorithm, a Linear algorithm is created
algorithm Linear

# create the analysis object
analysis Static

# Perform the analysis
analyze 1

set tfinal [clock clicks -milliseconds]
set duration [expr ($tfinal-$tinicial)]
puts "Execution time: $duration ms"

# --- Print results to files ---
file delete "displacements.dat"
file delete "forces.dat"
file delete "stresses_strains.dat"

set dispout [open "displacements.dat" "w"]
set forcout [open "forces.dat" "w"]
set strsout [open "stresses_strains.dat" "w"]

# Write displacements
puts $dispout " NodeID           Tx                     Ty"
for {set i 1} {$i <= 6} {incr i} {
	set ux [nodeDisp $i 1]
	set uy [nodeDisp $i 2]
	puts $dispout [format "%5s   %20.10e   %20.10e" $i $ux $uy] 
}

# Write forces in local system
puts $forcout " ElementID   F1x    F1y    F2x     F2y"
for {set i 1} {$i <= 10} {incr i} {
	set axial [eleResponse $i forces]
	puts $forcout "$i $axial"
}

# Write stresses/strains
puts $strsout " ElementID      sigma-xx            epsilon-xx"
for {set i 1} {$i <= 10} {incr i} {
	set stresses [eleResponse $i material stress]
	set strains [eleResponse $i material strain]
    puts $strsout [format "%5s  %20.10e  %20.10e" $i  $stresses $strains] 
}

puts "INFO: Analysis Completed."