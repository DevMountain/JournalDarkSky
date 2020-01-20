#  DarkSky Journal

*Most large iOS apps consist of four major components. User Interface, Business Logic, Service and Storage.*
*This project will hit multiple different REST APIs and also persist data. In order to make our app "scalable" we will spread responsibilites out into all 4 layers.*

## User Interface
### Responsibilities
* Render everything that the user should see.
* Listen for all input from the user.
* Handle as little logic as possible - offload it to the business logic layer.
### Typically Contains
* ViewControllers (part of the "V" **not** the "C" in MVC)
* Custom Views

## Business Logic
### Responsibilities
* Receive inputs from the UI and coordinate them with the other layers (storage, service).
* Send updates back to UI for rendering.
* Acts as the backbone that ties the rest of the app together.
### Typically Contains
* Model Controllers

## Service
### Responsibilities
* Handle all external communication. (HTTP,  Bluetooth, GPS, iCloud/Firebase, etc.)
* Report back to the business logic layer.
### Typically Contains
* Service for each model (business logic layer asks WeatherService for Weather)
* Manager for each API (WeatherService asks CloudKitManager/URLSessionManager/FirebaseManager, etc. for Data)
* Transport Models (a custom verson of your model that encodes/decodes it for transportation. CKRecord, Codable version, etc.)

## Storage
### Responsibilities
* Persist data to disk.
### Typically Contains
* CoreData
* File persistence
* UserDefaults

## AppWide
* There will also be some files used "app wide".
* Extensions, Enums, Models, etc.
* Feel free to create folders for each of them or to group some into a Utilities/Library/AppWide folder.
### Example
* Models
* Views
* Controllers
* Services
* Storage
* Utilities
