import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:comms_sdk/comms_sdk.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> _todos = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _subtaskController = TextEditingController();

  DateTime? _selectedDeadline;
  bool _isReminderSet = false;
  String _selectedPriority = 'Medium';
  String _filterStatus = 'All'; // All, Pending, Completed
  late SharedPreferences _prefs;
  int? _editingId; // Track by ID instead of index

  String? _selectedCategory;
  List<Map<String, dynamic>> _currentSubtasks = [];

  final List<String> _priorities = ['Low', 'Medium', 'High'];

  @override
  void initState() {
    super.initState();
    _initNotifications();
    _loadTodos();
  }

  Future<void> _initNotifications() async {
    await LocalNotifications.initialize();
  }

  Future<void> _loadTodos() async {
    _prefs = await SharedPreferences.getInstance();
    final String? todosString = _prefs.getString('todos');
    if (todosString != null) {
      if (mounted) {
        setState(() {
          _todos = List<Map<String, dynamic>>.from(json.decode(todosString));
        });
      }
    }
  }

  Future<void> _saveTodos() async {
    await _prefs.setString('todos', json.encode(_todos));
  }

  void _saveTask() {
    if (_controller.text.trim().isEmpty) return;

    final String title = _controller.text.trim();
    final String? deadlineStr = _selectedDeadline?.toIso8601String();
    final String? category = _categoryController.text.trim().isNotEmpty
        ? _categoryController.text.trim()
        : _selectedCategory;

    setState(() {
      if (_editingId != null) {
        // Updating existing by ID
        final index = _todos.indexWhere((t) => t['id'] == _editingId);
        if (index != -1) {
          final int id = _editingId!;

          LocalNotifications.cancelNotification(id);

          _todos[index] = {
            'id': id,
            'title': title,
            'isDone': _todos[index]['isDone'],
            'deadline': deadlineStr,
            'reminder': _isReminderSet,
            'priority': _selectedPriority,
            'category': category,
            'subtasks': List<Map<String, dynamic>>.from(_currentSubtasks),
          };

          if (_isReminderSet && _selectedDeadline != null) {
            LocalNotifications.scheduleNotification(
              id: id,
              title: 'Task Reminder',
              body: title,
              scheduledDate: _selectedDeadline!,
            );
          }
        }
        _editingId = null;
      } else {
        // Adding new
        final int id = DateTime.now().millisecondsSinceEpoch.remainder(100000);
        _todos.add({
          'id': id,
          'title': title,
          'isDone': false,
          'deadline': deadlineStr,
          'reminder': _isReminderSet,
          'priority': _selectedPriority,
          'category': category,
          'subtasks': List<Map<String, dynamic>>.from(_currentSubtasks),
        });

        if (_isReminderSet && _selectedDeadline != null) {
          LocalNotifications.scheduleNotification(
            id: id,
            title: 'Task Reminder',
            body: title,
            scheduledDate: _selectedDeadline!,
          );
        }
      }

      // Reset form
      _controller.clear();
      _categoryController.clear();
      _subtaskController.clear();
      _selectedDeadline = null;
      _isReminderSet = false;
      _selectedPriority = 'Medium';
      _selectedCategory = null;
      _currentSubtasks = [];
    });
    _saveTodos();
  }

  void _addSubtask() {
    if (_subtaskController.text.trim().isNotEmpty) {
      setState(() {
        _currentSubtasks.add({
          'title': _subtaskController.text.trim(),
          'isDone': false,
        });
        _subtaskController.clear();
      });
    }
  }

  void _toggleSubtaskStatus(int taskIndex, int subtaskIndex) {
    setState(() {
      final subtasks = List<Map<String, dynamic>>.from(_todos[taskIndex]['subtasks'] ?? []);
      subtasks[subtaskIndex]['isDone'] = !(subtasks[subtaskIndex]['isDone'] ?? false);
      _todos[taskIndex]['subtasks'] = subtasks;
    });
    _saveTodos();
  }

  void _toggleFormSubtaskStatus(int subtaskIndex) {
      setState(() {
         _currentSubtasks[subtaskIndex]['isDone'] = !(_currentSubtasks[subtaskIndex]['isDone'] ?? false);
      });
  }

  void _startEditing(int index) {
    setState(() {
      final task = _todos[index];
      _editingId = task['id'];
      _controller.text = task['title'];
      _selectedPriority = task['priority'] ?? 'Medium';
      _isReminderSet = task['reminder'] ?? false;
      _selectedCategory = task['category'];
      _categoryController.text = task['category'] ?? '';

      // Load Subtasks
      if (task['subtasks'] != null) {
          _currentSubtasks = List<Map<String, dynamic>>.from(task['subtasks']);
      } else {
          _currentSubtasks = [];
      }

      if (task['deadline'] != null) {
        _selectedDeadline = DateTime.parse(task['deadline']);
      } else {
        _selectedDeadline = null;
      }
    });
  }

  void _cancelEditing() {
    setState(() {
      _editingId = null;
      _controller.clear();
      _categoryController.clear();
      _subtaskController.clear();
      _selectedDeadline = null;
      _isReminderSet = false;
      _selectedPriority = 'Medium';
      _selectedCategory = null;
      _currentSubtasks = [];
    });
  }

  void _toggleTodo(int index) {
    final int id = _todos[index]['id'] ?? 0;
    setState(() {
      _todos[index]['isDone'] = !_todos[index]['isDone'];
    });
    _saveTodos();

    if (_todos[index]['isDone']) {
      LocalNotifications.cancelNotification(id);
    } else {
       final bool hasReminder = _todos[index]['reminder'] ?? false;
       final String? deadlineStr = _todos[index]['deadline'];
       if (hasReminder && deadlineStr != null) {
           final DateTime deadlineDate = DateTime.parse(deadlineStr);
           if (deadlineDate.isAfter(DateTime.now())) {
              LocalNotifications.scheduleNotification(
                id: id,
                title: 'Task Reminder',
                body: _todos[index]['title'],
                scheduledDate: deadlineDate,
              );
           }
       }
    }
  }

  void _removeTodo(int index) {
    final int id = _todos[index]['id'] ?? 0;
    LocalNotifications.cancelNotification(id);

    setState(() {
      _todos.removeAt(index);
    });
    _saveTodos();
  }

  Future<void> _pickDeadline() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDeadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedDeadline != null
            ? TimeOfDay.fromDateTime(_selectedDeadline!)
            : TimeOfDay.now(),
      );

      if (pickedTime != null && mounted) {
        setState(() {
          _selectedDeadline = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  Color _getPriorityColor(String priority, ColorScheme colors) {
    switch (priority) {
      case 'High':
        return colors.error;
      case 'Medium':
        return colors.primary;
      case 'Low':
        return Colors.green;
      default:
        return colors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Filter todos
    final displayedTodos = _todos.asMap().entries.where((entry) {
      if (_filterStatus == 'Pending') return !entry.value['isDone'];
      if (_filterStatus == 'Completed') return entry.value['isDone'];
      return true; // All
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo & Task Manager',
          style: TextStyle(color: colors.onSurface, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Filter Chips
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: Row(
              children: ['All', 'Pending', 'Completed'].map((status) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: ChoiceChip(
                    label: Text(status),
                    selected: _filterStatus == status,
                    onSelected: (selected) {
                      setState(() {
                        _filterStatus = status;
                      });
                    },
                    selectedColor: colors.primary.withOpacity(0.2),
                  ),
                );
              }).toList(),
            ),
          ),

          // Form Area
          Container(
            padding: EdgeInsets.all(16.r),
            color: colors.surfaceContainerHighest.withOpacity(0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Add Button
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: _editingId != null ? 'Edit task title' : 'Add a new task',
                          hintStyle: TextStyle(color: colors.onSurface.withOpacity(0.5)),
                          filled: true,
                          fillColor: colors.surfaceContainerHighest,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        ),
                        style: TextStyle(color: colors.onSurface),
                      ),
                    ),
                    8.horizontalSpace,
                    IconButton(
                      icon: Icon(
                        _editingId != null ? Icons.check_circle : Icons.add_circle,
                        color: colors.primary,
                        size: 40.r
                      ),
                      onPressed: _saveTask,
                    ),
                  ],
                ),
                8.verticalSpace,

                // Category Input
                TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    hintText: 'Category (e.g. Work, Personal)',
                    hintStyle: TextStyle(color: colors.onSurface.withOpacity(0.5), fontSize: 13.sp),
                    filled: true,
                    fillColor: colors.surfaceContainerHighest,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                8.verticalSpace,

                // Subtasks input inside the form
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _subtaskController,
                        decoration: InputDecoration(
                          hintText: 'Add a subtask...',
                          hintStyle: TextStyle(color: colors.onSurface.withOpacity(0.5), fontSize: 13.sp),
                          filled: true,
                          fillColor: colors.surfaceContainerHighest,
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onSubmitted: (_) => _addSubtask(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, size: 24.r, color: colors.primary),
                      onPressed: _addSubtask,
                    )
                  ],
                ),
                if (_currentSubtasks.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.outline.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: _currentSubtasks.asMap().entries.map((entry) {
                         return CheckboxListTile(
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: entry.value['isDone'] ?? false,
                            onChanged: (val) => _toggleFormSubtaskStatus(entry.key),
                            title: Text(entry.value['title'], style: TextStyle(fontSize: 13.sp)),
                            secondary: IconButton(
                                icon: Icon(Icons.close, size: 16.r),
                                onPressed: () {
                                   setState(() {
                                       _currentSubtasks.removeAt(entry.key);
                                   });
                                }
                            ),
                         );
                      }).toList(),
                    ),
                  ),
                8.verticalSpace,

                // Options Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      value: _selectedPriority,
                      underline: const SizedBox(),
                      icon: Icon(Icons.flag, size: 18.r, color: _getPriorityColor(_selectedPriority, colors)),
                      items: _priorities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 13.sp)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedPriority = newValue;
                          });
                        }
                      },
                    ),

                    TextButton.icon(
                      onPressed: _pickDeadline,
                      icon: Icon(Icons.calendar_today, size: 16.r),
                      label: Text(
                        _selectedDeadline == null
                            ? 'Deadline'
                            : DateFormat('MMM dd, hh:mm a').format(_selectedDeadline!),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications, size: 16.r),
                        Switch(
                          value: _isReminderSet,
                          onChanged: (val) {
                            setState(() {
                              _isReminderSet = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                if (_editingId != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _cancelEditing,
                      child: Text('Cancel Edit', style: TextStyle(color: colors.error)),
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: displayedTodos.length,
              itemBuilder: (context, index) {
                final originalIndex = displayedTodos[index].key;
                final todo = displayedTodos[index].value;

                final bool isDone = todo['isDone'] ?? false;
                final String title = todo['title'];
                final String? deadlineStr = todo['deadline'];
                final bool hasReminder = todo['reminder'] ?? false;
                final String priority = todo['priority'] ?? 'Medium';
                final String? category = todo['category'];
                final List<Map<String, dynamic>> subtasks =
                    List<Map<String, dynamic>>.from(todo['subtasks'] ?? []);

                String? formattedDeadline;
                if (deadlineStr != null) {
                  final DateTime deadlineDate = DateTime.parse(deadlineStr);
                  formattedDeadline = DateFormat('MMM dd, hh:mm a').format(deadlineDate);
                }

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: colors.outline.withOpacity(0.1)),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: Checkbox(
                        value: isDone,
                        activeColor: colors.primary,
                        onChanged: (bool? value) {
                          _toggleTodo(originalIndex);
                        },
                      ),
                      title: InkWell(
                        onTap: () => _startEditing(originalIndex),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w500,
                            decoration: isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.verticalSpace,
                          Row(
                            children: [
                              Icon(Icons.flag, size: 14.r, color: _getPriorityColor(priority, colors)),
                              4.horizontalSpace,
                              Text(
                                priority,
                                style: TextStyle(fontSize: 12.sp, color: _getPriorityColor(priority, colors)),
                              ),

                              if (category != null && category.isNotEmpty) ...[
                                8.horizontalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: colors.secondaryContainer,
                                    borderRadius: BorderRadius.circular(4.r)
                                  ),
                                  child: Text(
                                    category,
                                    style: TextStyle(fontSize: 10.sp, color: colors.onSecondaryContainer),
                                  )
                                )
                              ],

                              if (formattedDeadline != null) ...[
                                12.horizontalSpace,
                                Icon(Icons.timer_outlined, size: 14.r, color: colors.onSurfaceVariant),
                                4.horizontalSpace,
                                Text(
                                  formattedDeadline,
                                  style: TextStyle(
                                    color: colors.onSurfaceVariant,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],

                              if (hasReminder && formattedDeadline != null) ...[
                                8.horizontalSpace,
                                Icon(Icons.notifications_active, size: 14.r, color: colors.primary),
                              ]
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline, color: colors.error),
                        onPressed: () => _removeTodo(originalIndex),
                      ),
                      children: subtasks.isEmpty ? [] : [
                        Padding(
                          padding: EdgeInsets.only(left: 32.w, right: 16.w, bottom: 8.h),
                          child: Column(
                            children: subtasks.asMap().entries.map((st) {
                              return CheckboxListTile(
                                dense: true,
                                controlAffinity: ListTileControlAffinity.leading,
                                value: st.value['isDone'] ?? false,
                                onChanged: (val) {
                                  _toggleSubtaskStatus(originalIndex, st.key);
                                },
                                title: Text(
                                  st.value['title'],
                                  style: TextStyle(
                                     fontSize: 13.sp,
                                     decoration: st.value['isDone'] == true ? TextDecoration.lineThrough : null
                                  )
                                ),
                              );
                            }).toList(),
                          )
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
