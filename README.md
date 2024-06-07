# AWS IAM Role Configuration

This repository contains configurations for managing AWS IAM roles using Terraform. The JSON data specifies various roles, their associated policies, and managed policies for different AWS account IDs.

## JSON Structure

The JSON data has the following structure:

- **account_no**: A list of all AWS account IDs.

- **role_name**: Each role (e.g., `idp-admin-role`, `idp-dba-role`) contains the following attributes, with at least one policy being mandatory:
  1. **account_id (required)**: A list of account IDs that the role is associated with.
  2. **policies (optional)**: A list of customer-managed policies associated with the role.
      - Each policy is an object with the policy name and the path to the policy JSON file.
      - Place your customer-managed policies JSON file inside the `aws/customer-managed-policy-json` folder.
      - Example structure:
        ```json
        [
          {
            "name": "policy-name",
            "policy_json": "customer-managed-policy-json/policy-file.json"
          }
        ]
        ```
  3. **inline_policies (optional)**: A list of inline policies associated with the role.
      - Each inline policy is an object with the policy name and the path to the policy JSON file.
      - Place your inline policy JSON file inside the `aws/inline-policy-json` folder.
      - Example structure:
        ```json
        [
          {
            "inline-policy-name": "inline-policy-json/inline-policy-file.json"
          }
        ]
        ```
  4. **managed_policy (optional)**: A list of managed policy ARNs associated with the role.

## Example Configuration

Here is an example of the JSON configuration:

```json
{
  "account_no": ["533267148575", "992382837262", "211125473102", "333333333333", "1234567812321"],
  "idp-admin-role": {
    "account_id": ["533267148575", "992382837262"],
    "policies": [
      {
        "name": "dev-dba-full-access-policy",
        "policy_json": "customer-managed-policy-json/policy-dev-dba.json"
      },
      {
        "name": "dev-rds-full-access-policy",
        "policy_json": "customer-managed-policy-json/policy-dev-rds.json"
      }
    ],
    "inline_policies": [
      {
        "example-full-access-policy": "inline-policy-json/inline-policy-dev-jit.json"
      }
    ],
    "managed_policy": ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  },
  "idp-dba-role": {
    "account_id": ["992382837262", "533267148575"],
    "policies": [
      {
        "name": "dev-rds-full-access-policy",
        "policy_json": "customer-managed-policy-json/policy-dev-rds.json"
      }
    ],
    "inline_policies": [
      {
        "example-full-access-policy": "inline-policy-json/inline-policy-dev-dba.json"
      }
    ],
    "managed_policy": ["arn:aws:iam::aws:policy/AdministratorAccess"]
  }
}
