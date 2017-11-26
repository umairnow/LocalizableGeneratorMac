# SwiftLocGen

## Description

- This solution is for those who want to add localization in their iOS Applications. This solution creates localizable and swift files automatically which can be used in project directly.

## Requirements json
In order to use this solution you need to create json of your translations as follow:

```
{
    "translations": {
        "Sign_Up_Translation": {
            "name": {
                "en": "Forename Surname",
                "no": "Fornavn Etternavn"
                },
            "email": {
                "en": "E-mail address",
                "no": "E-postadresse"
                },
            "password": {
                "en": "Password",
                "no": "Passord"
            }
        },
        "Login_Translation": {
            "email": {
                "en": "E-mail address",
                "no": "E-postadresse"
        },
            "password": {
                "en": "Password",
                "no": "Passord"
            }
        }
    }
}
```
## Usage

- Run the project
- Enter the key first language
- Enter the key for sencond language
- Paste the json into text field
- Press generate to generate files.

## Generated File Sample

- You'll find 3 files in generated files directory `StringResources.swift`, `Localizable-lang1.strings` and `Localizable-lang2.strings`. You can use these files directly to your project for localization.

## Need Contribution
- Any kind of improvements, bug fixings or suggestions are welcome. Please make the pull request or open issue for your suggestion.
