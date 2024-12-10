import '/flutter_flow/flutter_flow_util.dart';
import 'name_page_widget.dart' show NamePageWidget;
import 'package:flutter/material.dart';

class NamePageModel extends FlutterFlowModel<NamePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
