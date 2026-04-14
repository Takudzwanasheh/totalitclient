// sharedWidgets/custom_button.dart
import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary,
  outlined,
  text,
  danger,
  success,
  warning,
}

enum ButtonSize {
  small,
  medium,
  large,
  fullWidth,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
  });

  // Factory methods for common use cases
  factory CustomButton.primary({
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.primary,
      icon: icon,
      isLoading: isLoading,
    );
  }

  factory CustomButton.secondary({
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.secondary,
      icon: icon,
      isLoading: isLoading,
    );
  }

  factory CustomButton.outlined({
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.outlined,
      icon: icon,
      isLoading: isLoading,
    );
  }

  factory CustomButton.danger({
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.danger,
      icon: icon,
      isLoading: isLoading,
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (!isEnabled || isLoading) {
      return Colors.grey[300]!;
    }

    switch (type) {
      case ButtonType.primary:
        return Theme.of(context).primaryColor;
      case ButtonType.secondary:
        return Colors.grey[700]!;
      case ButtonType.outlined:
        return Colors.transparent;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.danger:
        return Colors.red;
      case ButtonType.success:
        return Colors.green;
      case ButtonType.warning:
        return Colors.orange;
    }
  }

  Color _getForegroundColor(BuildContext context) {
    if (!isEnabled || isLoading) {
      return Colors.grey[600]!;
    }

    switch (type) {
      case ButtonType.primary:
        return Colors.white;
      case ButtonType.secondary:
        return Colors.white;
      case ButtonType.outlined:
        return Theme.of(context).primaryColor;
      case ButtonType.text:
        return Theme.of(context).primaryColor;
      case ButtonType.danger:
        return Colors.white;
      case ButtonType.success:
        return Colors.white;
      case ButtonType.warning:
        return Colors.white;
    }
  }

  BorderSide _getBorderSide(BuildContext context) {
    if (type == ButtonType.outlined) {
      return BorderSide(
        color: isEnabled ? Theme.of(context).primaryColor : Colors.grey[400]!,
        width: 1.5,
      );
    }
    return BorderSide.none;
  }

  double _getHorizontalPadding() {
    switch (size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 24;
      case ButtonSize.large:
        return 32;
      case ButtonSize.fullWidth:
        return 16;
    }
  }

  double _getVerticalPadding() {
    switch (size) {
      case ButtonSize.small:
        return 8;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 16;
      case ButtonSize.fullWidth:
        return 16;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 13;
      case ButtonSize.medium:
        return 15;
      case ButtonSize.large:
        return 17;
      case ButtonSize.fullWidth:
        return 16;
    }
  }

  BorderRadius _getBorderRadius() {
    if (borderRadius != null) return borderRadius!;

    switch (size) {
      case ButtonSize.small:
        return BorderRadius.circular(6);
      case ButtonSize.medium:
        return BorderRadius.circular(8);
      case ButtonSize.large:
        return BorderRadius.circular(10);
      case ButtonSize.fullWidth:
        return BorderRadius.circular(8);
    }
  }

  double? _getButtonWidth() {
    if (width != null) return width;
    if (size == ButtonSize.fullWidth) return double.infinity;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final buttonContent = isLoading
        ? SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          _getForegroundColor(context),
        ),
      ),
    )
        : Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: _getFontSize() + 2,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: _getFontSize(),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );

    final button = TextButton(
      onPressed: (isEnabled && !isLoading && onPressed != null)
          ? onPressed
          : null,
      style: TextButton.styleFrom(
        backgroundColor: _getBackgroundColor(context),
        foregroundColor: _getForegroundColor(context),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(),
              vertical: _getVerticalPadding(),
            ),
        shape: RoundedRectangleBorder(
          borderRadius: _getBorderRadius(),
          side: _getBorderSide(context),
        ),
        elevation: (type == ButtonType.primary || type == ButtonType.danger ||
            type == ButtonType.success || type == ButtonType.warning)
            ? 2
            : 0,
        shadowColor: _getBackgroundColor(context).withOpacity(0.3),
        textStyle: TextStyle(
          fontSize: _getFontSize(),
          fontWeight: FontWeight.w600,
        ),
      ),
      child: buttonContent,
    );

    if (size == ButtonSize.fullWidth || width != null) {
      return SizedBox(
        width: _getButtonWidth(),
        height: height,
        child: button,
      );
    }

    return button;
  }
}