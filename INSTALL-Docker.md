# I. Install *I, Librarian* in *Docker*

All instructions are for *docker engine*.

## 1. Build *I, Librarian* image

```sh
docker build -t i-librarian:6.1.6 - < i-librarian-6.1.6.tgz
```

## 2. Start *I, Librarian* container with docker compose

Extract `docker-compose.yml`:
```sh
tar xzf i-librarian-6.1.6.tgz ./docker-compose.yml
```

The included `docker-compose.yml` will work as is, but feel free to customize your setup.

* Line 11: storage directory on the host, default is `/var/www/i-librarian`. The directory must exist on the host:
    ```sh
    mkdir -p /var/www/i-librarian
    ```
* Line 15: log directory on the host, default is `/var/log/i-librarian`. The directory must exist, and be writeable by user 9060:
    ```sh
    mkdir -p /var/log/i-librarian
    chown -R 9060:9060 /var/log/i-librarian
    ```
* Line 19: config directory on the host, default is `/etc/opt/i-librarian`. Extract the configuration file to that location:
    ```sh
    tar xzf i-librarian-6.1.6.tgz ./etc/opt/i-librarian/run-default-docker.env --strip-components=4
    mkdir -p /etc/opt/i-librarian
    mv run-default-docker.env /etc/opt/i-librarian/run.env
    ```

If you purchased a license, add the license key to the host config directory:

```sh
cp -f i-librarian.key /etc/opt/i-librarian/i-librarian.key
```

With no license key present, *I, Librarian* will run in an evaluation mode, which is restricted to adding and displaying a small
number of items.

Run docker compose:
```sh
docker compose up -d
```

## 3. Create a library

*I, Librarian* allows you to create separate libraries.
Their names will be related to their URL pathname. For instance, a library `foo` will be located at `domain.com/foo`.
For this reason, it is best to use lower-case ASCII characters only. Run Docker command (replace LIBRARYNAME with your library name):

```sh
docker exec --user root -it il i-librarian create_library -name LIBRARYNAME
```

## 4. Post-installation notes

### 4a. Web server

Web server installation is beyond the scope of this document. Nginx and Caddy
are reliable options. Point your reverse proxy server to 127.0.0.1:9060:

Caddy
```Caddyfile
example.com {
    reverse_proxy 127.0.0.1:9060
}
```

### 4b. Settings in run.env

*I, Librarian* settings can be found in `run.env`. You can change how your URL maps to the library name.
In addition, API keys may be added there to apply to all libraries globally. Alternatively, you can add some API
keys in *I, Librarian’s* `Administrator > Global Settings` for each library. API keys can be obtained here:

* NCBI (https://support.nlm.nih.gov/kbArticle/?pn=KA-05317) (free)
* Crossref search requires your email address as the API key (free)
* Elsevier (https://dev.elsevier.com/) (free)
* Google Vision OCR (https://cloud.google.com) (paid)
* Google Gemini AI (https://aistudio.google.com/apikey) (paid)
* Mailgun email  (https://www.mailgun.com/)  (free/paid)
* EPO patent search (https://www.epo.org/en/searching-for-patents/data/web-services/ops) (free/paid)
* IEEE Xplore (https://developer.ieee.org/Quick_Start_Guide) (free)
* NASA ADS (https://api.nasa.gov/) (free)

Changes in the `run.env` require *I, Librarian* restart.

```sh
docker restart il
```

## 5. How do I

### 5a. Create another library.

Repeat step I. 3. Container restart is not required.

### 5b. Delete a library.

Run docker command (replace LIBRARYNAME with your library name):
```sh
docker exec --user root -it il i-librarian delete_library -name LIBRARYNAME
```

### 5c. Back up data.

Stop *I, Librarian* container and copy your host storage directory to a safe place.

# II. Upgrade *I, Librarian* in *Docker*

**Upgrades, including maintenance releases, are not guaranteed to be backward compatible. Please ensure your data is backed
up regularly.**

All instructions are for *docker engine*.

## 1. Build new *I, Librarian* image

Stop, and delete the existing *I, Librarian* container. Then proceed to build a new image:
```sh
docker build -t i-librarian:6.1.6 - < i-librarian-6.1.6.tgz
```

## 2. Start *I, Librarian* container with docker compose

Extract `docker-compose.yml`:
```sh
tar xzf i-librarian-6.1.6.tgz ./docker-compose.yml
```

If necessary, customize `docker-compose.yml`, as described in I. 2.

Run docker compose:
```sh
docker compose up -d
```

## 3. Run upgrade command

```sh
docker exec --user root -it il i-librarian upgrade
```

# III. Upgrade *I, Librarian* in *Docker* from version 5

**It is always a good idea to back up the current library first. It will allow you to continue using version 5, in case
of an issue.**

## 1. Prepare *I, Librarian* storage directory

* Optional. Move libraries to the new storage folder, if changed between versions.
    ```
    cp -r /v5/storage/dir/[LIBRARYNAME]/data /var/www/i-librarian/[LIBRARYNAME]
    ```
* Change the owner and group of your library `data` directory to 9060. That's the new UID and GID in the container.
    ```
    chown -R 9060:9060 /var/www/i-librarian/[LIBRARYNAME]/data
    ```

## 2. Build new *I, Librarian* image

```sh
docker build -t i-librarian:6.1.6 - < i-librarian-6.1.6.tgz
```

## 3. Start *I, Librarian* container with docker compose

Extract `docker-compose.yml`:
```sh
tar xzf i-librarian-6.1.6.tgz ./docker-compose.yml
```

Customize `docker-compose.yml`, as described in I. 2.

Run docker compose:
```sh
docker compose up -d
```

## 4. Run upgrade command

```sh
docker exec --user root -it il i-librarian upgrade
```

Complete reindexing is required after upgrade from a version 5. It can be performed in *I, Librarian* `Administrator` menu,
`Software details` > `Rebuild indexes` button.