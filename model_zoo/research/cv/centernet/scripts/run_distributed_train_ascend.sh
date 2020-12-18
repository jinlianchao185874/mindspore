#!/bin/bash
# Copyright 2020 Huawei Technologies Co., Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================

echo "=============================================================================================================="
echo "Please run the scipt as: "
echo "bash run_distributed_train_ascend.sh DATA_DIR MINDRECORD_DIR RANK_TABLE_FILE"
echo "for example: bash run_distributed_train_ascend.sh /path/dataset /path/mindrecord /path/hccl.json"
echo "It is better to use absolute path."
echo "For hyper parameter, please note that you should customize the scripts:
          '{CUR_DIR}/scripts/ascend_distributed_launcher/hyper_parameter_config.ini' "
echo "=============================================================================================================="
CUR_DIR=`pwd`

python ${CUR_DIR}/scripts/ascend_distributed_launcher/get_distribute_train_cmd.py \
    --run_script_dir=${CUR_DIR}/train.py \
    --hyper_parameter_config_dir=${CUR_DIR}/scripts/ascend_distributed_launcher/hyper_parameter_config.ini \
    --data_dir=$1 \
    --mindrecord_dir=$2 \
    --hccl_config_dir=$3 \
    --hccl_time_out=1200 \
    --cmd_file=distributed_cmd.sh

bash distributed_cmd.sh
