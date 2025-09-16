# Confident-Prompt

A shell script to mitigate language model "hallucination" by instructing the model to answer only when it meets a specified confidence threshold.

This project is based on the principles discussed in the paper ["Why Language Models Hallucinate"](https://arxiv.org/abs/2409.05810) (Kalai et al., 2025), which proposes that explicitly stating confidence targets and penalties can lead to more trustworthy AI responses.

## The `be_confident.sh` Script

The script prepends a system prompt to your question, instructing an LLM like Gemini to adhere to a specific risk/reward model for its answers.

### Confidence Levels

-   **low**: `>50%` confidence. For creative tasks where mistakes are cheap.
-   **moderate**: `>75%` confidence. For factual research where mistakes are moderately costly.
-   **high**: `>90%` confidence. For critical questions where mistakes are heavily penalized.

## How to Use

1.  **Make the script executable:**
    ```bash
    chmod +x be_confident.sh
    ```

2.  **Run the script:**
    Pass the desired confidence level (`low`, `moderate`, `high`) and your question in quotes.

    ```bash
    ./be_confident.sh [level] "[Your question]"
    ```

    **Example:**
    ```bash
    ./be_confident.sh moderate "What is the core argument of the paper 'Why Language Models Hallucinate'?"
    ```

3.  **Use the Output:**
    The script will print the combined prompt to your terminal. You can then copy this and paste it into your session with Gemini or another LLM.

## Recommended: Create a Shell Alias

For a much smoother workflow, add an alias to your shell's configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or `~/.config/fish/config.fish`).

1.  Open your shell configuration file:
    ```bash
    # For bash
    nano ~/.bashrc

    # For zsh
    nano ~/.zshrc
    ```

2.  Add the following line, making sure the path to the script is correct:
    ```bash
    alias be_confident='/path/to/your/be_confident.sh'
    ```
    *(Replace `/path/to/your/` with the actual absolute path to the script.)*

3.  Reload your shell configuration:
    ```bash
    # For bash
    source ~/.bashrc

    # For zsh
    source ~/.zshrc
    ```

4.  Now you can use the command from anywhere:
    ```bash
    be_confident high "Is this medication safe to take with grapefruit?"
    ```
