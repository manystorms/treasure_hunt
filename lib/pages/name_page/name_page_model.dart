import '/flutter_flow/flutter_flow_util.dart';
import 'name_page_widget.dart' show NamePageWidget;
import 'package:flutter/material.dart';

class NamePageModel extends FlutterFlowModel<NamePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? playerNameFocusNode;
  TextEditingController? playerNameTextController;
  String? Function(BuildContext, String?)? playerNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    playerNameFocusNode?.dispose();
    playerNameTextController?.dispose();
  }
}
