import 'package:flutter/material.dart';

void main() => runApp(const TimetableSchedulerApp());

const appTitle = 'Timetable Scheduler';
const appVersion = '1.2.0';

const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

const periods = [
  '9:20 AM',
  '10:20 AM',
  '11:20 AM',
  '12:20 PM',
  '',
  '2:00 PM',
  '3:00 PM',
];

class ClassEntry {
  String day, time, subject, faculty, room;

  ClassEntry({
    required this.day,
    required this.time,
    required this.subject,
    required this.faculty,
    required this.room,
  });
}

class TaskEntry {
  String title, description;
  DateTime dueDate;
  bool completed;

  TaskEntry({
    required this.title,
    required this.description,
    required this.dueDate,
    this.completed = false,
  });
}

class TimetableSchedulerApp extends StatefulWidget {
  const TimetableSchedulerApp({super.key});

  @override
  State<TimetableSchedulerApp> createState() =>
      _TimetableSchedulerAppState();
}

class _TimetableSchedulerAppState
    extends State<TimetableSchedulerApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  bool darkMode = false;
  int page = 0;

  DateTime selectedDate = DateTime(2026, 7, 6);
  DateTime calendarMonth = DateTime(2026, 7, 1);

  final List<ClassEntry> classes = [
    ClassEntry(
      day: 'MON',
      time: '9:20 AM',
      subject: 'IDS',
      faculty: 'Bushra Tarannum',
      room: '109',
    ),
    ClassEntry(
      day: 'MON',
      time: '10:20 AM',
      subject: 'DAA',
      faculty: 'G. M. Subhani',
      room: '109',
    ),
    ClassEntry(
      day: 'MON',
      time: '11:20 AM',
      subject: 'CN',
      faculty: 'Dr. D. T. V. Dhanamjee Rao',
      room: '109',
    ),
    ClassEntry(
      day: 'MON',
      time: '12:20 PM',
      subject: 'IPR',
      faculty: 'V. Ravindern(aik)',
      room: '109',
    ),
    ClassEntry(
      day: 'MON',
      time: '2:00 PM',
      subject: 'BEFA',
      faculty: 'Ch. Kishore Kumar',
      room: '109',
    ),
    ClassEntry(
      day: 'MON',
      time: '3:00 PM',
      subject: 'ML',
      faculty: 'Dr. P. Hari Krishna',
      room: '109',
    ),
    ClassEntry(
      day: 'TUE',
      time: '9:20 AM',
      subject: 'DAA',
      faculty: 'G. M. Subhani',
      room: '109',
    ),
    ClassEntry(
      day: 'TUE',
      time: '10:20 AM',
      subject: 'IPR',
      faculty: 'V. Ravindern(aik)',
      room: '109',
    ),
    ClassEntry(
      day: 'TUE',
      time: '11:20 AM',
      subject: 'ML',
      faculty: 'Dr. P. Hari Krishna',
      room: '109',
    ),
    ClassEntry(
      day: 'TUE',
      time: '12:20 PM',
      subject: 'CN',
      faculty: 'Dr. D. T. V. Dhanamjee Rao',
      room: '109',
    ),
    ClassEntry(
      day: 'TUE',
      time: '2:00 PM',
      subject: 'IDS',
      faculty: 'Bushra Tarannum',
      room: '109',
    ),
    ClassEntry(
      day: 'TUE',
      time: '3:00 PM',
      subject: 'IPR',
      faculty: 'V. Ravindern(aik)',
      room: '109',
    ),
    ClassEntry(
      day: 'WED',
      time: '9:20 AM',
      subject: 'ML',
      faculty: 'Dr. P. Hari Krishna',
      room: '109',
    ),
    ClassEntry(
      day: 'WED',
      time: '10:20 AM',
      subject: 'CN',
      faculty: 'Dr. D. T. V. Dhanamjee Rao',
      room: '109',
    ),
    ClassEntry(
      day: 'WED',
      time: '11:20 AM',
      subject: 'IDS',
      faculty: 'Bushra Tarannum',
      room: '109',
    ),
    ClassEntry(
      day: 'WED',
      time: '12:20 PM',
      subject: 'UDF LAB',
      faculty: 'K. Bhargavi',
      room: '130 & 132',
    ),
    ClassEntry(
      day: 'WED',
      time: '2:00 PM',
      subject: 'UDF LAB',
      faculty: 'G. M. Subhani',
      room: '130 & 132',
    ),
    ClassEntry(
      day: 'WED',
      time: '3:00 PM',
      subject: 'UDF LAB',
      faculty: 'R. Lavanya',
      room: '130 & 132',
    ),
    ClassEntry(
      day: 'THU',
      time: '9:20 AM',
      subject: 'CN LAB',
      faculty: 'R. Lavanya',
      room: '16 & 17',
    ),
    ClassEntry(
      day: 'THU',
      time: '10:20 AM',
      subject: 'CN LAB',
      faculty: 'U. Saritha',
      room: '16 & 17',
    ),
    ClassEntry(
      day: 'THU',
      time: '11:20 AM',
      subject: 'DAA',
      faculty: 'G. M. Subhani',
      room: '109',
    ),
    ClassEntry(
      day: 'THU',
      time: '12:20 PM',
      subject: 'IPR',
      faculty: 'V. Ravindern(aik)',
      room: '109',
    ),
    ClassEntry(
      day: 'THU',
      time: '2:00 PM',
      subject: 'ML',
      faculty: 'Dr. P. Hari Krishna',
      room: '109',
    ),
    ClassEntry(
      day: 'THU',
      time: '3:00 PM',
      subject: 'L / S / M',
      faculty: 'Training Faculty',
      room: '109',
    ),
    ClassEntry(
      day: 'FRI',
      time: '9:20 AM',
      subject: 'ML',
      faculty: 'Dr. P. Hari Krishna',
      room: '109',
    ),
    ClassEntry(
      day: 'FRI',
      time: '10:20 AM',
      subject: 'CN',
      faculty: 'Dr. D. T. V. Dhanamjee Rao',
      room: '109',
    ),
    ClassEntry(
      day: 'FRI',
      time: '11:20 AM',
      subject: 'DAA',
      faculty: 'G. M. Subhani',
      room: '109',
    ),
    ClassEntry(
      day: 'FRI',
      time: '12:20 PM',
      subject: 'BEFA',
      faculty: 'Ch. Kishore Kumar',
      room: '109',
    ),
    ClassEntry(
      day: 'FRI',
      time: '2:00 PM',
      subject: 'IDS',
      faculty: 'Bushra Tarannum',
      room: '109',
    ),
    ClassEntry(
      day: 'FRI',
      time: '3:00 PM',
      subject: 'IPR',
      faculty: 'V. Ravindern(aik)',
      room: '109',
    ),
    ClassEntry(
      day: 'SAT',
      time: '9:20 AM',
      subject: 'IDS',
      faculty: 'Bushra Tarannum',
      room: '109',
    ),
    ClassEntry(
      day: 'SAT',
      time: '10:20 AM',
      subject: 'CN',
      faculty: 'Dr. D. T. V. Dhanamjee Rao',
      room: '109',
    ),
    ClassEntry(
      day: 'SAT',
      time: '11:20 AM',
      subject: 'ML LAB',
      faculty: 'Dr. P. Hari Krishna',
      room: '16 & 17',
    ),
    ClassEntry(
      day: 'SAT',
      time: '12:20 PM',
      subject: 'ML LAB',
      faculty: 'M. Ravindran',
      room: '16 & 17',
    ),
    ClassEntry(
      day: 'SAT',
      time: '2:00 PM',
      subject: 'DAA',
      faculty: 'G. M. Subhani',
      room: '109',
    ),
    ClassEntry(
      day: 'SAT',
      time: '3:00 PM',
      subject: 'BEFA',
      faculty: 'Ch. Kishore Kumar',
      room: '109',
    ),
  ];

  final List<TaskEntry> tasks = [];

  BuildContext get dialogContext =>
      navigatorKey.currentState!.overlay!.context;

  void notify(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF505D98),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8796E8),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => setState(() => page = 6),
            ),
          ],
        ),
        body: SafeArea(child: buildPage()),
        bottomNavigationBar: NavigationBar(
          selectedIndex: page,
          onDestinationSelected: (value) {
            setState(() => page = value);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.today_outlined),
              label: 'Daily',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_week_outlined),
              label: 'Weekly',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Monthly',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline),
              label: 'Faculty',
            ),
            NavigationDestination(
              icon: Icon(Icons.task_alt),
              label: 'Tasks',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage() {
    switch (page) {
      case 1:
        return dailyPage();
      case 2:
        return weeklyPage();
      case 3:
        return monthlyPage();
      case 4:
        return facultyPage();
      case 5:
        return tasksPage();
      case 6:
        return settingsPage();
      default:
        return homePage();
    }
  }

  Widget heading(String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 5),
            Text(subtitle),
          ],
        ],
      ),
    );
  }

  Widget homePage() {
    final completed = tasks.where((task) => task.completed).length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          appTitle,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your college schedule and academic tasks in one place.',
        ),
        const SizedBox(height: 8),
        const Text('Semester V • Section C • Academic Year 2026–27'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            statCard(
              '${classes.length}',
              'Scheduled classes',
              Icons.schedule,
            ),
            statCard('6', 'Periods per day', Icons.view_week),
            statCard(
              '${tasks.length - completed}',
              'Tasks remaining',
              Icons.task_alt,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                quickButton('Daily', 1),
                quickButton('Weekly', 2),
                quickButton('Monthly', 3),
                quickButton('Faculty', 4),
                quickButton('Tasks', 5),
                quickButton('Settings', 6),
              ],
            ),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text('College Timings'),
            subtitle: Text('9:20 AM – 4:00 PM • Monday–Saturday'),
          ),
        ),
      ],
    );
  }

  Widget statCard(String value, String label, IconData icon) {
    return SizedBox(
      width: 145,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickButton(String label, int targetPage) {
    return FilledButton.tonal(
      onPressed: () => setState(() => page = targetPage),
      child: Text(label),
    );
  }

  String dayForDate(DateTime date) {
    const names = [
      'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'
    ];
    return names[date.weekday - 1];
  }

  List<ClassEntry> entriesForDay(String day) {
    return classes.where((entry) => entry.day == day).toList();
  }

  ClassEntry? entryFor(String day, String time) {
    for (final entry in classes) {
      if (entry.day == day && entry.time == time) {
        return entry;
      }
    }
    return null;
  }

  Widget dailyPage() {
    final day = dayForDate(selectedDate);
final isSunday = selectedDate.weekday == DateTime.sunday;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'Daily Timetable',
          subtitle:
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year} • $day',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: const Text('Choose date'),
            onPressed: () async {
              final chosen = await showDatePicker(
                context: dialogContext,
                initialDate: selectedDate,
                firstDate: DateTime(2026, 7, 1),
                lastDate: DateTime(2026, 12, 31),
              );

              if (chosen != null) {
                setState(() {
                  selectedDate = chosen;
                  calendarMonth = DateTime(
                    chosen.year,
                    chosen.month,
                    1,
                  );
                });
              }
            },
          ),
        ),
                if (isSunday)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Sunday — No classes scheduled.'),
          ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              for (final time in periods)
                if (time.isEmpty)
                  const SizedBox(height: 12)
                else
                  dailyPeriodCard(time, entryFor(day, time)),
            ],
          ),
        ),
      ],
    );
  }

  Widget dailyPeriodCard(String time, ClassEntry? entry) {
    final day = dayForDate(selectedDate);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: SizedBox(
          width: 78,
          child: Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(entry?.subject ?? 'Free Period'),
        subtitle: Text(
          entry == null
              ? 'No class scheduled'
              : '${entry.faculty}\nRoom ${entry.room}',
        ),
        isThreeLine: entry != null,
        onTap: () {
          if (entry == null) {
            showClassForm(day: day, time: time);
          } else {
            showClassDetails(entry);
          }
        },
        trailing: IconButton(
          tooltip: entry == null ? 'Add class' : 'Edit class',
          icon: Icon(
            entry == null
                ? Icons.add_circle_outline
                : Icons.edit_outlined,
          ),
          onPressed: () {
            if (entry == null) {
              showClassForm(day: day, time: time);
            } else {
              showClassForm(existing: entry);
            }
          },
        ),
      ),
    );
  }

  Widget weeklyPage() {
    return Column(
      children: [
        heading(
          'Weekly Timetable',
          subtitle: 'Semester V • Section C • Monday–Saturday',
        ),
        const Text('Tap a cell to add or edit a class.'),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  const DataColumn(label: Text('DAY')),
                  for (final time in periods)
                    DataColumn(label: Text(time)),
                ],
                rows: [
                  for (final day in days)
                    DataRow(
                      cells: [
                        DataCell(Text(day)),
                        for (final time in periods)
                          if (time.isEmpty)
                            const DataCell(SizedBox(width: 20))
                          else
                            DataCell(
                              SizedBox(
                                width: 85,
                                child: Text(
                                  entryFor(day, time)?.subject ?? '—',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onTap: () {
                                final entry = entryFor(day, time);
                                if (entry == null) {
                                  showClassForm(day: day, time: time);
                                } else {
                                  showClassForm(existing: entry);
                                }
                              },
                            ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FilledButton.icon(
            onPressed: () => showClassForm(),
            icon: const Icon(Icons.add),
            label: const Text('Add Class'),
          ),
        ),
      ],
    );
  }

  Widget monthlyPage() {
    final count = DateTime(
      calendarMonth.year,
      calendarMonth.month + 1,
      0,
    ).day;

    final offset =
        DateTime(calendarMonth.year, calendarMonth.month, 1).weekday - 1;

    final totalCells = ((offset + count + 6) ~/ 7) * 7;

    return Column(
      children: [
        heading(
          'Monthly Calendar',
          subtitle: 'Choose a date to view its timetable',
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (calendarMonth.month > 7) {
                  setState(() {
                    calendarMonth = DateTime(
                      calendarMonth.year,
                      calendarMonth.month - 1,
                      1,
                    );
                  });
                }
              },
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '${monthName(calendarMonth.month)} ${calendarMonth.year}',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (calendarMonth.month < 12) {
                  setState(() {
                    calendarMonth = DateTime(
                      calendarMonth.year,
                      calendarMonth.month + 1,
                      1,
                    );
                  });
                }
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: totalCells,
            itemBuilder: (context, index) {
              final number = index - offset + 1;

              if (number < 1 || number > count) {
                return const SizedBox.shrink();
              }

              return InkWell(
                onTap: () {
                  setState(() {
                    selectedDate = DateTime(
                      calendarMonth.year,
                      calendarMonth.month,
                      number,
                    );
                    page = 1;
                  });
                },
                child: Card(
                  child: Center(child: Text('$number')),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text('Semester: July–December 2026'),
        ),
      ],
    );
  }

  String monthName(int month) {
    const names = [
      '',
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return names[month];
  }

  Widget facultyPage() {
    final names = classes.map((entry) => entry.faculty).toSet().toList()
      ..sort();

    return ListView(
      children: [
        heading('Faculty Timetable'),
        for (final name in names)
          ExpansionTile(
            title: Text(name),
            children: [
              for (final entry
                  in classes.where((entry) => entry.faculty == name))
                ListTile(
                  title: Text(
                    '${entry.day} • ${entry.time} • ${entry.subject}',
                  ),
                  subtitle: Text('Room ${entry.room}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () => showClassForm(existing: entry),
                ),
            ],
          ),
      ],
    );
  }
    Widget tasksPage() {
    final completed = tasks.where((task) => task.completed).length;

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showTaskDialog(),
        icon: const Icon(Icons.add_task),
        label: const Text('Add Task'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          heading(
            'My Tasks',
            subtitle:
                '$completed completed • ${tasks.length - completed} remaining',
          ),
          if (tasks.isEmpty)
            const ListTile(
              leading: Icon(Icons.task_alt),
              title: Text('No tasks yet'),
              subtitle: Text('Tap Add Task to create one.'),
            ),
          for (int i = 0; i < tasks.length; i++)
            Card(
              child: CheckboxListTile(
                value: tasks[i].completed,
                onChanged: (value) {
                  setState(() {
                    tasks[i].completed = value ?? false;
                  });
                },
                title: Text(
                  tasks[i].title,
                  style: TextStyle(
                    decoration: tasks[i].completed
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                subtitle: Text(
                  '${tasks[i].description}\n'
                  'Due: ${formatDate(tasks[i].dueDate)}',
                ),
                secondary: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      showTaskDialog(existing: tasks[i]);
                    } else if (value == 'delete') {
                      setState(() => tasks.removeAt(i));
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit task'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete task'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  void showTaskDialog({TaskEntry? existing}) {
    final formKey = GlobalKey<FormState>();
    final titleController =
        TextEditingController(text: existing?.title ?? '');
    final descriptionController =
        TextEditingController(text: existing?.description ?? '');
    DateTime dueDate =
        existing?.dueDate ?? DateTime.now().add(const Duration(days: 1));

    showDialog<void>(
      context: dialogContext,
      useRootNavigator: true,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, refreshDialog) => AlertDialog(
          title: Text(existing == null ? 'Add Task' : 'Edit Task'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Task title',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Enter a task title'
                            : null,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                    ),
                    maxLines: 3,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final chosen = await showDatePicker(
                        context: dialogContext,
                        initialDate: dueDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );

                      if (chosen != null) {
                        refreshDialog(() => dueDate = chosen);
                      }
                    },
                    child: Text('Due date: ${formatDate(dueDate)}'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                setState(() {
                  if (existing == null) {
                    tasks.add(
                      TaskEntry(
                        title: titleController.text.trim(),
                        description: descriptionController.text.trim(),
                        dueDate: dueDate,
                      ),
                    );
                  } else {
                    existing.title = titleController.text.trim();
                    existing.description =
                        descriptionController.text.trim();
                    existing.dueDate = dueDate;
                  }
                });

                Navigator.of(dialogContext).pop();
                notify(existing == null ? 'Task added' : 'Task updated');

                titleController.dispose();
                descriptionController.dispose();
              },
              child: Text(
                existing == null ? 'Save Task' : 'Save Changes',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        heading('Settings'),
        SwitchListTile(
          title: const Text('Dark / Light Mode'),
          value: darkMode,
          onChanged: (value) {
            setState(() => darkMode = value);
          },
        ),
        const ListTile(
          title: Text('Application'),
          subtitle: Text('$appTitle • $appVersion'),
        ),
        const ListTile(
          title: Text('Semester'),
          subtitle: Text('July–December 2026'),
        ),
        FilledButton.icon(
          onPressed: () => showClassForm(),
          icon: const Icon(Icons.add),
          label: const Text('Add Class'),
        ),
        OutlinedButton.icon(
          onPressed: () => setState(() => page = 5),
          icon: const Icon(Icons.task_alt),
          label: const Text('Manage Tasks'),
        ),
      ],
    );
  }

  void showClassDetails(ClassEntry entry) {
    showDialog<void>(
      context: dialogContext,
      useRootNavigator: true,
      builder: (dialogContext) => AlertDialog(
        title: Text(entry.subject),
        content: Text(
          'Day: ${entry.day}\n'
          'Time: ${entry.time}\n'
          'Faculty: ${entry.faculty}\n'
          'Room: ${entry.room}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              showClassForm(existing: entry);
            },
            child: const Text('Edit'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void showClassForm({
    ClassEntry? existing,
    String? day,
    String? time,
  }) {
    final formKey = GlobalKey<FormState>();

    String selectedDay = day ?? existing?.day ?? 'MON';
    String selectedTime = time ?? existing?.time ?? periods.first;

    final subjectController =
        TextEditingController(text: existing?.subject ?? '');
    final facultyController =
        TextEditingController(text: existing?.faculty ?? '');
    final roomController =
        TextEditingController(text: existing?.room ?? '109');

    showDialog<void>(
      context: dialogContext,
      useRootNavigator: true,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, refreshDialog) => AlertDialog(
          title: Text(existing == null ? 'Add Class' : 'Edit Class'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedDay,
                    decoration: const InputDecoration(labelText: 'Day'),
                    items: days
                        .map(
                          (day) => DropdownMenuItem(
                            value: day,
                            child: Text(day),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      refreshDialog(
                        () => selectedDay = value ?? 'MON',
                      );
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedTime,
                    decoration: const InputDecoration(labelText: 'Period'),
                    items: periods
                        .where((period) => period.isNotEmpty)
                        .map(
                          (period) => DropdownMenuItem(
                            value: period,
                            child: Text(period),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      refreshDialog(
                        () => selectedTime = value ?? periods.first,
                      );
                    },
                  ),
                  TextFormField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                      labelText: 'Subject / Lab',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Enter subject'
                            : null,
                  ),
                  TextFormField(
                    controller: facultyController,
                    decoration: const InputDecoration(
                      labelText: 'Faculty Name',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Enter faculty name'
                            : null,
                  ),
                  TextFormField(
                    controller: roomController,
                    decoration: const InputDecoration(
                      labelText: 'Room Number',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Enter room number'
                            : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                final duplicate = classes.any(
                  (entry) =>
                      entry != existing &&
                      entry.day == selectedDay &&
                      entry.time == selectedTime,
                );

                if (duplicate) {
                  notify(
                    'A class already exists at that day and time. '
                    'Choose another period.',
                  );
                  return;
                }

                setState(() {
                  if (existing == null) {
                    classes.add(
                      ClassEntry(
                        day: selectedDay,
                        time: selectedTime,
                        subject: subjectController.text.trim(),
                        faculty: facultyController.text.trim(),
                        room: roomController.text.trim(),
                      ),
                    );
                  } else {
                    existing.day = selectedDay;
                    existing.time = selectedTime;
                    existing.subject = subjectController.text.trim();
                    existing.faculty = facultyController.text.trim();
                    existing.room = roomController.text.trim();
                  }
                });

                Navigator.of(dialogContext).pop();
                notify(existing == null ? 'Class added' : 'Class updated');

                subjectController.dispose();
                facultyController.dispose();
                roomController.dispose();
              },
              child: Text(
                existing == null ? 'Add Class' : 'Save Changes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
