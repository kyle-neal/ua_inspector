defmodule UAInspector.Mixfile do
  use Mix.Project

  @url_github "https://github.com/elixytics/ua_inspector"

  def project do
    [ app:     :ua_inspector,
      name:    "UAInspector",
      version: "0.13.0",
      elixir:  "~> 1.2",
      deps:    deps(),

      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,

      preferred_cli_env: [
        coveralls:          :test,
        'coveralls.detail': :test,
        'coveralls.travis': :test,
        dialyze:            :test
      ],

      description:   "User agent parser library",
      docs:          docs(),
      package:       package(),
      test_coverage: [ tool: ExCoveralls ] ]
  end

  def application do
    [ applications: [ :lager, :hackney, :logger, :poolboy, :yamerl ],
      mod:          { UAInspector, [] } ]
  end

  defp deps do
    [ { :ex_doc, "== 0.15.0", only: :dev },

      { :dialyze,     "~> 0.2", only: :test },
      { :excoveralls, "~> 0.5", only: :test },

      { :hackney, "== 1.7.1" },
      { :poolboy, "== 1.5.1" },
      { :yamerl,  "== 0.4.0" } ]
  end

  defp docs do
    [ extras:     [ "CHANGELOG.md", "README.md" ],
      main:       "readme",
      source_ref: "v0.13.0",
      source_url: @url_github ]
  end

  defp package do
    %{ files:       [ "CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib" ],
       licenses:    [ "Apache 2.0" ],
       links:       %{ "GitHub" => @url_github },
       maintainers: [ "Marc Neudert" ] }
  end
end
