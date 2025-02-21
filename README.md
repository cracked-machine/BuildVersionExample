This example shows how to import an environment variable into your C++ code.

1. The BUILD_VERSION variable is defined and is exported to the environment. ([.vscode/tasks.json](.vscode/tasks.json)).
2. The BUILD_VERSION environment variable is passed into cmake as a cmake cache entry "-D". ([.vscode/tasks.json](.vscode/tasks.json))
3. The BUILD_VERSION cache entry is passed into the gcc as a compiler definition. ([src/CMakeLists.txt](src/CMakeLists.txt))
4. The definition is "stringified" using a proprocessor macro and assigned to `version` variable. ([inc/build_version.hpp](inc/build_version.hpp))

For CI pipeline, the BUILD_VERSION variable should be exported in the .yaml script in step 1.

Note: a preprocessor guard is used to check if the compile definition is defined and abort the compilation if not defined. For example, if you comment out the `export` command in [.vscode/tasks.json](.vscode/tasks.json) or the `target_compile_definitions` command in [src/CMakeLists.txt](src/CMakeLists.txt) the application will no longer compile. This ensures that the application is not built with an empty build version string.

----

If you get the following error:

```
AddressSanitizer:DEADLYSIGNAL
Segmentation fault (core dumped)
```

you should disable `address space layout randomization`:

```
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
```
