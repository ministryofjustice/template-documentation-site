# Template Documentation Site

Use this template to create a documentation website using the [gov.uk tech-docs-template].

## To create a site

1. Create a repository from this template

2. Make the "normal" changes:

    * Edit the copy of this README.md file to document your project
    * Grant permissions to the appropriate MoJ teams
    * Setup branch protection

3. Change your repository settings to publish the `/docs` folder in the
   `gh-pages` branch via github pages. You'll have to create the `gh-pages`
branch first, or you can just defer this step until after your first push/merge
to `main`, and let the github action create the branch for you.
4. Edit the `.github/workflows/publish.yml` file to set the
  correct docpath to your site. This is generally `/[repo name]` so if your
repository is `ministryofjustice/awesome-docs`, you need to set the
`ROOT_DOCPATH` in that file to `/awesome-docs`.
5. Edit `config/tech-docs.yml` to set appropriate values for your site

You can now manage your content by editing `*.html.md.erb` files below
`source/documentation`

For more details, see the [gov.uk tech-docs-template] documentation.

## Preview

You can run `make preview` to start a local instance of your site at
`http://localhost:4567`, so that you can view changes while editing your
content files.

## Publishing

Provided you have updated the `.github/workflows/publish.yml` file as directed,
any changes you push/merge into the `main` branch should be published
automatically.

> The publishing process creates files in `/docs` and pushes them to the
> `gh-pages` branch to publish them. You should not edit any files in that
> folder, because your changes will be lost the next time the site is
> published.

### warning: URI.unescape is obsolete

You can ignore any messages like this that you see. It's a deprecation warning
because a gem has not been updated wrt. the (currently) latest version of ruby.

[gov.uk tech-docs-template]: https://tdt-documentation.london.cloudapps.digital/
