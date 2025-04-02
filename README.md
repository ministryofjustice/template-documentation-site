# Template Documentation Site

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/template-documentation-site/badge)](https://github-community.service.justice.gov.uk/repository-standards/template-documentation-site)

Use this repository to create a documentation site using the Government Digital Service's [tech-docs-gem](https://github.com/alphagov/tech-docs-gem).

This is recommended for MoJ's technical documentation because:

- It uses the [GOV.UK Design System](https://design-system.service.gov.uk/) and makes it consistent with other technical documentation sites, including:

  - [Cloud Platform's user guide](https://user-guide.cloud-platform.service.justice.gov.uk/)

  - [Modernisation Platform's user guide](https://user-guide.modernisation-platform.service.justice.gov.uk/)

  - [MoJ's technical guidance](https://technical-guidance.service.justice.gov.uk/)

  - [Operations Engineering's user guide](https://user-guide.operations-engineering.service.justice.gov.uk/)

- Technical and non-technical team members can write your documentation using the [‘docs as code’](https://technology.blog.gov.uk/2017/08/25/why-we-use-a-docs-as-code-approach-for-technical-documentation/) approach

---

# How to use this template

1. Create a repository using this template ([shortcut](https://github.com/new?template_name=template-documentation-site&template_owner=ministryofjustice))

1. Follow the setup instructions from [ministryofjustice/template-repository](https://github.com/ministryofjustice/template-repository?tab=readme-ov-file#setup-instructions)

1. Remove the legacy technical documentation site

    - `source/legacy-tdt-documentation`

For guidance on using the tech-docs-gem, please refer to the [legacy documentation](https://ministryofjustice.github.io/template-documentation-site/legacy-tdt-documentation).

# Developing

## Requirements

- Docker

## Previewing locally

Running the following command will run your technical documentation site locally using [ministryofjustice/tech-docs-github-pages-publisher](https://github.com/ministryofjustice/tech-docs-github-pages-publisher), allowing you to access it by visiting <http://127.0.0.1:4567> in your browser

```bash
make preview
```

## Checking links locally

This repository includes a GitHub Actions workflow that uses [Lychee](https://github.com/lycheeverse/lychee) for checking links.

To perform this locally, you will either need to use the dev container or install Lychee, and the run:

```bash
make link-check
```

# Publishing

This template includes a GitHub Actions workflow ([`.github/workflows/publish.yml`](.github/workflows/publish.yml)) for publishing to GitHub Pages when merging to `main`.
