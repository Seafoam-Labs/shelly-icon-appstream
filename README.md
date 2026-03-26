# shelly-icon-appstream

### 1. Add a name to the manifest.json with corresponding entries we require at least 1 entry per item ex:
```
 "gimp":[
    "src/48x48/gimp.png",
    "src/128x128/gimp.png",
    "src/64x64/gimp.png"
  ],
```

These entires can duplicated an existing entry. So lets say the VLC image already exists but we want to tie an image to vlc-cli we can just add and entry for it like:
```
"vlc-cli":[
    "src/128x128/vlc.png",
  ],
```
This will link it to the vlc icon.

### 2. Add the image to the src folder corresponding to its size, we prefer all 3 if possible but at least one must be added.
   ```
   src/48x48
   src/64x64
   src/129x128
   ```

### 3. Open a PR into shelly appstream

