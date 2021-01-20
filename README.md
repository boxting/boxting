# Boxting

## Compile and build the app

- Run on terminal `make build_runner`
- Run the app on emulator or physical device.

## Depedencies

- provider
- get_it
- firebase & firebase_remote_config
- dio & retrofit
- flutter_hooks
- flutter_html
- local_auth
- lottie
- json_annotation
- cool_alert
- ff_navigation_bar
- pedantic
- json_serializable
- mock_web_server
- mockito


## Run locally

### Decrypt files locally

`gpg --output android_keys.zip --decrypt android_keys.zip.gpg && jar xvf android_keys.zip && mv google-services.json app/`