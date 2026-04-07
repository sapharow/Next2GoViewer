# Next2GoViewer

`Next2GoViewer` is a small SwiftUI app that shows the next races to watch

The repo has two main parts:
- `App/` contains the app entry point
- `Next2Go/` contains the Swift package with models, services, view models, and UI

## Package layout

- `Model` holds shared domain types and service protocols
- `Services` talks to the API and keeps race data fresh
- `ViewModel` prepares data for the UI
- `Next2GoUI` contains the SwiftUI views

## How it works

The store keeps a sorted list of races and refreshes it when the visible data can change

The list screen filters races by category, hides expired races, and keeps only the first five visible items

The countdown labels update every second in the view model so the UI stays live between network refreshes

## Build

Build the app with `xcodebuild`:

```sh
xcodebuild -project "Next2GoViewer.xcodeproj" -scheme "Next2GoViewer" -destination "generic/platform=iOS Simulator" build
```

You can also open `Next2GoViewer.xcodeproj` in Xcode and run the `Next2GoViewer` scheme

## Tests

The repo includes tests for the package targets:
- `ModelTests`
- `ServicesTests`
- `ViewModelTests`

You can run them from Xcode

## Dependencies

- `Factory` for dependency injection
- `SFSafeSymbols` for typed SF Symbols
