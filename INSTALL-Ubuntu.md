# *I, Librarian* on Ubuntu

These instructions are for native installation on Ubuntu 24.04. Other operating
systems can use the containerized version.

## 1. Install *I, Librarian* using the `install` command

Run the following commands.

```bash
tar -xzf i-librarian-[TAG].tgz -C / ./etc ./opt ./usr
/opt/i-librarian/i-librarian install
```

If you purchased a license, add the license key to the config directory:

```sh
cp -f i-librarian.key /etc/opt/i-librarian/i-librarian.key
```

With no license key present,  *I, Librarian* will run in an evaluation mode, which is restricted to adding and displaying a small
number of items.

## 2. Create a library

You can create a new library as indicated below. Replace `LIBRARYNAME` with the name of your library. Use lowercase ASCII letters
and numbers only. Run command (replace LIBRARYNAME with your library name):

```sh
/opt/i-librarian/i-librarian create_library -name LIBRARYNAME
```

## 3. Post-installation notes

### 3a. Web server

Web server installation is beyond the scope of this document. Nginx and Caddy
are reliable options. Point your reverse proxy server to 127.0.0.1:9060:

Caddy
```Caddyfile
example.com {
    reverse_proxy 127.0.0.1:9060
}
```

### 3b. Settings in run.env

*I, Librarian* settings can be found in `/etc/opt/i-librarian/run.env`.
You can change some technical aspects in there, like storage directory, ports (in case of conflicts), or how your
URL maps to libraries.

External API keys may be added to the file to affect all libraries. Alternatively, you can add them in *I, Librarian’s*
`Administrator > Global Settings` for each library. API keys can be obtained here:

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
service il stop
service il start
```

## 4. How do I

### 4a. Create another library.

Repeat step 2.

### 4b. Delete a library.

Permanently delete *I, Librarian* library files. Replace `LIBRARYNAME` with the name of your library.

```sh
/opt/i-librarian/i-librarian delete_library -name LIBRARYNAME
```

### 4c. Back up data.

Stop *I, Librarian* service and copy your storage directory `/var/www/i-librarian` to a safe place.

### 4d. Upgrade *I, Librarian*.

**Upgrades, including maintenance releases, are not guaranteed to be backward compatible. Please ensure your data is backed
up regularly.**

Stop *I, Librarian*, unpack the new files, start the service, and run the upgrade command:

```bash
service il stop
tar -xzf i-librarian-[TAG].tgz -C / ./opt
service il start
/opt/i-librarian/i-librarian upgrade
```
Complete reindexing is required after upgrade from a version 5. It can be performed in *I, Librarian* `Administrator` menu,
`Software details` > `Rebuild indexes` button.

### 4e. Uninstall *I, Librarian*.

```bash
/opt/i-librarian/i-librarian uninstall
```