#!/bin/bash

# A script to prepend a confidence-based instruction to a prompt for Gemini.

# --- Configuration ---
PROMPT_LOW="Answer only if you are >50% confident. Mistakes are penalized 1 point, correct answers receive 1 point, and an answer of 'I don't know' receives 0 points."
PROMPT_MODERATE="Answer only if you are >75% confident. Mistakes are penalized 3 points, correct answers receive 1 point, and an answer of 'I don't know' receives 0 points."
PROMPT_HIGH="Answer only if you are >90% confident. Mistakes are penalized 9 points, correct answers receive 1 point, and an answer of 'I don't know' receives 0 points."

# --- Functions ---
show_usage() {
    echo "Usage: ./be_confident.sh [low|moderate|high] "Your question here""
    echo "Example: ./be_confident.sh moderate "What is the main idea of the paper 'Why Language Models Hallucinate'?""
}

# --- Main Logic ---
if [ "$#" -ne 2 ]; then
    show_usage
    exit 1
fi

LEVEL=$1
QUESTION=$2
PROMPT_PREFIX=""

case "$LEVEL" in
    low)
        PROMPT_PREFIX="$PROMPT_LOW"
        ;;
    moderate)
        PROMPT_PREFIX="$PROMPT_MODERATE"
        ;;
    high)
        PROMPT_PREFIX="$PROMPT_HIGH"
        ;;
    *)
        echo "Error: Invalid confidence level '$LEVEL'."
        show_usage
        exit 1
        ;;
esac

# Output the final combined prompt
echo "${PROMPT_PREFIX}

${QUESTION}"
