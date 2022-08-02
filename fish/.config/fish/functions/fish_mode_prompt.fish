function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
    case insert
      set_color --bold green
    case visual
      set_color --bold yellow
    case '*'
      set_color --bold brmagenta
  end
  echo '  '
  set_color normal
end
