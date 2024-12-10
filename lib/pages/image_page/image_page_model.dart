import '/flutter_flow/flutter_flow_util.dart';
import 'image_page_widget.dart' show ImagePageWidget;
import 'package:flutter/material.dart';

class ImagePageModel extends FlutterFlowModel<ImagePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();
  }
}
