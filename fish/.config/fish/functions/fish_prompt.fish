# vim:ft=fish ts=2 sw=2 sts=2

set -g segment_separator \ue0b6
set -g right_segment_separator \ue0b4


# ===========================
# Segments functions
# ===========================

function prompt_segment -d "Function to draw a segment"
  set -l bg
  set -l fg
  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end
  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end

  set -l sep_col (set_color $bg)
  set -l txt_col (set_color $fg -b $bg)
  set -l normal (set_color normal)

  set -l lsep $sep_col $segment_separator
  set -l rsep $sep_col $right_segment_separator

  if [ -n "$argv[3]" ]
    set -l data  $txt_col $argv[3] $normal
    echo -n -s $lsep $data $rsep
  end
end

function fish_prompt
  if not set -q -g __fish_arrow_functions_defined

    set -g __fish_arrow_functions_defined

    function _git_branch_name
        set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
        if set -q branch[1]
            echo (string replace -r '^refs/heads/' '' $branch)
        else
            echo (git rev-parse --short HEAD 2>/dev/null)
        end
    end

    function _is_git_dirty
        not command git diff-index --cached --quiet HEAD -- &>/dev/null
        or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
    end

    function _is_git_repo
        type -q git
        or return 1
        git rev-parse --git-dir >/dev/null 2>&1
    end

    function _hg_branch_name
        echo (hg branch 2>/dev/null)
    end

    function _is_hg_dirty
        set -l stat (hg status -mard 2>/dev/null)
        test -n "$stat"
    end

    function _is_hg_repo
        fish_print_hg_root >/dev/null
    end

    function _repo_branch_name
        _$argv[1]_branch_name
    end

    function _is_repo_dirty
        _is_$argv[1]_dirty
    end

    function _repo_type
        if _is_hg_repo
            echo hg
            return 0
        else if _is_git_repo
            echo git
            return 0
        end
        return 1
    end
  end

  set -l yellow (set_color -o bryellow)
  set -l normal (set_color normal)

  set -l cur_dir $(basename (prompt_pwd))

  set -l repo_info
  set -l sts "  "
  if set -l repo_type (_repo_type)
    set -l repo_branch (_repo_branch_name $repo_type)
    set repo_info "  $repo_branch"

    if _is_repo_dirty $repo_type
        set sts "$yellow  $normal"
    end
  end


  if set -q biscuit_show_branch_name
    set prompt "$cur_dir$repo_info"
  else
    set prompt $cur_dir
  end

  switch $fish_bind_mode
    case default
      set -l color
      prompt_segment brred black $prompt
    case insert
      prompt_segment brgreen black $prompt
    case visual
      prompt_segment bryellow black $prompt
    case replace_one
      prompt_segment brblue black $prompt
    case '*'
      prompt_segment brmagenta black $prompt
  end

  echo -n $sts
end
