#!/bin/bash

#!/bin/bash

# Minimal GPU stats
get_minimal_gpu_stats() {
    if ! command -v nvidia-smi &> /dev/null; then
        echo '{"text": "NVIDIA GPU not found", "class": "error"}'
        exit 1
    fi

    utilization=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -1)
    
    echo "{\"text\": \"${utilization}%\", \"class\": \"gpu-stats\"}"
}

get_minimal_gpu_stats
