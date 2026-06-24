# Changelog

## [0.1.1](https://github.com/venky1912/venky-terraform-module-karpenter/compare/v0.1.0...v0.1.1) (2026-06-24)


### Bug Fixes

* pin provider versions to supported range ([#1](https://github.com/venky1912/venky-terraform-module-karpenter/issues/1)) ([7eb2de1](https://github.com/venky1912/venky-terraform-module-karpenter/commit/7eb2de1c8a9fd25cb90f9c588ee0d4f7c5f10617))

## [0.1.0] - 2026-06-24

### Added

- Initial release
- Karpenter IRSA IAM role with least-privilege policy
- SQS queue for node interruption handling
- EventBridge rules for spot, rebalance, health, and state changes
