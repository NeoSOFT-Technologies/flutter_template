# Contribution Guidelines

We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

Mobile-flutter is a community driven project and accepts contributions of code and documentation from the community. 
These contributions are made in the form of Issues or Pull Requests on the `mobile-flutter` repository on GitHub.

## We Develop with Github
We use github to host code, to track issues and feature requests, as well as accept pull requests.

Pull requests are the best way to propose changes to the codebase. We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
4. Ensure the test suite passes.
5. Make sure your code lints.
6. Issue that pull request!

If your Pull Requests fail to pass these guidelines it will be declined and you will need to re-submit
when you’ve made the changes. This might sound a bit tough, but it is required
for us to maintain quality of the code-base.

**One thing at a time:** A pull request should only contain one change. That does not mean only one commit, but one change - however many commits it took. The reason for this is that if you change X and Y but send a pull request for both at the same time, we might really want X but disagree with Y, meaning we cannot merge the request. Using the branching model you can create new branches for both of these features and send two requests.

## Keeping your fork up-to-date

Unlike systems like Subversion, Git can have multiple remotes. A remote is the name for a URL of a Git repository. By default your fork will have a remote named "origin" which points to your fork, but you can add another remote named "mobile-android" which points to `https://github.com/NeoSOFT-Technologies/mobile-flutter`. This is a read-only remote but you can pull from this branch to update your own.

If you are using command-line you can do the following:

1. `git remote add mobile-android https://github.com/NeoSOFT-Technologies/mobile-flutter.git`
2. `git pull mobile-flutter main`

Now your fork is up to date. This should be done regularly, or before you send a pull request at least.


## Report bugs using Github's [issues](https://github.com/NeoSOFT-Technologies/mobile-flutter/issues)

We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/NeoSOFT-Technologies/mobile-flutter/issues); it's that easy!



## Write bug reports with detail, background, and sample code

[This is an example](http://stackoverflow.com/q/12488905/180626) of a bug report, and I think it's not a bad model. Here's [another example from Craig Hockenberry](http://www.openradar.me/11905408), an app developer.

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
    - Be specific!
    - Give sample code if you can. [stackoverflow question](http://stackoverflow.com/q/12488905/180626) includes sample code that *anyone* with a base setup can run to reproduce what I was seeing
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

People ***love*** thorough bug reports. I'm not even kidding.


## References

This document was adapted from the open-source contribution guidelines for [Facebook's Draft](https://github.com/facebook/draft-js/blob/a9316a723f9e918afde44dea68b5f9f39b7d9b00/CONTRIBUTING.md)