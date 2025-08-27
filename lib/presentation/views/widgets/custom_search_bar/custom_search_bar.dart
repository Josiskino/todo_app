import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final VoidCallback? onActionPressed;
  final Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search for an address...",
    this.onActionPressed,
    this.onChanged,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {}); // Pour mettre à jour l'UI quand le texte change
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey[850] : Colors.grey[100];
    final borderColor = isDarkMode ? Colors.grey[700] : Colors.grey[300];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocused = hasFocus;
                });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isFocused
                        ? Theme.of(context).primaryColor
                        : borderColor!,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                    if (_isFocused)
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  autofocus: false,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: _isFocused
                          ? Theme.of(context).primaryColor
                          : (isDarkMode ? Colors.grey[400] : Colors.grey[500]),
                      size: 22,
                    ),
                    suffixIcon: _controller.text.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.grey[700]
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: () {
                                _controller.clear();
                                if (widget.onChanged != null) {
                                  widget.onChanged!('');
                                }
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Icon(
                                Icons.close,
                                size: 16,
                                color: isDarkMode
                                    ? Colors.grey[300]
                                    : Colors.grey[600],
                              ),
                            ),
                          )
                        : null,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: isDarkMode
                          ? Colors.grey[500]?.withOpacity(0.7)
                          : Colors.grey[400]?.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: widget.onChanged,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor,
            elevation: 3,
            shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: widget.onActionPressed,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
