# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.sudo
    pkgs.neofetch
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "ms-python.python"
      "esbenp.prettier-vscode"
      "ms-python.debugpy"
      "usernamehw.errorlens"
      "zhuangtongfa.material-theme"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        create-venv = ''
          python -m venv .venv
          source .venv/bin/activate
          pip install -r requirements.txt
          chmod +x ./bin/get_public_ip.sh
          bin/get_public_ip.sh
        '';
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      # previews = {
      #   web = {
      #     command = ["./devserver.sh"];
      #     env = {
      #       PORT = "$PORT";
      #     };
      #     manager = "web";
      #   };
      # };
    };
  };
}
