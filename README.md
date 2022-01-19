# Template Documentation Site

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
    * Setup branch protection

3. In your repository settings, in the Pages section configure it to publish the `/docs` folder in the
   `gh-pages` branch. You'll have to create the `gh-pages`
   branch first, or you can just defer this step until after your first push/merge
   to `main`, and let the Github Action create the branch for you.

4. Edit [config/tech-docs.yml](config/tech-docs.yml) to set appropriate values for the [template configuration](#template-configuration)

5. [Edit your content](#editing)

---

# ExampleXYZ Documentation

## Editing

The documentation is changed by editing `*.html.md.erb` files, found in the folder tree: [source/documentation](source/documentation)

The format is Markdown and HTML - see [Tech Docs Template - Write your content](https://tdt-documentation.london.cloudapps.digital/write_docs/content/)

While editing the files locally, you can [preview the site](#preview-docs). For more details, see the [gov.uk tech-docs-template] documentation.

Changes that are merged to the `main` branch are automatically [published](#publishing)

This repo is a MOJ documentation site based on [template-documentation-site](https://github.com/ministryofjustice/template-documentation-site)

## Preview docs

You can run `make preview` to start a local instance of your site at
`http://localhost:4567`, so that you can view changes while editing your
content files.

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
