# Terraform 102 video materials

Materials for the [Terraform 102: How to Apply from GitHub Actions](https://youtu.be/NGEPe0z00VA) youtube video.

## Description

We are going to use terraform code to deploy EC2 instance. Terraform code was explained earlier in [Terraform 101](https://youtu.be/z3CLMsYtxYw) video.

Now we expand code to use remote backend - see ```backend "s3"```. It is also locked with ```use_lockfile = true```.

Github actions workflow is located in the ".github/workflows" folder.

There we checkout repo, initialize terraform (with a specified terraform version - it is always better to know exactly what versions you are using), then perform basic checks like formatting and validation of code.

After that we either plan and push plan as comment to PR or apply with auto-approve - based on branch.

To authenticate agains AWS we need to create 2 repo secrets - ```AWS_ACCESS_KEY_ID``` and ```AWS_SECRET_ACCESS_KEY```.


