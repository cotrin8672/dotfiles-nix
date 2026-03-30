{ pkgs, ... }:

{
  home.packages = [
    pkgs.gwq
  ];

  xdg.configFile."gwq/config.toml".text = ''
    [worktree]
    basedir = "~/ghq"
    auto_mkdir = true

    [naming]
    template = "{{.Host}}/{{.Owner}}/{{.Repository}}-{{.Branch}}"
    sanitize_chars = { "/" = "-", ":" = "-" }
  '';
}
