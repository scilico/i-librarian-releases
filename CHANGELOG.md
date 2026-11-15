# Changelog
All notable changes to *I, Librarian Pro* will be documented in this file.

## [6.1.15] - 2026-11-15

### Added
- Support for connecting to local AI models via the Ollama server.
- Local OCR support using the Tesseract library.
- AI-assisted metadata extraction for manual uploads across all supported file types.
- Replaced Ghostscript with the pypdf backend library to enable annotated PDF exports.

### Changed
- AI search now includes semantic expansion for search keywords.
- DOI input fields now accept both raw DOI strings and full URLs.
- Gemini AI models. Customers should update their production `run.env` like this:
    ```env
    AI_MODEL_TIER1=gemini-4-carbon
    AI_MODEL_TIER2=gemini-4-hydrogen
    AI_MODEL_TIER3=gemini-3.5-flash-lite
    ```

### Fixed
- Native installer bugs.
- Memory leaks during file uploads.

### Removed
- Ghostscript backend library (replaced by pypdf).

## [6.1.14] - 2026-10-12

### Added
- Redirect of deleted item IDs to existing IDs.
- New API endpoint for PDF export.
- Improved DOI search inputs also accept full URL DOI.

### Changed
- Offline app export contains PDFs with customized names.
- Gemini 3 AI models. Customers should update their production `run.env` like this:
    ```env
    AI_MODEL_TIER1=gemini-3.1-pro-preview
    AI_MODEL_TIER2=gemini-3.8-flash
    AI_MODEL_TIER3=gemini-3.5-flash-lite
    ```

### Fixed
- RIS item export crash.
- Zombie indexing jobs will restart after 15 min of inactivity.

## [6.1.12] - 2026-05-27

### Added
- OpenAlex in readme.

### Changed
- Gemini 3 AI models. Customers should update their production `run.env` like this:
    ```env
    AI_MODEL_TIER1=gemini-3.1-pro-preview
    AI_MODEL_TIER2=gemini-3.5-flash
    AI_MODEL_TIER3=gemini-3.1-flash-lite
    ```

### Fixed
- Password reset email sending to non-existent emails.

## [6.1.11] - 2026-05-06

### Fixed
- CLI commands now work with `LIBRARY_NAME=subdomain` setting.
- Crash in search result highlighting.

## [6.1.10] - 2026-05-01

### Fixed
- Incorrect password reset link in email messages.
- Non-functional close buttons on certain filters.
- Batch PDF upload interruption caused by screen lock.

## [6.1.9] - 2026-04-27

### Added
- MCP server for the *I, Librarian* API.
- AI search in Dashboard that transforms search terms into advanced search.
- Integrated OpenAlex search. We recommend using OpenAlex as a primary source for references across all research fields.

### Changed
- Gemini 2.5 Flash Lite model replaced by Gemini 3.1 Flash Lite Preview. Customers should update their production `run.env` like this:
    ```env
    AI_MODEL_TIER3=gemini-3.1-flash-lite-preview
    ```

### Fixed
- Updated patent search to accommodate undocumented changes to the EPO API.

## [6.1.6] - 2026-04-18

### Fixed
- Race condition in opening Bleve index again.

## [6.1.5] - 2026-04-17

### Fixed
- Error in create_library command.
- Race condition in opening Bleve index.

## [6.1.3] - 2026-04-16

### Added
- Import UID notification when UID not found.

### Changed
- Due to internal code refactoring, some installation instructions were changed.

## [6.1.2] - 2026-04-14

### Added
- Integrated **Bleve** as the primary search engine.

### Removed
- Apache Solr (replaced by Bleve; no external Java dependency required).

### Fixed
- Items could not be added to new projects in Omnitool.

### Changed
- User status "suspended" is now reserved for internal use.
- Minor Omnitool improvements.

## [6.0.27] - 2026-03-29

### Removed
- ArXiv search API due to service instability. (Note: Use NASA ADS search for arXiv preprints instead).

### Fixed
- Incorrect HTTP response headers for error messages.

## [6.0.26] - 2026-02-28

### Changed
- Gemini 3 Pro Preview model replaced by Gemini 3.1 Pro Preview. Customers should update their production `run.env` like this:
    ```env
    AI_MODEL_TIER1=gemini-3.1-pro-preview
    ```

### Fixed
- Fixed a bug where search query was not properly escaped for Solr ingestion.
