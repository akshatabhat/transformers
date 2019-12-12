#!/bin/sh
#SBATCH --job-name=BERT_FT
#SBATCH --output=slurm_out/job_output-%j.txt
#SBATCH --mail-user=rohit.sharma@euler.wacc.wisc.edu
#SBATCH --time=1-12:00:00
#SBATCH --gres=gpu:titanrtx:1

module load cuda/9.0 groupmods/cudnn/9.2

nvidia-smi
export SQUAD_DIR="/srv/home/rohit.sharma/dev/git/aks/transformers/data"
echo "Starting job at:"
date

time python3 examples/run_squad_cache1.py \
  --model_type bert \
  --model_name_or_path bert-base-cased \
  --do_train \
  --do_eval \
  --do_lower_case \
  --train_file $SQUAD_DIR/train-v1.1.json \
  --predict_file $SQUAD_DIR/dev-v1.1.json \
  --per_gpu_train_batch_size 12 \
  --learning_rate 3e-5 \
  --num_train_epochs 2.0 \
  --max_seq_length 384 \
  --doc_stride 128 \
  --overwrite_output_dir \
  --save_steps 0 \
  --output_dir /tmp/debug_squad/ > results/squad_cache1.out

echo "Job completed at:"
date
