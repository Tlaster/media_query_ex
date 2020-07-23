library media_query_ex;

import 'package:flutter/widgets.dart';

class MediaQueryExData {
  final Size size;
  MediaQueryExData({
    this.size = Size.zero,
  });

  static MediaQueryExData fromBoxConstraints(BoxConstraints constraints) {
    return MediaQueryExData(
      size: Size(constraints.maxWidth, constraints.maxHeight),
    );
  }
}

class MediaQueryEx extends InheritedWidget {
  final MediaQueryExData data;

  static MediaQueryExData of(BuildContext context, {bool nullOk = false}) {
    assert(context != null);
    assert(nullOk != null);
    final MediaQueryEx query =
        context.dependOnInheritedWidgetOfExactType<MediaQueryEx>();
    if (query != null) return query.data;
    if (nullOk) return null;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
          'MediaQueryEx.of() called with a context that does not contain a MediaQueryEx.'),
      ErrorDescription(
          'No MediaQueryEx ancestor could be found starting from the context that was passed '
          'to MediaQueryEx.of(). This can happen because you do not have a MeduaQueryExWidget'
          '(this widget introduce a MediaQueryEx), or it can happen '
          'if the context you use comes from a widget above those widgets.'),
      context.describeElement('The context used was')
    ]);
  }

  const MediaQueryEx({
    Widget child,
    @required this.data,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(MediaQueryEx oldWidget) => data != oldWidget.data;
}

class MeduaQueryExWidget extends StatefulWidget {
  final Widget child;

  const MeduaQueryExWidget({Key key, this.child}) : super(key: key);

  @override
  _MeduaQueryExWidgetState createState() => _MeduaQueryExWidgetState();
}

class _MeduaQueryExWidgetState extends State<MeduaQueryExWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MediaQueryEx(
          child: widget.child,
          data: MediaQueryExData.fromBoxConstraints(constraints),
        );
      },
    );
  }
}
