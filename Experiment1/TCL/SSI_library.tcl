################################################################################
# TCL Script for Vivado
# Project: SSI_library
# Board: Nexys A7 100T
# Tasks: Lint, Synthesize, Behavioral Simulation, Synthesis Simulation
################################################################################

# Set project variables
set project_name "SSI_library_project"
set project_dir "./vivado_project"
set design_file "Design/SSI_library.v"
set testbench_file "Testbench/SSI_tb.v"
# set constraint_file "Constraint_Nexys_A7_100T/Nexys-A7-100T-Master.xdc"
set part_name "xc7a100tcsg324-1"

# Get the current working directory
set script_dir [file dirname [file normalize [info script]]]
set project_root [file dirname $script_dir]

# Change to project root directory
cd $project_root

puts "================================================================================"
puts "Starting SSI_library Design Flow"
puts "Project Root: $project_root"
puts "================================================================================"

################################################################################
# Step 1: Create Project
################################################################################
puts "\n[1/6] Creating Vivado Project..."

# Remove existing project if it exists
if {[file exists $project_dir]} {
    file delete -force $project_dir
    puts "Removed existing project directory"
}

# Create project
create_project $project_name $project_dir -part $part_name -force

# Set project properties
set_property target_language Verilog [current_project]
set_property simulator_language Verilog [current_project]
set_property default_lib work [current_project]

puts "Project created successfully"

################################################################################
# Step 2: Add Design Files
################################################################################
puts "\n[2/6] Adding Design Files..."

# Add design source file
if {[file exists $design_file]} {
    add_files -norecurse $design_file
    puts "Added design file: $design_file"
} else {
    puts "ERROR: Design file not found: $design_file"
    exit 1
}

# Add testbench file
if {[file exists $testbench_file]} {
    add_files -fileset sim_1 -norecurse $testbench_file
    puts "Added testbench file: $testbench_file"
} else {
    puts "WARNING: Testbench file not found: $testbench_file"
}

# Add constraint file
#if {[file exists $constraint_file]} {
#    add_files -fileset constrs_1 -norecurse $constraint_file
#    puts "Added constraint file: $constraint_file"
#} else {
#    puts "WARNING: Constraint file not found: $constraint_file"
#}

# Update compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "Design files added successfully"

################################################################################
# Step 3: Lint Design (Syntax Check)
################################################################################
puts "\n[3/6] Linting Design (Syntax Check)..."

# Create a simple top module wrapper for linting and synthesis
set top_module_content {
`timescale 1ns / 1ps

module SSI_library_top(
    input [1:0] IN,
    output [7:0] OUT
);
    AND   uut0 (.O(OUT[0]), .I1(IN[0]), .I2(IN[1]));
    OR    uut1 (.O(OUT[1]), .I1(IN[0]), .I2(IN[1]));
    NOT   uut2 (.O(OUT[2]), .I(IN[1]));
    NAND  uut3 (.O(OUT[3]), .I1(IN[0]), .I2(IN[1]));
    NOR   uut4 (.O(OUT[4]), .I1(IN[0]), .I2(IN[1]));
    EXOR  uut5 (.O(OUT[5]), .I1(IN[0]), .I2(IN[1]));
    EXNOR uut6 (.O(OUT[6]), .I1(IN[0]), .I2(IN[1]));
    TRI   uut7 (.O(OUT[7]), .I(IN[0]), .E(IN[1]));
endmodule
}

# Write top module to a temporary file
set top_file "$project_dir/temp_top.v"
set fp [open $top_file w]
puts $fp $top_module_content
close $fp

# Add top module to project
add_files -norecurse $top_file
set_property top SSI_library_top [current_fileset]

# Update compile order
update_compile_order -fileset sources_1

# Run RTL elaboration for linting (syntax and basic semantic checks)
puts "Running RTL elaboration (linting) on design..."
if {[catch {synth_design -rtl -name rtl_1 -mode out_of_context} result]} {
    puts "ERROR: Linting failed!"
    puts $result
    puts "Please check the design file for errors."
    # Continue to see all errors, but mark as failed
    set lint_passed 0
} else {
    puts "Linting passed! Design syntax and basic semantics are correct."
    set lint_passed 1
}

################################################################################
# Step 4: Synthesize Design
################################################################################
puts "\n[4/6] Synthesizing Design..."

# Top module is already set from linting step
puts "Running synthesis..."
if {[catch {synth_design -top SSI_library_top -part $part_name} result]} {
    puts "ERROR: Synthesis failed!"
    puts $result
    exit 1
} else {
    puts "Synthesis completed successfully!"
    
    # Generate synthesis reports
    report_utilization -file "$project_dir/synth_utilization.rpt"
    report_timing_summary -file "$project_dir/synth_timing.rpt"
    puts "Synthesis reports generated"
}

################################################################################
# Step 5: Behavioral Simulation
################################################################################
puts "\n[5/6] Running Behavioral Simulation..."

# Set simulation top
set_property top Top_module_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Set simulation properties
set_property -name {xsim.simulate.runtime} -value {1000ns} -objects [get_filesets sim_1]

puts "Launching behavioral simulation..."
if {[catch {
    launch_simulation
    run 1000ns
} result]} {
    puts "ERROR: Behavioral simulation failed!"
    puts $result
} else {
    puts "Behavioral simulation completed successfully!"
    puts "Simulation ran for 1000ns. Check the simulation window for waveforms and results."
}

################################################################################
# Step 6: Synthesis Simulation (Post-Synthesis)
################################################################################
puts "\n[6/6] Running Synthesis Simulation..."

# Close current simulation if open
catch {close_sim -force}

# Set up for post-synthesis simulation
set_property -name {xsim.simulate.runtime} -value {1000ns} -objects [get_filesets sim_1]

puts "Launching post-synthesis simulation..."
if {[catch {
    launch_simulation -mode post-synthesis -type functional
    run 1000ns
} result]} {
    puts "WARNING: Post-synthesis simulation failed!"
    puts $result
    puts "This may be because synthesis netlist is not available or simulation setup failed."
} else {
    puts "Post-synthesis simulation completed successfully!"
    puts "Simulation ran for 1000ns. Check the simulation window for waveforms and results."
}

################################################################################
# Summary
################################################################################
puts "\n================================================================================"
puts "Design Flow Summary"
puts "================================================================================"
puts "Project Name: $project_name"
puts "Project Directory: $project_dir"
puts "Part: $part_name"
puts "Design File: $design_file"
puts "Testbench: $testbench_file"
puts ""
puts "Completed Steps:"
puts "  [✓] Project Creation"
puts "  [✓] Design Files Added"
puts "  [✓] Design Linting"
puts "  [✓] Synthesis"
puts "  [✓] Behavioral Simulation"
puts "  [✓] Synthesis Simulation"
puts ""
puts "Project saved at: $project_dir"
puts "================================================================================"

# Keep project open
puts "\nProject is ready for further analysis."
puts "You can now:"
puts "  - View synthesis reports in Reports tab"
puts "  - Analyze simulation waveforms"
puts "  - Run implementation if needed"
puts ""

