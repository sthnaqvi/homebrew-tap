# sthnaqvi/homebrew-tap

Homebrew formulae for my open-source tools.

```sh
brew tap sthnaqvi/tap
```

The tap name is `sthnaqvi/tap`; the repository is `homebrew-tap` because
Homebrew strips the `homebrew-` prefix when you tap it.

## Formulae

| Formula | What it is | Install |
| --- | --- | --- |
| [pidlens](Formula/pidlens.rb) | Everything macOS knows about a running process, in one readable report | `brew install sthnaqvi/tap/pidlens` |

Once tapped, the short form works too:

```sh
brew install pidlens
```

## Upgrading

```sh
brew update && brew upgrade pidlens
```

## Removing the tap

```sh
brew untap sthnaqvi/tap
```

## Adding a formula to this tap

1. Tag a release in the tool's own repository.
2. Generate the formula there (pidlens has `scripts/update-formula.sh`, which
   fills in the release tarball's `url` and `sha256`).
3. Copy it into `Formula/`, add a row to the table above, and push.
4. CI in this repository audits and installs every formula it can see.

Verify before pushing:

```sh
brew install --build-from-source ./Formula/<name>.rb
```

```sh
brew audit --strict --online sthnaqvi/tap/<name>
```

## Issues

Formula problems belong here. Problems with a tool itself belong in that tool's
repository — for pidlens that is
[sthnaqvi/pidlens](https://github.com/sthnaqvi/pidlens/issues).
