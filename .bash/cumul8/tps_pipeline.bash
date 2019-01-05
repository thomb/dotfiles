BASE_KPI_BUILD_PATH="/local/cumul8-pipelines/build/forestry"
BASE_KPI_SRC_PATH="/local/cumul8-pipelines/src/forestry"
BLOCK_BUILD_PATH="$BASE_KPI_BUILD_PATH/blocks"
PIPELINE_BUILD_PATH="$BASE_KPI_BUILD_PATH/kpis"
PIPELINE_SRC_PATH="$BASE_KPI_SRC_PATH/kpis"
C_EIGHT_TOOL="~/go/src/cumul8.com/ozone/tools/c8/";
TPS_WORKER_PATH="~/go/src/cumul8/ozone/services/tpsworker/tpsworker";

add_block () {
	SERVER=$1;
	param_count=0;

	echo "Type the System Name of the Block (camelCase):";
	read name;

	echo "Type a description for $name:";
	read description;

	echo "Type the path to the block build file (relative to $BLOCK_BUILD_PATH):";
	read script;


	echo "Add 'env' (y/n)?:"
	read add_env;

	# If this Block requires multiple inputs, it cannot have a single input
	echo "Add 'inputTopics' (y/n)?:"
	read add_inputs;

	if [ $add_inputs == 'y' ]; then
		echo "Add 'scheduleTopics' (y/n)?:"
		read add_schedules;
	fi


	echo "Add 'inputSchema' (y/n)?:"
	read add_input_schema;

	echo "Add 'outputTopics' (y/n)?:"
	read add_output;


	echo "Does your script have additional parameters? (y/n)";
	read has_params;

	if [ $has_params == 'y' ]; then
		declare -a pipeline_params;
		while [ $has_params == 'y' ]; do
			echo "Name:"
			read param_name;

			echo "Description:"
			read param_description;

			echo "Required? (true/false):"
			read param_required

			echo "Default Value?:"
			read param_default

			echo "Type: (string/number/etc)":
			read param_type

			pipeline_params[$param_count]=$param_name
			param_count=$(expr $param_count + 1)
			pipeline_params[$param_count]=$param_description
			param_count=$(expr $param_count + 1)
			pipeline_params[$param_count]=$param_required
			param_count=$(expr $param_count + 1)
			pipeline_params[$param_count]=$param_default
			param_count=$(expr $param_count + 1)
			pipeline_params[$param_count]=$param_type
			param_count=$(expr $param_count + 1)

			echo "Add another param (y/n)"
			read has_params;
		done
	fi

	if [ $SERVER == '' ]; then
		echo "Enter the server to add this pipeline to:";
		read SERVER
	fi

	create_pipeline_block_cmd="./c8 tps master block create '$name' '$description' @$BLOCK_BUILD_PATH/$script"

	if [ $add_env == 'y' ]; then
		create_pipeline_block_cmd=" $create_pipeline_block_cmd 'env','Which type of outputs should be generated',true,'',\"{\\\"type\\\": \\\"string\\\"}\"";
	fi

	if [ $add_inputs == 'y' ]; then
		create_pipeline_block_cmd=" $create_pipeline_block_cmd 'inputTopics','The Data Sources for the KPI calculations',true,'',\"{\\\"type\\\": \\\"object\\\"}\"";
	fi

	if [ $add_input_schema == 'y' ]; then
		create_pipeline_block_cmd=" $create_pipeline_block_cmd 'inputSchema','The Schema of the Data Sources for the KPI calculations',true,'',\"{\\\"type\\\": \\\"object\\\"}\"";
	fi

	if [ $add_output == 'y' ]; then
		create_pipeline_block_cmd=" $create_pipeline_block_cmd 'outputTopics','The destination Kafka Topics for the various types of output from this KPI',true,'',\"{\\\"type\\\": \\\"object\\\"}\"";
	fi

	if [ $add_schedules == 'y' ]; then
		create_pipeline_block_cmd=" $create_pipeline_block_cmd 'scheduleTopics','The schedule sources for the shift boundaries',true,'',\"{\\\"type\\\": \\\"object\\\"}\"";
	fi



	if [ $param_count -gt 0 ]; then
		i=0;
		while [ $i -lt $param_count ]; do
			# Name
			create_pipeline_block_cmd=" $create_pipeline_block_cmd '${pipeline_params[$i]}',";
			i=$(expr $i + 1)

			# Description
			create_pipeline_block_cmd="$create_pipeline_block_cmd'${pipeline_params[$i]}',";
			i=$(expr $i + 1)

			# Required
			create_pipeline_block_cmd="$create_pipeline_block_cmd${pipeline_params[$i]},";
			i=$(expr $i + 1)

			# Default Value
			create_pipeline_block_cmd="$create_pipeline_block_cmd'${pipeline_params[$i]}',";
			i=$(expr $i + 1)

			# Param Type
			create_pipeline_block_cmd="$create_pipeline_block_cmd\"{\\\"type\\\": \\\"${pipeline_params[$i]}\\\"}\"";
			i=$(expr $i + 1)
		done
	fi

	create_pipeline_block_cmd=" $create_pipeline_block_cmd -s $SERVER";
	echo "Review the command before proceeding";
	echo $create_pipeline_block_cmd;

	echo "Execute command (y/n)?"
	read execute;
	if [ $execute == 'y' ]; then
		pushd $C_EIGHT_TOOL;
		eval $create_pipeline_block_cmd;
		popd
	fi
}

edit_block () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master block update $1 --script=@$BLOCK_BUILD_PATH/$2 -s $3
	popd
}

view_blocks () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master block get -o TODO:OWNER > blocks.txt && vi blocks.txt
	popd
}

add_pipeline () {
	SERVER=$1;
	echo "Enter the name of the Mill this KPI is for (lowercase):"
	read millpath;

	# echo "Enter the Human Readable Name of this Pipeline:";
	# read pipeline_full_name;

	echo "Enter the internal name of the pipeline (hypen-case):"
	read pipeline_name;

	# echo "Path to a file describing this pipeline (relative to $PIPELINE_SRC_PATH/$millpath/):"
	# read pipeline_description;

	# echo "Path to a file describing the formula driving the calculations of this pipeline (relative to $PIPELINE_SRC_PATH/$millpath/):"
	# read pipeline_formula;

	echo "Enter the path to the script file (relative to $PIPELINE_BUILD_PATH/$millpath/):";
	read pipeline_script;

	# echo "Enter a Source Type (... which is apparently a thing)":
	# read pipeline_source_type;

	# echo "Enter a Data Type (... which is apparently another thing)":
	# read pipeline_data_type;

	if [ $SERVER == '' ]; then
		echo "Enter the server to add this pipeline to:";
		read SERVER
	fi

	add_pipline_cmd="./c8 tps master pipeline create '$pipeline_name'";
	# add_pipline_cmd="$add_pipline_cmd --full-name '$pipeline_full_name'";
	# add_pipline_cmd="$add_pipline_cmd --description @$PIPELINE_SRC_PATH/$millpath/$pipeline_description";
	# add_pipline_cmd="$add_pipline_cmd --formula @$PIPELINE_SRC_PATH/$millpath/$pipeline_formula";
	add_pipline_cmd="$add_pipline_cmd --script @$PIPELINE_BUILD_PATH/$millpath/$pipeline_script";
	add_pipline_cmd="$add_pipline_cmd --owner TODO:OWNER";
	add_pipline_cmd="$add_pipline_cmd -s $SERVER";


	echo "Review the command before proceeding";
	echo $add_pipline_cmd;

	echo "Execute command (y/n)?"
	read execute;
	if [ $execute == 'y' ]; then
		pushd $C_EIGHT_TOOL;
		eval $add_pipline_cmd;
		popd
	fi

}

stop_pipeline () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master pipeline stop $1 -s $2
	popd
}

start_pipeline () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master pipeline run $1 -s $2
	popd
}

start_clean_pipeline () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master pipeline run $1 -s $2
	popd
}


edit_pipeline () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master pipeline update $1 --script=@$PIPELINE_BUILD_PATH/$2 -s $3
	popd
}

view_pipelines () {
	pushd $C_EIGHT_TOOL;
	./c8 tps master pipeline get -s ops.forestry.cumul8.com:30291 -o TODO:OWNER > pipelines.txt && vi pipelines.txt
	popd
}

tpsw () {
	pushd $TPS_WORKER_PATH;
	./tpsworker exec file ./../etc/tpsworker.toml -s $PIPELINE_BUILD_PATH/$1 --clean -l > debug.log
	cat debug.log
	popd
}
