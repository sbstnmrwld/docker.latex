# docker.latex
a minimal latex environment for vscode's latex-workshop extension

### usage:

* pull docker image
```
docker pull sbstnmrwld/latex
```
* install extension ([link](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop))
```
code --install-extension James-Yu.latex-workshop
```
* add to settings
```
    "latex-workshop.docker.enabled": true,
    "latex-workshop.docker.image.latex": "sbstnmrwld/latex"
```
