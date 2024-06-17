# Boxting

Boxting is an electronic voting application.

## Getting Started

Before running the app, you need to decrypt files locally. Run the following commands:

```bash
cd android
gpg --output android_keys.zip --decrypt android_keys.zip.gpg && jar xvf android_keys.zip && mv google-services.json app/
```

You will be prompted for the boxting passphrase.

To start development, run the following command:

```bash
dart run build_runner watch -d
```

## Dependencies

| Dependency | Version | Purpose |
| --- | --- | --- |
| flutter | sdk | Flutter SDK |
| equatable | 2.0.5 | State management |
| flutter_hooks | 0.20.5 | State management |
| hooks_riverpod | 2.5.1 | State management |
| riverpod_annotation | 2.3.5 | State management |
| provider | ^6.1.2 | State management |
| modal_bottom_sheet | ^3.0.0 | UI |
| lottie | ^3.1.2 | UI |
| cupertino_icons | ^1.0.8 | UI |
| fl_chart | ^0.68.0 | UI |
| flutter_datetime_picker_plus | ^2.2.0 | UI |
| dio | ^5.4.3+1 | Network |
| retrofit | 4.1.0 | Network |
| json_annotation | ^4.9.0 | Network |
| connectivity_plus | ^6.0.3 | Network |
| flutter_html | 3.0.0-beta.2 | Network |
| hive | 2.2.3 | Local storage/auth |
| hive_flutter | 1.1.0 | Local storage/auth |
| flutter_secure_storage | ^9.2.2 | Local storage/auth |
| local_auth | ^2.2.0 | Local storage/auth |
| package_info_plus | ^8.0.0 | Local storage/auth |
| intl | ^0.19.0 | Local storage/auth |
| get_it | ^7.7.0 | DI |
| firebase_core | ^3.0.0 | Firebase |
| firebase_remote_config | ^5.0.0 | Firebase |
| introduction_screen | ^3.1.14 | Other |
| quickalert | ^1.1.0 | Other |
| go_router | ^14.1.4 | Other |

## Dev Dependencies

| Dev Dependency | Version | Purpose |
| --- | --- | --- |
| flutter_test | sdk | Testing |
| flutter_launcher_icons | 0.13.1 | Launcher icon |
| json_serializable | ^6.8.0 | Code generation |
| build_runner | ^2.1.11 | Code generation |
| retrofit_generator | 8.1.0 | Code generation |
| riverpod_generator | 2.4.0 | Code generation |
| custom_lint | 0.6.4 | Code generation |
| riverpod_lint | 2.3.10 | Code generation |
| mockito | 5.4.4 | Testing |
| monarch | ^3.0.0 | Testing |
| state_notifier_test | ^0.0.9 | Testing |

