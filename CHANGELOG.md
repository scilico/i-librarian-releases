# Changelog
All notable changes to *I, Librarian Pro* will be documented in this file.

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
