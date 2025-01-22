import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';

class QuillStyleScreen extends StatefulWidget {
  const QuillStyleScreen({super.key});

  @override
  State<QuillStyleScreen> createState() => _QuillStyleScreenState();
}

class _QuillStyleScreenState extends State<QuillStyleScreen> {
  final quill.QuillController titleController = quill.QuillController.basic();
  final quill.QuillController descriptionController =
      quill.QuillController.basic();
  final FocusNode focusNodeTitle = FocusNode();
  final FocusNode focusNodeDescription = FocusNode();

  quill.QuillController? activeController;

  @override
  void initState() {
    super.initState();
    focusNodeTitle.addListener(() {
      if (focusNodeTitle.hasFocus) {
        setState(() {
          activeController = titleController;
        });
      }
    });
    focusNodeDescription.addListener(() {
      if (focusNodeDescription.hasFocus) {
        setState(() {
          activeController = descriptionController;
        });
      }
    });
    activeController = titleController;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    focusNodeTitle.dispose();
    focusNodeDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var black = Colors.black;
    var grey = Colors.grey;
    var white = Colors.white;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Quill Style',
          style: TextStyle(color: white),
        )),
        backgroundColor: black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: black,
                border: Border.all(color: grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: height * 0.08,
                ),
                child: quill.QuillEditor.basic(
                  controller: titleController,
                  scrollController: ScrollController(),
                  focusNode: focusNodeTitle,
                  configurations: quill.QuillEditorConfigurations(
                    checkBoxReadOnly: false,
                    scrollable: true,
                    autoFocus: false,
                    expands: false,
                    padding: EdgeInsets.zero,
                    placeholder: 'Title',
                    customStyles: DefaultStyles(
                      paragraph: DefaultTextBlockStyle(
                        TextStyle(
                            color: white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                        const quill.HorizontalSpacing(0.0, 0),
                        const quill.VerticalSpacing(0, 0),
                        quill.VerticalSpacing.zero,
                        const BoxDecoration(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: black,
                border: Border.all(color: grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: height * 0.12,
                ),
                child: quill.QuillEditor.basic(
                  controller: descriptionController,
                  scrollController: ScrollController(),
                  focusNode: focusNodeDescription,
                  configurations: quill.QuillEditorConfigurations(
                    checkBoxReadOnly: false,
                    scrollable: true,
                    autoFocus: false,
                    expands: false,
                    padding: EdgeInsets.zero,
                    placeholder: 'Description',
                    customStyles: DefaultStyles(
                      paragraph: DefaultTextBlockStyle(
                        TextStyle(
                            color: white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                        const quill.HorizontalSpacing(0.0, 0),
                        const quill.VerticalSpacing(0, 0),
                        quill.VerticalSpacing.zero,
                        const BoxDecoration(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: white),
                  textTheme: const TextTheme(),
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        onSurface: white,
                      ),
                ),
                child: Row(
                  children: [
                    if (activeController != null)
                      QuillSimpleToolbar(
                        controller: activeController!,
                        configurations:
                            const QuillSimpleToolbarConfigurations(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
