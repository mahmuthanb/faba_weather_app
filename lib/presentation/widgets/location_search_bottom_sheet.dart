import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';

class LocationSearchBottomSheet extends StatefulWidget {
  final HomeViewModel viewModel;

  const LocationSearchBottomSheet({super.key, required this.viewModel});

  static Future<void> show(BuildContext context, HomeViewModel viewModel) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => LocationSearchBottomSheet(viewModel: viewModel),
    );
  }

  @override
  State<LocationSearchBottomSheet> createState() =>
      _LocationSearchBottomSheetState();
}

class _LocationSearchBottomSheetState extends State<LocationSearchBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  String? _error;
  List<String> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadRecentSearches() async {
    final searches = await StorageService.getRecentSearches();
    setState(() {
      _recentSearches = searches;
    });
  }

  Future<void> _searchCity(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await widget.viewModel.getCurrentWeather(query);
      await StorageService.addRecentSearch(query);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildRecentSearches() {
    final l10n = AppLocalizations.of(context);

    if (_recentSearches.isEmpty) {
      return Center(
        child: Text(
          l10n.noRecentSearches,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _recentSearches.length,
      itemBuilder: (context, index) {
        final search = _recentSearches[index];
        return ListTile(
          leading: const Icon(Icons.history, color: Colors.white70),
          title: Text(search, style: const TextStyle(color: Colors.white)),
          trailing: IconButton(
            icon: const Icon(Icons.close, color: Colors.white70, size: 20),
            onPressed: () async {
              setState(() {
                _recentSearches.removeAt(index);
              });
              await StorageService.clearRecentSearches();
              for (var search in _recentSearches) {
                await StorageService.addRecentSearch(search);
              }
            },
          ),
          onTap: () => _searchCity(search),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(200),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(30),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: l10n.searchHint,
                hintStyle: TextStyle(color: Colors.white.withAlpha(150)),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {});
                          },
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withAlpha(30),
              ),
              onChanged: (value) {
                setState(() {});
              },
              onSubmitted: _searchCity,
            ),
          ),
          // Content area
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                    ? Center(
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                    : _buildRecentSearches(),
          ),
        ],
      ),
    );
  }
}
