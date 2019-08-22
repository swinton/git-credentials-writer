# Git Credentials Writer for GitHub Actions

This action facilitates Git-based deployments over HTTP protocols (for example, to Heroku) by configuring [Git's credential helper](https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage) to `store` URLs. The action exposes a method for adding URL-based credentials to that store. Credentials are stored as a plain-text file on disk, and they never expire.

## Usage

For example, here is a workflow that sets up credentials, enabling a subsequent `git push` to some imaginary host, `githost`.

```workflow
action "Credentials" {
  uses = "actions/git-credentials-writer"
  secrets = ["CREDENTIAL_URL_USERNAME", "CREDENTIAL_URL_PASSWORD"]
  env = {
    CREDENTIAL_URL_HOST = "githost"
  }
}
```

### Secrets

- `CREDENTIAL_URL_USERNAME` - **Required** The _username_ to be associated with the credential URL
- `CREDENTIAL_URL_PASSWORD` - **Required** The _password_ to be associated with the credential URL

### Environment variables

- `CREDENTIAL_URL_HOST` - **Required** The _host_ of the credential URL
- `CREDENTIAL_URL_PROTOCOL` - **Optional** The _protocol_ of the credential URL. Defaults to `https`
- `CREDENTIAL_URL_PATH` - **Optional** The _path_ of the credential URL. Defaults to an empty string
- `CREDENTIAL_REMOTE_NAME` - **Optional** The _name_ of the associated remote. If set, will be written via `git remote add`
