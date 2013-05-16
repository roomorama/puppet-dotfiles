define dotfiles::update(
  $gituser,
  $homedir,
  $cwd,
  $single_pull,
  $rebase,
) {

  if (!$single_pull) {
    exec { "update ${gituser} dotfiles for ${title}":
      cwd     => "${cwd}",
      command => $rebase ? {true  => "git reset --hard HEAD && git pull --rebase", false => "git reset --hard HEAD && git pull", },
      user    => "${title}",
      require => Package['boxen/brews/git'],
    }
  }

}
