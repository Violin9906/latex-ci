# latex-ci
LaTeX CI environment

## Example

### Gitlab

```yaml
image: violinwang/latex-ci:release-2020.1

stages:
  - deploy

expose:
  stage: deploy
  script:
  - xelatex -synctex=1 -interaction=nonstopmode -file-line-error YOUR_FILE_NAME
  - bibtex YOUR_FILE_NAME
  - xelatex -synctex=1 -interaction=nonstopmode -file-line-error YOUR_FILE_NAME
  - xelatex -synctex=1 -interaction=nonstopmode -file-line-error YOUR_FILE_NAME
  artifacts:
    paths:
    - YOUR_FILE_NAME.pdf
```