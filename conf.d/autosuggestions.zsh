#
# Configure autosuggestions
#

# export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(
    match_prev_cmd
    completion
    history
)
