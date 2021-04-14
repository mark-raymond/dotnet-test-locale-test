# dotnet-test-locale-test

Tests running `dotnet vstest` under different locales.

Run `./test.sh LOCALE` to build a Docker image with locale set to LOCALE, and run `dotnet vstest` in a container using that Docker image.
