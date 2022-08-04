# Upload file to Mega

This GitHub action allows you to upload a file to Mega.

## Usage

```yml
- name: Upload README.md
  uses: Siege-Wizard/mega-upload@1.0.0
  env:
    USERNAME: ${{ secrets.MEGA_USERNAME }}
    PASSWORD: ${{ secrets.MEGA_PASSWORD }}
```

**Environmetal variables:**

- `USERNAME`: Mega username, should be provided from a secret.
- `PASSWORD`: Mega password, should be provided from a secret.
### Outputs

- `url`: Url of the uploaded file.
