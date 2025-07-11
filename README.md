Kneipe
======

[![Apache License][Apache License Badge]][Apache License, Version 2.0]

__Kneipe__ is a "museum" repository that condenses the history of my learning path toward adding DevOps engineering
skills to my tech career portfolio. This wonderful journey spanning 3 years consists of the following __5__ phases:

1. [A Collection of Bash Shell Script](https://github.com/paion-data/hashistack/tree/4f08be0926ca8bda6da3078c37b832915b966988)
2. [CHEF](https://github.com/generation-software/Kneipe/tree/bf2fe169ccef087e56e58ba27ac308ca88d5317a): When I
   was working at Yahoo! from Feb 22nd, 2016 to Oct 22nd, 2019, I saw the extensive usage of th CHEF in the internal
   CI/CD's of Yahoo's software development. This notion of _Infrastructure as Code_ sparked my interests on DevOps.
3. [HashiCorp + AWS + Screwdriver](https://github.com/generation-software/Kneipe/tree/d9871613cee1da0e0adb531894e3b6f59eb1b165):
   I was researching deploying k8s and Google came up a concept I was never heard of: [k8s through AMI](https://github.com/awslabs/amazon-eks-ami). It was
   this GitHub repo that open up a whole new world to my career: HashiCorp, AWS AMI, and
   [Immutable Infrastructure](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure). The
   notion of immutable infrastructure as advanced by HashiCorp grabbed my deep interests so intensively that kept
   myself learning and that incubated this phase. It condensed my passion for the best practice of software
   infrastructure.
4. [CI/CD central](https://github.com/generation-software/Kneipe/tree/d86616b81382d686ec7a690e94ec2f285cf7c1dc)
5. back to phase 1

### What I have learnt about DevOps in the Past 3 Years

The DevOps world has transitioned from developer tools that are purely functional, to developer tools being part of a
"developer experience." _It was no longer about a single tool as collated in a
[single project](https://github.com/generation-software/Kneipe) , but the many tools developers use throughout the day,
and how they work together to achieve a better workflow for the developer_. 

Having constantly learning, practicing, and transcendenting my DevOps skills then, I seeded this single project to the
many CI/CD and operations of my projects:

- I use CHEF as part of the CI/CD pipeline of my internal SaaS products
- I apply the notion of IaC using HashiCorp technologies throughout my projects, such as
  [Henschel](https://henschel.qubitpi.org/)
- The [Generation Software](https://github.com/generation-software) has inherited the centralized idealism in
  [its organization central unit](https://github.com/generation-software/.github)

What's left - this projects has accomplished its goal, decommissioned, and comes back to it's very initial effort in its
phase 1:

A Collection of Reusable Bash Scripts
-------------------------------------

### Burn (harcode) srt into mp4

```console
curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/burn-sub.sh | bash -s -- input.mp4 subtitle.srt output.mp4
```

Optional arguments:

- Subtitle font (Default to `Poppins`): `input.mp4 subtitle.srt output.mp4 Poppins`
- Font size (Default to `24`): `input.mp4 subtitle.srt output.mp4 "" 24`

### Cleaning all local docker containers, images, and volumes

```
curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/docker-clean.sh | bash
```

### Convert Image to Favicon

```console
curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/convert-to-favicon.sh | bash -s -- input.png
```

### Add Paddings to Image

Adds paddings of an image to make it with certain dimension. To use this script, install ImageMagick first. For example,
on Mac, install by

```console
brew update
brew install imagemagick
```

> [!TIP]
>
> To install this script, place it under OS executable path. For example, On mac put this under "/usr/local/bin/"

The following examples assumes the input image is "input.png" and output image will be "output.png":

- Add _transparent_ paddings to make a _square image_ with the side being the larger one of original's width or height:

  ```console
  curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/add-padding.sh | bash -s -- input.png output.png 
  ```

- Add _transparent_ paddings to make an image with dimension 1920x1080:

  ```console
  curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/add-padding.sh | bash -s -- input.png output.png 1920x1080
  ```

- Add paddings, whose color is white, to make an image with dimension 1920x1080:


  ```console
  curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/add-padding.sh | bash -s -- input.png output.png 1920x1080 white
  ```

### Keeps Executing A Command Util it Succeeds

```console
curl -sL https://raw.githubusercontent.com/generation-software/Kneipe/refs/heads/master/loop.sh | bash -s -- <command>
```

License
-------

The use and distribution terms for [Kneipe]() are covered by the [Apache License, Version 2.0].

[Apache License Badge]: https://img.shields.io/github/license/QubitPi/Antiqua?style=for-the-badge&logo=Apache&logoColor=white&labelColor=FF7777&color=00B8A9
[Apache License, Version 2.0]: https://www.apache.org/licenses/LICENSE-2.0
