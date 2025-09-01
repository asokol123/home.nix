base_suggest_prompt=\
"You are currently running as a terminal command suggestion utility. "\
"You should output one to three lines of command suggestions which will "\
"most likely be sufficient to complete the task in the prompt. "\
"Output only the commands with no other text, no comments, "\
"only the raw commands to be executed, one per line. "\
"Your output will be piped into fzf to be displayed in a terminal UI, "\
"so it should not contain any unnecessary text. "\
"Do not execute any tools, do not change any files, you are only meant to suggest commands for the user. "\
"Suggest Unix-compatible commands for the following prompt:"

cursor-agent-suggest() {
    local suggest_input=$(echo -n "${BUFFER}" | tr '\n' ';')
    local suggest_prompt="$base_suggest_prompt $suggest_input"

    local suggest_result=$(
        cursor-agent --model opus-4.1 --print --output-format text "$suggest_prompt" |
        fzf --height 5 --layout reverse --disabled --query "$suggest_input"
    )

    if [[ $? -eq 0 && -n "$suggest_result" ]]; then
        print -s "$suggest_input"
        BUFFER="$suggest_result"
        CURSOR=$(echo "$suggest_result" | wc -m)
    fi

    zle reset-prompt
}

zle -N cursor-agent-suggest

for keymap in emacs viins vicmd; do
    bindkey -M "$keymap" '^S' cursor-agent-suggest
done
