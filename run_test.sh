#!/usr/bin/env bash

source $1
mkdir -p $vocab_dir

#system variables
#PYTHON_EXEC="~/anaconda2/bin/python"
#data processing..

python_path=`which python`

echo "Testing"


# 20799
# 20999
# 21999
# 22999


DIR="/home/malcolm/dev/oss/rajarshd/TextKBQA/expt_outputs/demo_run/2017.06.23-09.11.01"

cmd="$python_path -u $ROOT_DIR/code/train.py \
--train_file $test_file \
--dev_file $dev_file \
--kb_file $kb_file \
--text_kb_file $text_kb_file \
--vocab_dir $vocab_dir \
--max_facts $max_facts \
--min_facts $min_facts \
--max_text_facts $max_text_facts \
--dev_max_facts $dev_max_facts \
--dev_max_text_facts $dev_max_text_facts
--entity_vocab_size $entity_vocab_size \
--relation_vocab_size $relation_vocab_size \
--learning_rate $learning_rate \
--verbose $verbose \
--embedding_dim $embedding_dim \
--grad_clip_norm $grad_clip_norm \
--hops $hops \
--dev_batch_size $dev_batch_size \
--batch_size $batch_size \
--output_dir $OUTPUT_DIR \
--load_model 1 \
--model_path $DIR/max_dev_out.ckpt_20999 \
--load_pretrained_vectors $load_pretrained_vectors \
--pretrained_vector_path $pretrained_vector_path \
--save_counter $save_counter \
--dev_eval_counter $dev_eval_counter
--use_kb $use_kb \
--use_text $use_text \
--print_attention_weights $print_attention_weights \
--mode test \
--combine_text_kb_answer $combine_text_kb_answer \
--separate_key_lstm $separate_key_lstm"

# --model_path $DIR/max_dev_out.ckpt_20999.meta \
# --model_path $DIR/max_dev_out.ckpt_20999.data-00000-of-00001 \
#--attn_file $DIR/attn_wts.npy 

echo "Executing $cmd"
CUDA_VISIBLE_DEVICES=$gpu_id $cmd
