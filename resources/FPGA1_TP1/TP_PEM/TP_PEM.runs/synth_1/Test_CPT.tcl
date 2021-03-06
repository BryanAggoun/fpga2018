# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/3408804/Downloads/FPGA1_TP1/TP_PEM/TP_PEM.cache/wt [current_project]
set_property parent.project_path C:/Users/3408804/Downloads/FPGA1_TP1/TP_PEM/TP_PEM.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/3408804/Downloads/FPGA1_TP1/TP_PEM/TP_PEM.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib C:/Users/3408804/Downloads/FPGA1_TP1/TP_PEM/TP_PEM.srcs/sources_1/imports/1_Compteurs_Imbriques/Test_CPT.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/3408804/Downloads/FPGA1_TP1/TP_PEM/TP_PEM.srcs/constrs_1/imports/Partie_1_Prise_en_Main/Test_Nexys4.xdc
set_property used_in_implementation false [get_files C:/Users/3408804/Downloads/FPGA1_TP1/TP_PEM/TP_PEM.srcs/constrs_1/imports/Partie_1_Prise_en_Main/Test_Nexys4.xdc]


synth_design -top Test_CPT -part xc7a100tcsg324-3


write_checkpoint -force -noxdef Test_CPT.dcp

catch { report_utilization -file Test_CPT_utilization_synth.rpt -pb Test_CPT_utilization_synth.pb }
