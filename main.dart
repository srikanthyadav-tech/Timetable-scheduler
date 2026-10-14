

import 'package:flutter/material.dart';

void main() => runApp(const TimetableSchedulerApp());

const String appTitle = 'Timetable Scheduler';
const String appVersion = '1.1.0';

const List<String> days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
const List<String> periods = [
  '9:20 AM', '10:20 AM', '11:20 AM', '12:20 PM',
  '', '2:00 PM', '3:00 PM'
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

class _TimetableSchedulerAppState extends State<TimetableSchedulerApp> {
  bool darkMode = false;
  int page = 0;
  DateTime selectedDate = DateTime(2026, 7, 6);
  DateTime calendarMonth = DateTime(2026, 7, 1);

  final List<ClassEntry> classes = [
    ClassEntry(day: 'MON', time: '9:20 AM', subject: 'IDS', faculty: 'Bushra Tarannum', room: '109'),
    ClassEntry(day: 'MON', time: '10:20 AM', subject: 'DAA', faculty: 'G. M. Subhani', room: '109'),
    ClassEntry(day: 'MON', time: '11:20 AM', subject: 'CN', faculty: 'Dr. D. T. V. Dhanamjee Rao', room: '109'),
    ClassEntry(day: 'MON', time: '12:20 PM', subject: 'IPR', faculty: 'V. Ravindern(aik)', room: '109'),
    ClassEntry(day: 'MON', time: '2:00 PM', subject: 'BEFA', faculty: 'Ch. Kishore Kumar', room: '109'),
    ClassEntry(day: 'MON', time: '3:00 PM', subject: 'ML', faculty: 'Dr. P. Hari Krishna', room: '109'),

    ClassEntry(day: 'TUE', time: '9:20 AM', subject: 'DAA', faculty: 'G. M. Subhani', room: '109'),
    ClassEntry(day: 'TUE', time: '10:20 AM', subject: 'IPR', faculty: 'V. Ravindern(aik)', room: '109'),
    ClassEntry(day: 'TUE', time: '11:20 AM', subject: 'ML', faculty: 'Dr. P. Hari Krishna', room: '109'),
    ClassEntry(day: 'TUE', time: '12:20 PM', subject: 'CN', faculty: 'Dr. D. T. V. Dhanamjee Rao', room: '109'),
    ClassEntry(day: 'TUE', time: '2:00 PM', subject: 'IDS', faculty: 'Bushra Tarannum', room: '109'),
    ClassEntry(day: 'TUE', time: '3:00 PM', subject: 'IPR', faculty: 'V. Ravindern(aik)', room: '109'),

    ClassEntry(day: 'WED', time: '9:20 AM', subject: 'ML', faculty: 'Dr. P. Hari Krishna', room: '109'),
    ClassEntry(day: 'WED', time: '10:20 AM', subject: 'CN', faculty: 'Dr. D. T. V. Dhanamjee Rao', room: '109'),
    ClassEntry(day: 'WED', time: '11:20 AM', subject: 'IDS', faculty: 'Bushra Tarannum', room: '109'),
    ClassEntry(day: 'WED', time: '12:20 PM', subject: 'UDF LAB', faculty: 'K. Bhargavi', room: '130 & 132'),
    ClassEntry(day: 'WED', time: '2:00 PM', subject: 'UDF LAB', faculty: 'G. M. Subhani', room: '130 & 132'),
    ClassEntry(day: 'WED', time: '3:00 PM', subject: 'UDF LAB', faculty: 'R. Lavanya', room: '130 & 132'),

    ClassEntry(day: 'THU', time: '9:20 AM', subject: 'CN LAB', faculty: 'R. Lavanya', room: '16 & 17'),
    ClassEntry(day: 'THU', time: '10:20 AM', subject: 'CN LAB', faculty: 'U. Saritha', room: '16 & 17'),
    ClassEntry(day: 'THU', time: '11:20 AM', subject: 'DAA', faculty: 'G. M. Subhani', room: '109'),
    ClassEntry(day: 'THU', time: '12:20 PM', subject: 'IPR', faculty: 'V. Ravindern(aik)', room: '109'),
    ClassEntry(day: 'THU', time: '2:00 PM', subject: 'ML', faculty: 'Dr. P. Hari Krishna', room: '109'),
    ClassEntry(day: 'THU', time: '3:00 PM', subject: 'L / S / M', faculty: 'Training Faculty', room: '109'),

    ClassEntry(day: 'FRI', time: '9:20 AM', subject: 'ML', faculty: 'Dr. P. Hari Krishna', room: '109'),
    ClassEntry(day: 'FRI', time: '10:20 AM', subject: 'CN', faculty: 'Dr. D. T. V. Dhanamjee Rao', room: '109'),
    ClassEntry(day: 'FRI', time: '11:20 AM', subject: 'DAA', faculty: 'G. M. Subhani', room: '109'),
    ClassEntry(day: 'FRI', time: '12:20 PM', subject: 'BEFA', faculty: 'Ch. Kishore Kumar', room: '109'),
    ClassEntry(day: 'FRI', time: '2:00 PM', subject: 'IDS', faculty: 'Bushra Tarannum', room: '109'),
    ClassEntry(day: 'FRI', time: '3:00 PM', subject: 'IPR', faculty: 'V. Ravindern(aik)', room: '109'),

    ClassEntry(day: 'SAT', time: '9:20 AM', subject: 'IDS', faculty: 'Bushra Tarannum', room: '109'),
    ClassEntry(day: 'SAT', time: '10:20 AM', subject: 'CN', faculty: 'Dr. D. T. V. Dhanamjee Rao', room: '109'),
    ClassEntry(day: 'SAT', time: '11:20 AM', subject: 'ML LAB', faculty: 'Dr. P. Hari Krishna', room: '16 & 17'),
    ClassEntry(day: 'SAT', time: '12:20 PM', subject: 'ML LAB', faculty: 'M. Ravindran', room: '16 & 17'),
    ClassEntry(day: 'SAT', time: '2:00 PM', subject: 'DAA', faculty: 'G. M. Subhani', room: '109'),
    ClassEntry(day: 'SAT', time: '3:00 PM', subject: 'BEFA', faculty: 'Ch. Kishore Kumar', room: '109'),
  ];

  final List<TaskEntry> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF505D98)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7FC),
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
          title: const Text(
            'Timetable Scheduler',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
          onDestinationSelected: (index) => setState(() => page = index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.today_outlined), label: 'Daily'),
            NavigationDestination(icon: Icon(Icons.view_week_outlined), label: 'Weekly'),
            NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Monthly'),
            NavigationDestination(icon: Icon(Icons.people_outline), label: 'Faculty'),
            NavigationDestination(icon: Icon(Icons.task_alt), label: 'Tasks'),
            NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget buildPage() {
    switch (page) {
      case 1: return dailyPage();
      case 2: return weeklyPage();
      case 3: return monthlyPage();
      case 4: return facultyPage();
      case 5: return tasksPage();
      case 6: return settingsPage();
      default: return homePage();
    }
  }

  Widget heading(String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          if (subtitle != null) ...[
            const SizedBox(height: 5),
            Text(subtitle, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ],
        ],
      ),
    );
  }

  Widget homePage() {
    final completed = tasks.where((t) => t.completed).length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Timetable Scheduler', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Your college schedule and academic tasks in one place.'),
        const SizedBox(height: 8),
        const Text('Semester V • Section C • Academic Year 2026–27'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            statCard(Icons.schedule, '${classes.length}', 'Scheduled classes'),
            statCard(Icons.view_week, '6', 'Periods per day'),
            statCard(Icons.task_alt, '${tasks.length - completed}', 'Tasks remaining'),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Timetable', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('View your schedule by day, week, month or faculty.'),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    quickButton('Daily', Icons.today, 1),
                    quickButton('Weekly', Icons.view_week, 2),
                    quickButton('Monthly', Icons.calendar_month, 3),
                    quickButton('Faculty', Icons.people, 4),
                    quickButton('Tasks', Icons.task_alt, 5),
                    quickButton('Settings', Icons.settings, 6),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Semester Calendar'),
            subtitle: const Text('July 2026 – December 2026'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => setState(() => page = 3),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.task_alt),
            title: const Text('My Tasks'),
            subtitle: Text('$completed completed • ${tasks.length - completed} remaining'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => setState(() => page = 5),
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

  Widget statCard(IconData icon, String number, String label) {
    return SizedBox(
      width: 145,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              const SizedBox(height: 10),
              Text(number, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickButton(String label, IconData icon, int targetPage) {
    return FilledButton.tonalIcon(
      onPressed: () => setState(() => page = targetPage),
      icon: Icon(icon, size: 17),
      label: Text(label),
    );
  }

  String dayForDate(DateTime date) {
    const names = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return names[date.weekday - 1];
  }

  List<ClassEntry> entriesForDay(String day) =>
      classes.where((e) => e.day == day).toList();

  ClassEntry? entryFor(String day, String time) {
    for (final entry in classes) {
      if (entry.day == day && entry.time == time) return entry;
    }
    return null;
  }

  Widget dailyPage() {
    final day = dayForDate(selectedDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Daily Timetable', subtitle: '${selectedDate.day}/${selectedDate.month}/${selectedDate.year} • $day'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: const Text('Choose date'),
            onPressed: () async {
              final chosen = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2026, 7, 1),
                lastDate: DateTime(2026, 12, 31),
              );
              if (chosen != null) {
                setState(() {
                  selectedDate = chosen;
                  calendarMonth = DateTime(chosen.year, chosen.month, 1);
                });
              }
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              for (final time in periods)
                if (time.isEmpty)
                  const SizedBox(height: 12)
                else
                  dailyPeriodCard(
                    time,
                    entriesForDay(day).where((e) => e.time == time).isEmpty
                        ? null
                        : entriesForDay(day).firstWhere((e) => e.time == time),
                  ),
              if (entriesForDay(day).isEmpty)
                const Card(child: ListTile(title: Text('No classes scheduled for this day.'))),
            ],
          ),
        ),
      ],
    );
  }

  Widget dailyPeriodCard(String time, ClassEntry? entry) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: SizedBox(
          width: 78,
          child: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        title: Text(entry?.subject ?? 'Free Period', style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(entry == null ? 'No class scheduled' : '${entry.faculty}\nRoom ${entry.room}'),
        isThreeLine: entry != null,
        onTap: entry == null ? null : () => showClassDetails(entry),
      ),
    );
  }

  Widget weeklyPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Weekly Timetable', subtitle: 'Semester V • Section C • Monday–Saturday'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('The 1:00 PM column is intentionally blank. Tap a class for details.'),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: DataTable(
                border: TableBorder.all(color: Colors.grey),
                columnSpacing: 10,
                horizontalMargin: 8,
                dataRowMinHeight: 72,
                dataRowMaxHeight: 88,
                columns: [
                  const DataColumn(label: Text('DAY')),
                  for (final time in periods)
                    DataColumn(
                      label: SizedBox(
                        width: time.isEmpty ? 28 : 88,
                        child: Center(
                          child: Text(time, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                ],
                rows: [
                  for (final day in days)
                    DataRow(cells: [
                      DataCell(Text(day, style: const TextStyle(fontWeight: FontWeight.bold))),
                      for (final time in periods)
                        if (time.isEmpty)
                          const DataCell(SizedBox(width: 28, height: 70))
                        else
                          DataCell(
                            SizedBox(
                              width: 88,
                              child: Center(
                                child: entryFor(day, time) == null
                                    ? const Text('—', style: TextStyle(color: Colors.grey))
                                    : Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(entryFor(day, time)!.subject, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                          const SizedBox(height: 4),
                                          Text('(${entryFor(day, time)!.room})', style: const TextStyle(fontSize: 11)),
                                        ],
                                      ),
                              ),
                            ),
                            onTap: () {
                              final entry = entryFor(day, time);
                              if (entry != null) showClassDetails(entry);
                            },
                          ),
                    ]),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: FilledButton.icon(
            onPressed: showAddClassDialog,
            icon: const Icon(Icons.add),
            label: const Text('Add Class'),
          ),
        ),
      ],
    );
  }

  Widget monthlyPage() {
    final firstDay = DateTime(calendarMonth.year, calendarMonth.month, 1);
    final count = DateTime(calendarMonth.year, calendarMonth.month + 1, 0).day;
    final offset = firstDay.weekday - 1;
    final totalCells = ((offset + count + 6) ~/ 7) * 7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Monthly Calendar', subtitle: 'Tap a date to open that day’s timetable'),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (calendarMonth.month > 7) {
                  setState(() => calendarMonth = DateTime(calendarMonth.year, calendarMonth.month - 1, 1));
                }
              },
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Center(
                child: Text('${monthName(calendarMonth.month)} ${calendarMonth.year}', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
            ),
            IconButton(
              onPressed: () {
                if (calendarMonth.month < 12) {
                  setState(() => calendarMonth = DateTime(calendarMonth.year, calendarMonth.month + 1, 1));
                }
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
       
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child: Row(
    children: [
      for (final d in ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
        Expanded(
          child: Center(
            child: Text(
              d,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
    ],
  ),
),

        const SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.72,
            ),
            itemCount: totalCells,
            itemBuilder: (context, index) {
              final number = index - offset + 1;
              if (number < 1 || number > count) return const SizedBox.shrink();

              final date = DateTime(calendarMonth.year, calendarMonth.month, number);
              final isSelected = date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;
              final day = dayForDate(date);
              final classCount = day == 'SUN' ? 0 : entriesForDay(day).length;

              return InkWell(
                borderRadius: BorderRadius.circular(9),
                onTap: () {
                  setState(() {
                    selectedDate = date;
                    page = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
                    border: Border.all(color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$number', style: const TextStyle(fontWeight: FontWeight.bold)),
                      if (classCount > 0) ...[
                        const SizedBox(height: 4),
                        Icon(Icons.circle, size: 7, color: Theme.of(context).colorScheme.primary),
                        Text('$classCount classes', textAlign: TextAlign.center, style: const TextStyle(fontSize: 8)),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text('Semester: July–December 2026'),
        ),
      ],
    );
  }

  String monthName(int month) {
    const names = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return names[month];
  }

  Widget facultyPage() {
    final names = classes.map((e) => e.faculty).toSet().toList()..sort();

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        heading('Faculty Timetable', subtitle: 'Schedules grouped by faculty'),
        for (final faculty in names)
          Card(
            child: ExpansionTile(
              leading: const CircleAvatar(child: Icon(Icons.person_outline)),
              title: Text(faculty, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${classes.where((e) => e.faculty == faculty).length} periods'),
              children: [
                for (final entry in classes.where((e) => e.faculty == faculty))
                  ListTile(
                    title: Text('${entry.day} • ${entry.time} • ${entry.subject}'),
                    subtitle: Text('Room ${entry.room}'),
                    onTap: () => showClassDetails(entry),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  // TASK FEATURE: add, complete, edit and delete tasks.

  Widget tasksPage() {
    final completed = tasks.where((t) => t.completed).length;

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
          heading('My Tasks', subtitle: '$completed completed • ${tasks.length - completed} remaining'),
          if (tasks.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.task_alt, size: 48),
                    SizedBox(height: 12),
                    Text('No tasks yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('Add assignments, homework, project work or exam preparation.'),
                  ],
                ),
              ),
            ),
          for (int i = 0; i < tasks.length; i++)
            Card(
              child: CheckboxListTile(
                value: tasks[i].completed,
                onChanged: (value) => setState(() => tasks[i].completed = value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  tasks[i].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: tasks[i].completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (tasks[i].description.isNotEmpty) Text(tasks[i].description),
                    const SizedBox(height: 5),
                    Text('Due: ${formatDate(tasks[i].dueDate)}'),
                    Text(tasks[i].completed ? 'Completed' : dueLabel(tasks[i].dueDate)),
                  ],
                ),
                secondary: PopupMenuButton<String>(
                  onSelected: (choice) {
                    if (choice == 'edit') {
                      showTaskDialog(existing: tasks[i], index: i);
                    } else if (choice == 'delete') {
                      setState(() => tasks.removeAt(i));
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'edit', child: Text('Edit task')),
                    PopupMenuItem(value: 'delete', child: Text('Delete task')),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  String formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  String dueLabel(DateTime dueDate) {
    final today = DateTime.now();
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
    final current = DateTime(today.year, today.month, today.day);
    if (due.isBefore(current)) return 'Overdue';
    if (due == current) return 'Due today';
    return 'Upcoming';
  }

  void showTaskDialog({TaskEntry? existing, int? index}) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController(text: existing?.title ?? '');
    final descriptionController = TextEditingController(text: existing?.description ?? '');
    DateTime dueDate = existing?.dueDate ?? DateTime.now().add(const Duration(days: 1));

    showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, refreshDialog) => AlertDialog(
          title: Text(existing == null ? 'Add Task' : 'Edit Task'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Task title',
                      hintText: 'e.g. Complete Flutter assignment',
                      prefixIcon: Icon(Icons.edit_note),
                    ),
                    validator: (value) => value == null || value.trim().isEmpty ? 'Enter a task title' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.description_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.calendar_month),
                    label: Text('Due date: ${formatDate(dueDate)}'),
                    onPressed: () async {
                      final chosen = await showDatePicker(
                        context: context,
                        initialDate: dueDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (chosen != null) refreshDialog(() => dueDate = chosen);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                setState(() {
                  if (existing == null) {
                    tasks.add(TaskEntry(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      dueDate: dueDate,
                    ));
                  } else {
                    existing.title = titleController.text.trim();
                    existing.description = descriptionController.text.trim();
                    existing.dueDate = dueDate;
                  }
                });

                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(this.context).showSnackBar(
                  SnackBar(content: Text(existing == null ? 'Task added' : 'Task updated')),
                );
              },
              child: Text(existing == null ? 'Save Task' : 'Update Task'),
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
        heading('Settings', subtitle: 'Customize your timetable scheduler'),
        Card(
          child: SwitchListTile(
            secondary: Icon(darkMode ? Icons.dark_mode : Icons.light_mode),
            title: const Text('Dark / Light Mode'),
            subtitle: Text(darkMode ? 'Dark mode enabled' : 'Light mode enabled'),
            value: darkMode,
            onChanged: (value) => setState(() => darkMode = value),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.apps),
            title: Text('Application Name'),
            subtitle: Text('Timetable Scheduler'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Version'),
            subtitle: Text(appVersion),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text('Semester'),
            subtitle: Text('July 2026 – December 2026'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text('College Timings'),
            subtitle: Text('9:20 AM – 4:00 PM'),
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: showAddClassDialog,
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
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(entry.subject),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day: ${entry.day}'),
            Text('Time: ${entry.time}'),
            Text('Faculty: ${entry.faculty}'),
            Text('Room: ${entry.room}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              showEditClassDialog(entry);
            },
            child: const Text('Edit'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void showAddClassDialog() => showClassForm();

  void showEditClassDialog(ClassEntry entry) => showClassForm(existing: entry);

  void showClassForm({ClassEntry? existing}) {
    final formKey = GlobalKey<FormState>();
    String day = existing?.day ?? 'MON';
    String time = existing?.time ?? periods.first;
    final subjectController = TextEditingController(text: existing?.subject ?? '');
    final facultyController = TextEditingController(text: existing?.faculty ?? '');
    final roomController = TextEditingController(text: existing?.room ?? '109');

    showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, refreshDialog) => AlertDialog(
          title: Text(existing == null ? 'Add Class' : 'Edit Class'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                   initialValue: day,
                    decoration: const InputDecoration(labelText: 'Day'),
                    items: days.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                    onChanged: (value) => refreshDialog(() => day = value ?? 'MON'),
                  ),
                  DropdownButtonFormField<String>(
                   initialValue: time,
                    decoration: const InputDecoration(labelText: 'Period'),
                    items: periods.where((p) => p.isNotEmpty).map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                    onChanged: (value) => refreshDialog(() => time = value ?? periods.first),
                  ),
                  TextFormField(
                    controller: subjectController,
                    decoration: const InputDecoration(labelText: 'Subject / Lab'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Enter subject' : null,
                  ),
                  TextFormField(
                    controller: facultyController,
                    decoration: const InputDecoration(labelText: 'Faculty Name'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Enter faculty name' : null,
                  ),
                  TextFormField(
                    controller: roomController,
                    decoration: const InputDecoration(labelText: 'Room Number'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Enter room number' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                setState(() {
                  if (existing == null) {
                    classes.add(ClassEntry(
                      day: day,
                      time: time,
                      subject: subjectController.text.trim(),
                      faculty: facultyController.text.trim(),
                      room: roomController.text.trim(),
                    ));
                  } else {
                    existing.day = day;
                    existing.time = time;
                    existing.subject = subjectController.text.trim();
                    existing.faculty = facultyController.text.trim();
                    existing.room = roomController.text.trim();
                  }
                });

                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(this.context).showSnackBar(
                  SnackBar(content: Text(existing == null ? 'Class added' : 'Class updated')),
                );
              },
              child: Text(existing == null ? 'Add Class' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
