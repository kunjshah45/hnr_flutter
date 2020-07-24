# Architecture

## Widget | Components
Every Component is a Widget. In simple term, widgets are somewhat similar to components in react native.

The basic flow is to create a widget and pass props (value) while calling those widgets. Widgets can be made inside the screen as well or can be made in seperate folder as well.

Writing widget in seperate files is adviceable, as those widgets can be used in multiple Screens.

## Start point of application

Start point of the application is lib/main.dart

MaterialApp library is invoked which probably is something like Bootstrap for HTML.

## Scaffold

Scaffold has two properties – body and appBar.
Which respectively defines the content as name suggest, the application content and App Bar.

## States

States are something which takes care of re rendering objects when data is changed.

This is similar to reactjs and StatefulWidget will be auto re- rendered whenever its internal state is changed. The re-rendering is optimized by finding the difference between old and new widget UI and rendering only the necessary changes.


# How did I build.

## Installtion

- I installed the flutter sdk.
- Android SDK was already installed on my system
- Started with the documentation, learnt how to check of everything in setup is alright, create, and run the app
Commands for the are as follows
```
flutter doctor
```

```
flutter create yourAppName
```

```
flutter run
```

## Understanding the fundamentals

I was referring a video for undertanding the fundamentals of Flutter where i covered 
- Row
- Column
- MainAxisAlignment
- CrossAxisAlignment
- Widget
- Text
- IconButton
- Child
- Container
- Children

After this I googled for some library which can help me play music.
I finally found library called *audioplayers* which I am using in the project.
