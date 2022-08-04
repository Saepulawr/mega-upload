# Upload file to Mega [modified from Siege-Wizard/mega-upload]

This GitHub action allows you to upload a file to Mega.

## Usage

```yml
- name: Upload filename to mega.zn
  uses: Saepulawr/mega-upload@1.0.0
  env:
    USERNAME: ${{ secrets.MEGA_USERNAME }}
    PASSWORD: ${{ secrets.MEGA_PASSWORD }}
    UPLOADPATH: "build/file.txt"
```

**Environmetal variables:**

- `USERNAME`: Mega username, should be provided from a secret.
- `PASSWORD`: Mega password, should be provided from a secret.
- `UPLOADPATH`: Mega upload path. ex: "build/file.txt"
### Outputs

- Url uploaded file saved to file output-export.logs
