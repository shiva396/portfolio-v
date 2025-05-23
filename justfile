#!/usr/bin/env just --justfile
export PATH := "./node_modules/.bin:" + env_var('PATH')

# Generate JSON serializables for features
gen-feature_counter: (_generate-json "features/counter/feature_counter" "watch")

# Upgrade your Flutter and Dart packages
upgrade_pub_packages:
    melos exec -- flutter pub upgrade

# Upgrade your NPM packages
upgrade_npm_packages:
    pnpm upgrade --recursive

# Launch images and Icons
gen-launcher-icons:
    #!/usr/bin/env bash
    cd apps/
    flutter pub run flutter_launcher_icons

# Generate splash screen images
gen-splash-screen:
    #!/usr/bin/env bash
    cd apps/
    flutter pub run flutter_native_splash:create

# Generate JSON serializables for a package

_generate-json package command="build":
    #!/usr/bin/env bash
    echo "Building JSON-Serializable in {{package}}"
    cd {{package}}
    dart run build_runner {{command}} --delete-conflicting-outputs


