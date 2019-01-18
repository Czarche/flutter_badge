# flutter_badge

A flutter badge widget.

## Installing

In your pubspec.yaml

```yaml
dependencies:
  flutter_badge: 0.0.1
```

## Usage

```dart
import 'package:flutter_badge/flutter_badge.dart';

Badge(
  text: '10',
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Text('Text'),
  ));
```

## Properties

| name | type |
| --- | --- |
| child | Widget |
| text | String |
| number | int |
| showshowExactNumber | bool |
| textStyle | TextStyle |
| align | Alignment |
| offsetX | double |
| offsetY | double |
| padding | double |
| backgroundColor | Color |
| borderRadius | double |
| borderWidth | double |
| borderColor | Color |
| customBorder | Border |
| showShadow | bool |
| customShadows | List<BoxShadow> |

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details