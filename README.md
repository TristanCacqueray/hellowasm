# hellowasm

A purescript wasm playground:

- [main.c](main.c) : c library
- [Main.js](Main.js) : commonjs binding
- [Main.purs](Main.purs) : purescript binding
- [main.html](main.html) : browser usage

## Build C code with emscripten

```
$ export EM_CACHE=$(pwd)/_build
$ emcc -s WASM_ASYNC_COMPILATION=0 -s EXPORTED_RUNTIME_METHODS='["ccall"]' -s EXPORTED_FUNCTIONS="['_add_int', '_version']" main.c -o main.js
```

## Run Purescript binding

```
$ spago run
addInt: 42
version: 0.1.0
```

## Run in browser

```
$ python3 -m http.server 8080
$ firefox http://localhost:8080/main.html
```
