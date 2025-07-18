# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dinur/Project/Nanoprocessor/Nanoprocessor.cache/wt [current_project]
set_property parent.project_path C:/Users/dinur/Project/Nanoprocessor/Nanoprocessor.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo c:/Users/dinur/Project/Nanoprocessor/Nanoprocessor.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/dinur/Project/AddSub Unit/AddSub Unit.srcs/sources_1/new/ASU.vhd}
  C:/Users/dinur/Project/PC/PC.srcs/sources_1/imports/new/D_FF.vhd
  C:/Users/dinur/Project/InstructionDecoder/InstructionDecoder.srcs/sources_1/imports/new/Decoder_2_to_4.vhd
  C:/Users/dinur/Project/RegisterBank/RegisterBank.srcs/sources_1/imports/new/Decoder_3_to_8.vhd
  C:/Users/dinur/Project/EightWay4Bit_MUX/EightWay4Bit_MUX.srcs/sources_1/new/EightWay4Bit_MUX.vhd
  C:/Users/dinur/Project/3BitAdder/3BitAdder.srcs/sources_1/imports/new/FA.vhd
  C:/Users/dinur/Project/3BitAdder/3BitAdder.srcs/sources_1/imports/new/HA.vhd
  C:/Users/dinur/Project/InstructionDecoder/InstructionDecoder.srcs/sources_1/new/InstructionDecoder.vhd
  C:/Users/dinur/Project/ProgramROM/ProgramROM.srcs/sources_1/imports/new/LUT_16_7.vhd
  C:/Users/dinur/Project/Seven_Segment_Display/Seven_Segment_Display.srcs/sources_1/imports/new/LUT_16_7.vhd
  C:/Users/dinur/Project/PC/PC.srcs/sources_1/new/PC.vhd
  C:/Users/dinur/Project/3BitAdder/3BitAdder.srcs/sources_1/new/RCA_3.vhd
  {C:/Users/dinur/Project/AddSub Unit/AddSub Unit.srcs/sources_1/imports/new/RCA_4.vhd}
  C:/Users/dinur/Project/RegisterBank/RegisterBank.srcs/sources_1/new/Reg.vhd
  C:/Users/dinur/Project/RegisterBank/RegisterBank.srcs/sources_1/new/RegisterBank.vhd
  C:/Users/dinur/Project/Processor_Clock/Processor_Clock.srcs/sources_1/imports/new/Slow_Clk.vhd
  C:/Users/dinur/Project/3BitAdder/3BitAdder.srcs/sources_1/new/ThreeBA.vhd
  C:/Users/dinur/Project/TwoWay3Bit_MUX/TwoWay3Bit_MUX.srcs/sources_1/new/TwoWay3Bit_MUX.vhd
  C:/Users/dinur/Project/TwoWay4Bit_MUX/TwoWay4Bit_MUX.srcs/sources_1/new/TwoWay4Bit_Mux.vhd
  C:/Users/dinur/Project/Nanoprocessor/Nanoprocessor.srcs/sources_1/new/nanoprocessor.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/dinur/Project/Nanoprocessor/Nanoprocessor.srcs/constrs_1/new/NanoprocessorCons.xdc
set_property used_in_implementation false [get_files C:/Users/dinur/Project/Nanoprocessor/Nanoprocessor.srcs/constrs_1/new/NanoprocessorCons.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top nanoprocessor -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef nanoprocessor.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file nanoprocessor_utilization_synth.rpt -pb nanoprocessor_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
