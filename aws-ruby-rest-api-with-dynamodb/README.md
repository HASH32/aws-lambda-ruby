## Create a REST API in AWS Lambda

Deploying this application, creates the following functions:

- Create user
- Show user
- Update user
- List users
- Delete user

## How to Deploy

This example uses serverless framework and Ruby 2.5 runtime.

Install serverless framework

```sh
npm i -g serverless
```

Follow these steps to deploy:

1. Set up AWS credentials
2. Run `bundle install` and `bundle install --deployment`, this will add gems in the vendor directory.
3. Run `sls deploy`
