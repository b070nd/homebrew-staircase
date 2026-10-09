# homebrew-staircase

Homebrew tap for [stAirCase](https://github.com/b070nd/stAirCase): the enforcement gate between AI agent plans and your codebase.

## Install

```bash
brew install b070nd/staircase/staircase
staircase version
```

Upgrade with `brew update && brew upgrade b070nd/staircase/staircase`.

v1.0.0 was rebuilt on 2026-10-09 (see the [changelog](https://github.com/b070nd/stAirCase/blob/master/CHANGELOG.md)). If you installed it
before then, run `brew update` and `brew reinstall b070nd/staircase/staircase`.

## What the formula installs

The release archive for your platform from [stAirCase's releases](https://github.com/b070nd/stAirCase/releases), checked against the
SHA-256 written in the formula, and the shell completions. Nothing else: there is no post-install step and no other download.

## Check a release yourself

Each release is signed and has a build attestation. `packaging/verify-release.sh vX.Y.Z` in the main repository checks the archive's
checksum, the signature of the checksums and the attestation, without signing in to GitHub.

## About this repository

The formula is generated for each release by `packaging/homebrew-formula.sh` in the main repository, from that release's signed
`checksums.txt`. Pull requests are not accepted here. Report problems with stAirCase in the
[main repository's issues](https://github.com/b070nd/stAirCase/issues).
