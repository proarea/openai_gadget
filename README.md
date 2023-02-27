<img src="images/banner.png" />
<img src="https://img.shields.io/static/v1?label=built%20with&message=flutter&color=blue&logo=flutter" /> 
<img src="https://img.shields.io/static/v1?label=built%20with&message=dart&color=blue&logo=dart" />
<img src="https://img.shields.io/static/v1?label=built%20using&message=openai&color=white&logo=openai" />

## OpenAI Gadget
Explore the potential of OpenAI models with our repository of examples showcasing use cases. Our examples highlight the diverse ways in which OpenAI models can be applied. Discover the limitations and benefits of these models and how they can be used to solve real-world problems.    

Project uses:
- <a href="https://pub.dev/packages/envied">`envied`</a> for local secrets management.
- <a href="https://pub.dev/packages/get_it">`get_it`</a> for dependency management.
- <a href="https://pub.dev/packages/openai_client">`openai_client`</a> for OpenAI API interactions.

## Getting Started

Create `.env` file in the root of repository and add a single key-value pair with `OPENAI_TOKEN` as a key and your OpenAI token as a value:
```env
OPENAI_TOKEN="YOUR_OPENAI_TOKEN"
```

Then, run generate environment files using `build_runner`:
```console
flutter pub run build_runner build
```

After that, run the project on any available platform.