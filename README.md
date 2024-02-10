__In all cases, if you open the file in VSCode without thinking, it will usually work.__

* `tree_extract.sh` restores each commit from objects. ~~Unfortunately, it cannot restore a tree.~~

* If you are using the DotGit browser extension, you can restore the branch with the following command
```
git checkout .
```

* If you only have a `.git\objects\packs\pack-***-.pack`, do the following command first
```
git unpack-objects < pack-***-.pack
```



