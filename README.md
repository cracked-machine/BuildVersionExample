This example shows how to import an environment variable into your C++ code.

1. The BUILD_VERSION variable is defined and is exported to the environment. ([.vscode/tasks.json](https://github.com/cracked-machine/BuildVersionExample/blob/587bdddc7d62626731a2335f3e2f347ec0d7b4e6/.vscode/tasks.json#L15)).
2. The BUILD_VERSION environment variable is passed into cmake as a cmake cache entry "-D". ([.vscode/tasks.json](https://github.com/cracked-machine/BuildVersionExample/blob/587bdddc7d62626731a2335f3e2f347ec0d7b4e6/.vscode/tasks.json#L16))
3. The BUILD_VERSION cache entry is passed into the gcc as a compiler definition. ([src/CMakeLists.txt](https://github.com/cracked-machine/BuildVersionExample/blob/587bdddc7d62626731a2335f3e2f347ec0d7b4e6/src/CMakeLists.txt#L10))
4. The definition is "stringified" using a proprocessor macro and assigned to `version` variable. ([inc/build_version.hpp](https://github.com/cracked-machine/BuildVersionExample/blob/587bdddc7d62626731a2335f3e2f347ec0d7b4e6/inc/build_version.hpp#L7))

For CI pipeline, the BUILD_VERSION variable should be exported in a .yaml script in step 1 and 2.

Note: a [preprocessor guard](https://github.com/cracked-machine/BuildVersionExample/blob/587bdddc7d62626731a2335f3e2f347ec0d7b4e6/inc/build_version.hpp#L11) is used to check if the compile definition is defined and abort the compilation if not defined. For example, if you comment out the `export` command in [.vscode/tasks.json](.vscode/tasks.json) or the `target_compile_definitions` command in [src/CMakeLists.txt](src/CMakeLists.txt) the application will no longer compile. This ensures that the application is not built with an empty build version string.

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
