#
# init LS_COLORS with vivid
#
command -v vivid &>/dev/null || return 0

export LS_COLORS=$(vivid generate ${ZSH_THEME:-rose-pine})
