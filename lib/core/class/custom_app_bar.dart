
import 'package:flutter/material.dart';
import '../constances/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final bool showsearch;
  final bool showFilter;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchToggle;
  final bool isSearching;
  CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.showsearch = false,
    this.showFilter = false,
    this.onFilterTap,
    this.onSearchChanged,
    this.onSearchToggle,
    this.isSearching=false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: green,
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 16,
      title:isSearching
          ? TextField(
        autofocus: true,
        onChanged: onSearchChanged,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Search doctor...",
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ) :Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        if (showsearch)
          IconButton(
            icon: Icon( Icons.search,
                color: Colors.white),
            onPressed: onSearchToggle,
          ),
        if (showFilter)
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: onFilterTap,
          ),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Dentist",
    "Appointment",
    "Clinic",
    "Patient",
    "Doctor",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = searchTerms
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(title: Text(matchQuery[index])),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = searchTerms
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(title: Text(matchQuery[index])),
    );
  }
}


