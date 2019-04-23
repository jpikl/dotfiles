# Based on https://github.com/arialdomartini/oh-my-git
# shellcheck shell=bash

__is_a_git_repo_symbol=''
__has_untracked_files_symbol=''
__has_adds_symbol=''
__has_deletions_symbol=''
__has_cached_deletions_symbol=''
__has_modifications_symbol=''
__has_cached_modifications_symbol=''
__ready_to_commit_symbol=''
__is_on_a_tag_symbol=''
__detached_symbol=''
__can_fast_forward_symbol=''
__has_diverged_symbol=''
__not_tracked_branch_symbol=''
__rebase_tracking_branch_symbol=''
__merge_tracking_branch_symbol=''
__should_push_symbol=''
__has_stashes_symbol=''
__host_symbol=''
__user_symbol=''
__current_working_dir_symbol=''
__separator_symbol=''
__default_color_on='\[\033[1;37m\]'
__default_color_off='\[\033[0m\]'

function __enrich() {
    local flag=$1
    local symbol=$2
    local color_on=${3:-$__default_color_on}

    if [[ $flag == true ]]; then
        local color=$color_on
    else
        local color=$__default_color_off
    fi

    echo -n "${prompt}${color}${symbol}${reset} "
}

function __enrich_append() {
    local flag=$1
    local symbol=$2
    local color=${3:-$__default_color_on}
    if [[ $flag == false ]]; then symbol=' '; fi

    echo -n "${color}${symbol}  "
}

function __get_current_action() {
    local -r info="$(git rev-parse --git-dir 2>/dev/null)"
    if [[ -n "$info" ]]; then
        local action
        if [[ -f "$info/rebase-merge/interactive" ]]; then
            action=${is_rebasing_interactively:-"rebase -i"}
        elif [[ -d "$info/rebase-merge" ]]; then
            action=${is_rebasing_merge:-"rebase -m"}
        else
            if [[ -d "$info/rebase-apply" ]]; then
                if [[ -f "$info/rebase-apply/rebasing" ]]; then
                    action=${is_rebasing:-"rebase"}
                elif [[ -f "$info/rebase-apply/applying" ]]; then
                    action=${is_applying_mailbox_patches:-"am"}
                else
                    action=${is_rebasing_mailbox_patches:-"am/rebase"}
                fi
            elif [[ -f "$info/MERGE_HEAD" ]]; then
                action=${is_merging:-"merge"}
            elif [[ -f "$info/CHERRY_PICK_HEAD" ]]; then
                action=${is_cherry_picking:-"cherry-pick"}
            elif [[ -f "$info/BISECT_LOG" ]]; then
                action=${is_bisecting:-"bisect"}
            fi
        fi
        if [[ -n $action ]]; then
            printf "%s" "$action";
        fi
    fi
}

function __build_prompt() {
    local enabled=true
    local prompt=""

    # Git info
    if [[ $PROMPT_GIT_ENABLED == true ]]; then
        local -r current_commit_hash=$(git rev-parse HEAD 2> /dev/null)
        if [[ -n $current_commit_hash ]]; then local -r is_a_git_repo=true; fi
    else
        local -r is_a_git_repo=false
    fi

    if [[ $is_a_git_repo == true ]]; then
        local -r current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
        if [[ $current_branch == 'HEAD' ]]; then local detached=true; fi

        local -r number_of_logs="$(git log --pretty=oneline -n1 2> /dev/null | wc -l)"
        if [[ $number_of_logs -eq 0 ]]; then
            local just_init=true
        else
            local -r upstream=$(git rev-parse --symbolic-full-name --abbrev-ref "@{upstream}" 2> /dev/null)
            if [[ -n "${upstream}" && "${upstream}" != "@{upstream}" ]]; then local has_upstream=true; fi

            local -r git_status="$(git status --porcelain 2> /dev/null)"
            local -r action="$(__get_current_action)"

            if [[ $git_status =~ ($'\n'|^).M ]]; then local has_modifications=true; fi
            if [[ $git_status =~ ($'\n'|^)M ]]; then local has_modifications_cached=true; fi
            if [[ $git_status =~ ($'\n'|^)A ]]; then local has_adds=true; fi
            if [[ $git_status =~ ($'\n'|^).D ]]; then local has_deletions=true; fi
            if [[ $git_status =~ ($'\n'|^)D ]]; then local has_deletions_cached=true; fi
            if [[ $git_status =~ ($'\n'|^)[MAD] && ! $git_status =~ ($'\n'|^).[MAD\?] ]]; then local ready_to_commit=true; fi

            local -r number_of_untracked_files=$(grep -c "^??" <<< "${git_status}")
            if [[ $number_of_untracked_files -gt 0 ]]; then local has_untracked_files=true; fi

            local -r tag_at_current_commit=$(git describe --exact-match --tags "$current_commit_hash" 2> /dev/null)
            if [[ -n $tag_at_current_commit ]]; then local is_on_a_tag=true; fi

            if [[ $has_upstream == true ]]; then
                local -r commits_diff="$(git log --pretty=oneline --topo-order --left-right "${current_commit_hash}"..."${upstream}" 2> /dev/null)"
                local -r commits_ahead=$(grep -c "^<" <<< "$commits_diff")
                local -r commits_behind=$(grep -c "^>" <<< "$commits_diff")
            fi

            if [[ $commits_ahead -gt 0 && $commits_behind -gt 0 ]]; then local has_diverged=true; fi
            if [[ $has_diverged == false && $commits_ahead -gt 0 ]]; then local should_push=true; fi

            local -r will_rebase=$(git config --get branch."${current_branch}".rebase 2> /dev/null)

            local -r number_of_stashes="$(git stash list -n1 2> /dev/null | wc -l)"
            if [[ $number_of_stashes -gt 0 ]]; then local has_stashes=true; fi
        fi
    fi

    __custom_build_prompt ${enabled:-true} "${current_commit_hash:-""}" ${is_a_git_repo:-false} "${current_branch:-""}" ${detached:-false} ${just_init:-false} ${has_upstream:-false} ${has_modifications:-false} ${has_modifications_cached:-false} ${has_adds:-false} ${has_deletions:-false} ${has_deletions_cached:-false} ${has_untracked_files:-false} ${ready_to_commit:-false} "${tag_at_current_commit:-""}" ${is_on_a_tag:-false} "${commits_ahead:-false}" "${commits_behind:-false}" ${has_diverged:-false} ${should_push:-false} "${will_rebase:-false}" ${has_stashes:-false} "${action}"
}

function __custom_build_prompt() {
    local enabled=${1}
    local current_commit_hash=${2}
    local is_a_git_repo=${3}
    local current_branch=$4
    local detached=${5}
    local just_init=${6}
    local has_upstream=${7}
    local has_modifications=${8}
    local has_modifications_cached=${9}
    local has_adds=${10}
    local has_deletions=${11}
    local has_deletions_cached=${12}
    local has_untracked_files=${13}
    local ready_to_commit=${14}
    local tag_at_current_commit=${15}
    local is_on_a_tag=${16}
    local commits_ahead=${17}
    local commits_behind=${18}
    local has_diverged=${19}
    local should_push=${20}
    local will_rebase=${21}
    local has_stashes=${22}

    # Reset
    local reset='\e[0m'

    # Foreground
    local black='\e[0;30m'
    local red='\e[0;31m'
    local green='\e[0;32m'
    local yellow='\e[0;33m'
    local blue='\e[0;34m'
    local purple='\e[0;35m'
    local white='\e[0;37m'

    # Background
    local background_red='\e[41m'
    local background_green='\e[42m'
    local background_blue='\e[44m'
    local background_purple='\e[45m'
    local background_white='\e[47m'
    local background_white='\e[47m'

    # Forground on background
    local black_on_white="${black}${background_white}"
    local yellow_on_white="${yellow}${background_white}"
    local red_on_white="${red}${background_white}"
    local black_on_red="${black}${background_red}"
    local white_on_red="${white}${background_red}"
    local black_on_purple="${black}${background_purple}"
    local purple_on_green="${purple}${background_green}"
    local black_on_green="${black}${background_green}"
    local green_on_blue="${green}${background_blue}"
    local black_on_blue="${black}${background_blue}"
    local blue_on_white="${blue}${background_white}"

    # Flags
    local __default_color_on="${black_on_white}"

    # Prompt
    local prompt="${black_on_purple} ${__host_symbol} \\h "
    prompt+="${purple_on_green}${__separator_symbol}${black_on_green} ${__user_symbol} \\u "
    prompt+="${green_on_blue}${__separator_symbol}${black_on_blue} ${__current_working_dir_symbol} \\w "

    if [[ $is_a_git_repo == true ]]; then
        # on filesystem
        prompt+="${blue_on_white}${__separator_symbol}${black_on_white} "
        prompt+=$(__enrich_append "$is_a_git_repo" $__is_a_git_repo_symbol "${black_on_white}")
        prompt+=$(__enrich_append "$has_stashes" $__has_stashes_symbol "${yellow_on_white}")

        prompt+=$(__enrich_append "$has_untracked_files" $__has_untracked_files_symbol "${red_on_white}")
        prompt+=$(__enrich_append "$has_modifications" $__has_modifications_symbol "${red_on_white}")
        prompt+=$(__enrich_append "$has_deletions" $__has_deletions_symbol "${red_on_white}")

        # ready
        prompt+=$(__enrich_append "$has_adds" $__has_adds_symbol "${black_on_white}")
        prompt+=$(__enrich_append "$has_modifications_cached" $__has_cached_modifications_symbol "${black_on_white}")
        prompt+=$(__enrich_append "$has_deletions_cached" $__has_cached_deletions_symbol "${black_on_white}")

        # next operation

        prompt+=$(__enrich_append "$ready_to_commit" $__ready_to_commit_symbol "${red_on_white}")

        # where

        prompt="${prompt} ${white_on_red}${__separator_symbol} ${black_on_red}"
        if [[ $detached == true ]]; then
            prompt+=$(__enrich_append "$detached" $__detached_symbol "${white_on_red}")
            prompt+=$(__enrich_append "$detached" "(${current_commit_hash:0:7})" "${black_on_red}")
        else
            if [[ $has_upstream == false ]]; then
                prompt+=$(__enrich_append true "-- ${__not_tracked_branch_symbol}  --  (${current_branch})" "${black_on_red}")
            else
                if [[ $will_rebase == true ]]; then
                    local type_of_upstream=$__rebase_tracking_branch_symbol
                else
                    local type_of_upstream=$__merge_tracking_branch_symbol
                fi

                if [[ $has_diverged == true ]]; then
                    prompt+=$(__enrich_append true "-${commits_behind} ${__has_diverged_symbol} +${commits_ahead}" "${white_on_red}")
                else
                    if [[ $commits_behind -gt 0 ]]; then
                        prompt+=$(__enrich_append true "-${commits_behind} ${white_on_red}${__can_fast_forward_symbol}${black_on_red} --" "${black_on_red}")
                    fi
                    if [[ $commits_ahead -gt 0 ]]; then
                        prompt+=$(__enrich_append true "-- ${white_on_red}${__should_push_symbol}${black_on_red}  +${commits_ahead}" "${black_on_red}")
                    fi
                    if [[ $commits_ahead == 0 && $commits_behind == 0 ]]; then
                        prompt+=$(__enrich_append true " --   -- " "${black_on_red}")
                    fi

                fi
                prompt+=$(__enrich_append true "(${current_branch} ${type_of_upstream} ${upstream//\/$current_branch/})" "${black_on_red}")
            fi
        fi
        prompt+=$(__enrich_append "${is_on_a_tag}" "${__is_on_a_tag_symbol} ${tag_at_current_commit}" "${black_on_red}")
        prompt+="${red}${__separator_symbol}"
    else
        prompt+="${blue}${__separator_symbol}"
    fi

    prompt+="\\n${purple}$ ${reset}"

    echo "${prompt}"
}

function __bash_prompt() {
    PS1="$(__build_prompt)"
}

PROMPT_COMMAND="__bash_prompt"
PS2="${yellow}→${reset} "
