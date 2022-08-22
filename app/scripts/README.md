## Scripts Setup

#### Git Hooks

- Run the following command to make the `setup-hooks` script executable

```
chmod +x ./scripts/setup-hooks.sh
```

- Then run the `setup-hooks` script. This will setup the git hooks.

```
./scripts/setup-hooks.sh
```

## Development Scripts

These are the scripts that you will run manually during development.

#### Make sure you have run `flutter pub get` before running these commands.

If you get on Mac while running below scripts `zsh: permission denied:` run following command,

```sh
 chmod +x scripts/*.sh
```

#### Build Runner

Run the following command to trigger build for all generated dart files.

```sh
scripts/build-runner.sh
```

#### Generate All

This will generate all dart files. It basically runs build runner and generate classes

```sh
scripts/generate-all.sh
```

#### Run

Run the app on a device or an emulator.

```sh
scripts/run.sh [flavor] [--build-type]
```

- flavor: `dev, qa, prod`
- build-type: `debug, profile, release`. Defaults to `debug`. Example:

```sh
scripts/run.sh dev --debug
```

#### Build

```sh
scripts/build.sh [file-format] [flavor] [--build-type] [--additional-flag]
```

- file-format: `apk, appbundle, ios`.
- flavor: `dev, qa, prod`.
- build-type: `debug, profile, release`. Defaults to `debug`.
- additional-flag: Any addition flag to pass to the `flutter build` command. Defaults to no flag. Example:

```sh
scripts/build.sh ios prod --release --no-codesign
```

#### Device Preview

Runs the flutter app's dev flavor with the device preview package enabled. Device preview let's you test how an app will look on various devices, orientations, etc.

```sh
scripts/device-preview.sh
```

## Github Action Scripts

These scripts are used by github actions CI/CD.

#### Bump Build Number

Bumps the `versionCode/buildNumber` by 1 in `pubspec.yaml` file. For example, it will change `version: 1.2.5+12` to `version: 1.2.5+13`.

```sh
scripts/bump-build-number.sh
```

#### Set Current Version to ENV

Sets the current version from `pubspec.yaml` to the github actions environment variables.

```sh
scripts/gh-action-read-and-set-version-env.sh
```

#### Commit Version

Reads the version from `pubspec.yaml` and creates a commit with the message "Bump version to ( version)". Then push the change to the current branch.

```sh
scripts/commit-version.sh
```