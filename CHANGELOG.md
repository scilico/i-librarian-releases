# Changelog
All notable changes to *I, Librarian Pro* will be documented in this file.

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
