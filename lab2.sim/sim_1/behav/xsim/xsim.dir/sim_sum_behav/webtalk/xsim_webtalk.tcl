webtalk_init -webtalk_dir /home/P33011_12/lab2/lab2.sim/sim_1/behav/xsim/xsim.dir/sim_sum_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Tue Apr  6 19:44:12 2021" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2019.1 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2552052" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "211205693_174151424_210708719_667" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "7a11b80f-ddb9-4cd2-865b-05f1e43189cf" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "092a8af2dd974a52b77c069fa37d11ee" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "18" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Fedora" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Fedora release 24 (Twenty Four)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Xeon(R) CPU E5-2643 0 @ 3.30GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3299.974 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "2" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "65.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "100 ns" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "0" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.13_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "125040_KB" -context "xsim\\usage"
webtalk_transmit -clientid 2075444300 -regid "211205693_174151424_210708719_667" -xml /home/P33011_12/lab2/lab2.sim/sim_1/behav/xsim/xsim.dir/sim_sum_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/P33011_12/lab2/lab2.sim/sim_1/behav/xsim/xsim.dir/sim_sum_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/P33011_12/lab2/lab2.sim/sim_1/behav/xsim/xsim.dir/sim_sum_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
