Slidescore
==========

Recently, I've seen a [few](http://wolfslittlestore.be/html-prototyping-talk/)
[sites](http://idlewords.com/bt14.htm) that posted slides from a talk alongside
a transcript next to each slide. I thought this was a really nice idea, so I
took it and built a little Middleman application that makes it easy.

First, configure the app in `data/config.yml`:

```yml
title: 'Talk Title'
description: 'This is the description of the talk.'
file_ext: 'png' # Standard image file extension (can change per slide)
table_of_contents: false
```

Next, you can start adding your slides in `data/slides.yml`:

```yml
- title: First Slide
  description: >
    This is some text for the first slide. It doesn't include an image, so it
    just uses a placeholder specified in `data/slides.yml`.
  image: 'http://placehold.it/1280x720/000/000'

- title: Second Slide
  description: >
    This is some text for the first slide. It doesn't include an image, so it
    just uses a placeholder specified in `data/slides.yml`.
  image: 'http://placehold.it/1280x720/000/000'

- title: Third Slide
  description: >
    This is some text for the first slide. It doesn't include an image, so it
    just uses a placeholder specified in `data/slides.yml`.
  image: 'http://placehold.it/1280x720/000/000'

- description: >
    This is some text for the fourth slide that doesn't have a title. Also,
    this slide changes the default `file_ext`, and it uses a standard image
    that is in `images/slides/4.gif`.
  file_ext: 'gif'

- title: Partial Slide
  partial: true
  file_ext: 'jpg'

- title: Multiple Images
  description: >
    This slide has more than one image tied to it. You just need to add an
    `additional_images` option with a list of image paths.
  image: 'http://placehold.it/1280x720/000/000'
  additional_images:
    - 'http://placehold.it/1280x720/000/000'
    - 'http://placehold.it/1280x720/000/000'

- title: Multiple Images As Files
  partial: true
  additional_images: true
  additional_images_number: 2
  file_ext: 'jpg'
```

You can specify the following:

- `title` &mdash; The title of the slide (optional)
- `description` &mdash; The description text (can use Markdown here!)
- `partial` &mdash; Set this to `true` if you want to move your Markdown description into a partial file (add your file to `source/slides/_SLIDENUMBER.md` - e.g. `source/slides/_5.md`)
- `image` &mdash; If you need to specify a custom location, otherwise it'll pull from `assets/images/slides/SLIDENUMBER.png` (e.g. `1.png` for the first slide, etc.)
- `file_ext` &mdash; If you need to change this slide's image extension from the one specified in `data/config.yml`
- `addtional_images` &mdash; either `true` or a list of image paths
- `additional_images_number` &mdash; the number of additional images, if you include them locally

That's it! Now you can start building out the transcript alongside your slide images. Follow the steps below to get the Middleman app set up.

Keyboard Shortcuts
------------------

- `h` &mdash; Go to the first slide
- `j`, `right arrow`, `spacebar` &mdash; Go to the next slide
- `k`, `left arrow`  &mdash; Go to the previous slide
- `l` &mdash; Go to the last slide

Setup
-----

```shell
gem install bundler
bundle install
```

Running the Application
-----------------------

You run the application by starting the Middleman server:

```shell
middleman s
```

If you're using Rbenv with binstubs:

```shell
./bin/middleman s
```

Building the Static Files
-------------------------

To build the static files:

```shell
middleman build
```

Or, if you're using Rbenv:

```shell
./bin/middleman build
```

Deploying
---------

If you'd like to deploy the site, add a `Rakefile` and take a look at the [Baseman](https://github.com/drewbarontini/baseman#deploying) deploy documentation.

**Note**: Be sure to remove the `Rakefile` from the `.gitignore`!
