## Ram Flux: Flutter Client - Anonymous and Private Instant Messaging

The Ram Flux client is developed using Flutter, and the sdk uses github.com/ram-flux/rfi-sdk

Ram Flux is open source under the GPLv3 license

## Client SDK implementation

In the client SDK implementation, Ram Flux uses the BIP39 mnemonic algorithm to generate easy-to-remember mnemonics, allowing users to easily back up and restore keys. The mnemonic phrase is used to derive the seed by leveraging the hierarchical deterministic (HD) derivation path defined in BIP44. This seed is then used to generate a secp256k1 curve private key from which the public key is derived to be used as the account identifier. This approach ensures security while maintaining availability and recoverability.

## Current development status

The Ram Flux project is currently in the early stages of development, with several key features such as client-server authentication and message encryption still being designed and implemented. We are committed to maintaining transparency and openness by sharing progress updates and technical details with the community. We welcome feedback and suggestions from all parties and strive to build a decentralized, privacy-focused instant messaging platform.

## participate

As an open source project, Ram Flux enthusiastically invites developers to contribute their expertise and efforts to drive the project's growth and advancement. Let us explore the new paradigm of private communication in the Web3 era and provide users with a more secure, private, and humanized experience.


# ramflux_app

## develop 

```text
Flutter 3.19.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 68bfaea224 (2 weeks ago) • 2024-03-20 15:36:31 -0700
Engine • revision a5c24f538d
Tools • Dart 3.3.2 • DevTools 2.31.1
```

## FAQ

### F. Error (Xcode): could not compile `super_native_extensions` (lib) due to 58 previous errors xxx/ramflux_app/ios/Pods/SEVERE:0:0

### Q. [update rustc version](https://github.com/superlistapp/super_native_extensions/issues/298#issuecomment-1904182989)

```shell
rustup update
```
