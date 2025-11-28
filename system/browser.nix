{ pkgs, inputs, ... }: {
  environment.systemPackages = [ inputs.zen.packages.${pkgs.system}.twilight ];
}
