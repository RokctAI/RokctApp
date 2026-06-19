import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme.dart';

class ProductTypeTabs extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const ProductTypeTabs({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _buildTab(
            label: 'Single',
            type: 'single',
            isActive: selectedType == 'single',
            onTap: () => onTypeChanged('single'),
          ),
          8.horizontalSpace,
          _buildTab(
            label: 'Combo',
            type: 'combo',
            isActive: selectedType == 'combo',
            onTap: () => onTypeChanged('combo'),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String label,
    required String type,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(8.r),
        color: AppStyle.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            height: 44.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: isActive ? AppStyle.primary : AppStyle.white,
              border: Border.all(
                color: isActive ? AppStyle.primary : AppStyle.border,
                width: 1.r,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isActive ? AppStyle.white : AppStyle.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
