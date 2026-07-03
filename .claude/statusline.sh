#!/bin/bash
input=$(cat)
MODEL=$(echo "$input" | jq -r '.model.display_name')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size')
USAGE=$(echo "$input" | jq '.context_window.current_usage')

if [ "$USAGE" != "null" ]; then
    CURRENT=$(echo "$USAGE" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens + .output_tokens')
    PERCENT=$((CURRENT * 100 / CONTEXT_SIZE))
    REMAINING=$((100 - PERCENT))
    echo "[$MODEL] Context: ${PERCENT}% used | ${REMAINING}% remaining"
else
    echo "[$MODEL] Context: Loading..."
fi
