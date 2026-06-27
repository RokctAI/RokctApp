import '../../../application/polaris/polaris_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../polaris_sdk.dart';
import 'package:flutter/material.dart';

class Step3DocumentUpload extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const Step3DocumentUpload({Key? key, required this.onNext}) : super(key: key);

  @override
  ConsumerState<Step3DocumentUpload> createState() =>
      _Step3DocumentUploadState();
}

class _Step3DocumentUploadState extends ConsumerState<Step3DocumentUpload> {
  bool _idFrontUploaded = false;
  bool _idBackUploaded = false;
  bool _bankStatementUploaded = false;
  bool _selfieUploaded = false;

  void _mockUpload(String type) {
    setState(() {
      if (type == 'front') _idFrontUploaded = true;
      if (type == 'back') _idBackUploaded = true;
      if (type == 'bank') _bankStatementUploaded = true;
      if (type == 'selfie') _selfieUploaded = true;
    });
  }

  bool get _allUploaded =>
      _idFrontUploaded &&
      _idBackUploaded &&
      _bankStatementUploaded &&
      _selfieUploaded;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Step 3: Document Upload',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildUploadTile(
            'ID Document Front',
            _idFrontUploaded,
            () => _mockUpload('front'),
          ),
          _buildUploadTile(
            'ID Document Back',
            _idBackUploaded,
            () => _mockUpload('back'),
          ),
          _buildUploadTile(
            'Bank Statement (PDF)',
            _bankStatementUploaded,
            () => _mockUpload('bank'),
          ),
          _buildUploadTile(
            'Selfie with ID',
            _selfieUploaded,
            () => _mockUpload('selfie'),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _allUploaded ? widget.onNext : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadTile(String label, bool uploaded, VoidCallback onUpload) {
    return ListTile(
      title: Text(label),
      trailing: uploaded
          ? Icon(
              Icons.check_circle,
              color: PolarisSDK.instance.config.theme.successColor,
            )
          : ElevatedButton(onPressed: onUpload, child: const Text('Upload')),
    );
  }
}
