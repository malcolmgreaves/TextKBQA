#!/usr/bin/env bash

source $1
mkdir -p $vocab_dir

#system variables
#PYTHON_EXEC="~/anaconda2/bin/python"
#data processing..

python_path=`which python`

MODEL_DIR="/home/malcolm/dev/oss/rajarshd/TextKBQA/expt_outputs/demo_run/2017.06.23-09.11.01"


cmd="$python_path -u $ROOT_DIR/code/qual_eval.py \
--use_kb $use_kb \
--use_text $use_text \
--kb_file $kb_file \
--text_kb_file $text_kb_file \
--attn_file $MODEL_DIR/attn_wts.npy \
--input_test_file $test_file
--answer_file ./expt_outputs/demo_run/2017.06.25-16.38.31/out_txt.0.102 \
--output_dir $OUTPUT_DIR \
--vocab_dir $vocab_dir" 

echo "Executing $cmd"
CUDA_VISIBLE_DEVICES=$gpu_id $cmd
