{ pkgs, inputs, system, ... }: {
  environment.systemPackages = [ inputs.zen.packages.${system}.twilight ];
}
