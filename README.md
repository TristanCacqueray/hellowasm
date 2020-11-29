# hellowasm

A purescript wasm playground:

- [main.c](main.c) : c library
- [loader.js](loader.js) : the emscripten loader adapted to work synchronously
- [Main.js](Main.js) : commonjs binding
- [Main.purs](Main.purs) : purescript binding

## Build C code with emscripten

```
$ export EM_CACHE=$(pwd)/_build
$ emcc -s WASM_ASYNC_COMPILATION=0 -s EXPORTED_RUNTIME_METHODS='["ccall"]' -s EXPORTED_FUNCTIONS="['_add_int', '_version']" main.c -o main.js
```

Patch the javascript interface `main.js` to run synchronously:

- Replace `var Module = typeof Module !== 'undefined' ? Module : {};` with `exports.init = function(Module) {`
- Add a `}` at the end

## Build Purescript binding

```
$ spago build
```

## Run in browser

```
$ parcel serve index.html
```
