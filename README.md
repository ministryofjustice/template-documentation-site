# Template Documentation Site

[![repo standards badge](https://img.shields.io/badge/dynamic/json?color=blue&style=for-the-badge&logo=github&label=MoJ%20Compliant&query=%24.data%5B%3F%28%40.name%20%3D%3D%20%22template-documentation-site%22%29%5D.status&url=https%3A%2F%2Foperations-engineering-reports.cloud-platform.service.justice.gov.uk%2Fgithub_repositories)](https://operations-engineering-reports.cloud-platform.service.justice.gov.uk/github_repositories#template-documentation-site "Link to report")

Use this repo template to create a documentation website using the [GOV.UK Tech Docs Template](https://github.com/alphagov/tech-docs-template).

This is recommended for MOJ's technical documentation because:

* The template uses [GOV.UK Design System](https://design-system.service.gov.uk/) and makes it also consistent with many tech docs sites in MOJ ([MOJ Technical Guidance], [MOJ Security Guidance](security-guidance.service.justice.gov.uk/), [Cloud Platform User Guide](https://user-guide.cloud-platform.service.justice.gov.uk/) and [over a hundred more around government](https://github.com/alphagov/tech-docs-gem/network/dependents)
* Both engineers and non-technical people can write your documentation using the [‘docs as code’ approach](https://technology.blog.gov.uk/2017/08/25/why-we-use-a-docs-as-code-approach-for-technical-documentation/) 

Publishing is done by a Github Action [publish.yml](.github/workflows/publish.yml) that makes use of [tech-docs-github-pages-publisher docker image](https://github.com/ministryofjustice/tech-docs-github-pages-publisher).

## To create a site

1. Create a repository from this template

2. Make the "normal" changes:

    * Edit the copy of this README.md file, deleting everything up to the `---`
    * Grant permissions to the appropriate MoJ teams
    * Setup [branch protection](https://help.github.com/articles/about-protected-branches/)

3. In your repository settings, in the Pages section configure it to publish the `/docs` folder in the
   `gh-pages` branch. You'll have to create the `gh-pages`
   branch first, or you can just defer this step until after your first push/merge
   to `main`, and let the Github Action create the branch for you.

4. Edit [config/tech-docs.yml](config/tech-docs.yml) to set appropriate values for the [template configuration](#template-configuration)

5. [Edit your content](#editing)

---

# ExampleXYZ Documentation

## Editing

The documentation is changed by editing `*.html.md.erb` files, found under the [source](source) folder.

The syntax is Markdown. For guidance see: [Tech Docs Template - Write your content](https://tdt-documentation.london.cloudapps.digital/write_docs/content/). [kramdown](https://kramdown.gettalong.org/syntax.html) is what compiles the Markdown. 

While editing the files locally, you can [preview the site](#preview-docs).

Every change should be reviewed in a pull request, no matter how
minor. [branch protection](https://help.github.com/articles/about-protected-branches/) is enabled to enforce this.

Merging the changes to the `main` branch are automatically [published](#publishing)

## Preview docs

You can preview how your changes will look, if you've cloned this repo to your local machine, and run this command:

```bash
make preview
```

This will run a preview web server on http://localhost:4567 which you can open in your browser.

This is only accessible on your computer, and won't be accessible
to anyone else.

## Publishing

Provided you have updated the `.github/workflows/publish.yml` file as directed,
any changes you push/merge into the `main` branch should be published
to GitHub Pages site automatically.

The URL for the published site is: (TODO)

> The publishing process creates files in `/docs` and pushes them to the
> `gh-pages` branch to publish them. You should not edit any files in that
> folder, because your changes will be lost the next time the site is
> published.

## Template configuration

The template can be configured in [config/tech-docs.yml](config/tech-docs.yml)

Key config:

* `host:` - this should be the URL of your published GitHub Pages site, e.g:

   ```
   https://ministryofjustice.github.io/modernisation-platform
   ```

   > Do not include a `/` at the end of this URL

* `service_link:` - This should be the docpath to your site. This is usually
  `/[repo name]`, so if your repository is `ministryofjustice/awesome-docs`
  `service_link` will be `/awesome-docs`

Further configuration options are described here: [Tech Docs Template docs - Global Configuration](https://tdt-documentation.london.cloudapps.digital/configure_project/global_configuration/)
