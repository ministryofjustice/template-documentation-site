# Template Documentation Site

[![repo standards badge](https://img.shields.io/badge/dynamic/json?color=blue&style=for-the-badge&logo=github&label=MoJ%20Compliant&query=%24.result&url=https%3A%2F%2Foperations-engineering-reports.cloud-platform.service.justice.gov.uk%2Fapi%2Fv1%2Fcompliant_public_repositories%2Ftemplate-documentation-site)](https://operations-engineering-reports.cloud-platform.service.justice.gov.uk/public-github-repositories.html#template-documentation-site "Link to report")

Use this repository template to create a documentation website using the GOV.UK [Technical Documentation Template](https://tdt-documentation.london.cloudapps.digital/) and its [source code](https://github.com/alphagov/tech-docs-template).

This is recommended for MOJ's technical documentation because:

- The template uses the [GOV.UK Design System](https://design-system.service.gov.uk/) and makes it also consistent with many tech docs sites such as MOJ [MOJ Technical Guidance](https://technical-guidance.service.justice.gov.uk/#moj-technical-guidance), [MOJ Security Guidance](https://security-guidance.service.justice.gov.uk/), and [Cloud Platform User Guide](https://user-guide.cloud-platform.service.justice.gov.uk/).

- This is a [list](https://github.com/alphagov/tech-docs-gem/network/dependents) of other sites that use the govuk_tech_docs gem.

- Both engineers and non-technical people can write your documentation using the [‘docs as code’](https://technology.blog.gov.uk/2017/08/25/why-we-use-a-docs-as-code-approach-for-technical-documentation/) approach.

Publishing is done by the Github Action [publish.yml](.github/workflows/publish.yml) that makes use of [tech-docs-github-pages-publisher](https://github.com/ministryofjustice/tech-docs-github-pages-publisher) docker container.

## To create a site

1. Create a repository from this template.

2. Make the "normal" changes:

   - Edit the copy of this README.md file, deleting everything up to the `---`
   - Grant permission/s to the appropriate MoJ team/s with at least one team having Admin permissions.
   - Try not to add individual users to the repository, instead use a team.
   - To add an Outside Collaborator to the repository follow the guidelines on the [GitHub-collaborator repository](https://github.com/ministryofjustice/github-collaborators).
   - Ensure branch protection is set up on the main branch.
   - [Optional] Modify the CODEOWNERS file and state the team or users that can authorise PR's.
   - Modify the Dependabot file to suit the [dependency manager](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#package-ecosystem) you plan to use and for [automated pull requests for package updates](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/enabling-and-disabling-dependabot-version-updates#enabling-dependabot-version-updates). Dependabot is enabled in the settings by default.
   - Modify the short description found on the right side of the README.md file.
   - Ensure as many of the [GitHub Standards](https://github.com/ministryofjustice/github-repository-standards) rules are maintained as possibly can.
   - Modify the MoJ Compliant Badge url using these [instructions](https://github.com/orgs/ministryofjustice/teams/operations-engineering/discussions).

3. In your repository settings, in the Pages section for 'Build and deployment' 'Source' change to the option 'GitHubs Actions' after your first push/merge to `main`, the Github Action will create the the gh-pages. The link will be in repository settings Pages section.

4. Edit [config/tech-docs.yml](config/tech-docs.yml) to set appropriate values for the [template configuration](#template-configuration).

5. [Edit your content](#editing).

**The docs folder is used by gh-pages to host the website. Do not delete.**

---

# Example XYZ Documentation

## Editing

The documentation is created by editing `*.html.md.erb` files, found in the [source](source) folder.

The syntax is Markdown, more details can be found [here](https://daringfireball.net/projects/markdown/).

For guidance see the Tech Docs Template [Write your content](https://tdt-documentation.london.cloudapps.digital/write_docs/content/).

The Markdown syntax may use [kramdown](https://kramdown.gettalong.org/syntax.html) TBC.

While editing the files locally, you can start a Docker container that will use Middleman to act as a server hosting the webpages. See [preview docs](#preview-docs).

Every change should be reviewed in a pull request, no matter how minor. PR request reviewer/s should be enabled within the main branch protection settings.

Merging the changes to the `main` branch automatically publishes the changes via GH Action. See [publishing](#publishing).

## Preview docs

You can preview how your changes will look, if you've cloned this repo to your local machine, and run this command:

```
make preview
```

This will run a preview web server on http://localhost:4567 which you can open in your browser.

Use `make check` to compile the site to html and check the URLs are valid.

This is only accessible on your computer, and won't be accessible to anyone else.

For more details see the [tech-docs-github-pages-publisher](https://github.com/ministryofjustice/tech-docs-github-pages-publisher) repository.

## Publishing

Any changes you push/merge into the `main` branch should be published to GitHub Pages site automatically.

## Template configuration

The webpage layout is configured using the config/tech-docs.yml file.

The template can be configured in [config/tech-docs.yml](config/tech-docs.yml)

Key config settings:

- `host:` - This should be the URL of your published GitHub Pages site, e.g:

  ```
  https://ministryofjustice.github.io/modernisation-platform
  ```

  > Do not include a `/` at the end of this URL

- `service_link:` - This should be the docpath to your site. This is usually
  `/[repo name]`, so if your repository is `ministryofjustice/awesome-docs`
  `service_link` will be `/awesome-docs`

Further configuration options are described on the Tech Docs Template website: [Global Configuration](https://tdt-documentation.london.cloudapps.digital/configure_project/global_configuration/).
