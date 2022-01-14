# Static site on AWS s3 bucket
Terraform module to publish a static site on s3 bucket.
The tfstate has saved on different s3 bucket and lock state saved on DynamoDB.

### Modules available in this repository:

- s3_module: Automatically creates an s3 bucket.
- s3_object: Send files to bucket.
- root module: Manage another modules, set bucket policy and generate random name to bucket.

### To-do
- [x] Module to create s3 bucket
- [x] Module to send the files to the bucket
- [ ] Module to configure cloudfront
- [ ] Module to generate SSL certificate
- [ ] CI/CD to deploy
