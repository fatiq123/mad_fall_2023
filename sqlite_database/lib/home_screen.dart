import 'package:flutter/material.dart';
import 'package:sqlite_database/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();


  Future<void> _addData() async {
    await SQLHelper.createData(_title.text, _description.text);
    _refreshData(); // Fetch updated data from the database
    setState(() {
      // Clear the text fields
      _title.text = '';
      _description.text = '';
    });
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _title.text, _description.text);
    _refreshData(); // Fetch updated data from the database
    setState(() {
      // Clear the text fields
      _title.text = '';
      _description.text = '';
    });
  }

  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Data Deleted'),
      ),
    );
    _refreshData();
  }

  // helper function
  void showBottomSheet(int? id) async {
    // if id is not null then it will update otherwise it will add new data
    // when edit icon will be pressed then id will be given to showBottomSheet and it will edit
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _title.text = existingData['title'];
      _description.text = existingData['description'];
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), helperText: 'Title'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _description,
              maxLines: 4,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), helperText: 'Description'),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  }
                  if (id != null) {
                    await _updateData(id);
                  }

                  _title.text = '';
                  _description.text = '';

                  Navigator.of(context).pop();
                  print('Data Added');
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Data" : "Update Data",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SQLite CRUD Operations'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        _allData[index]['title'],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(_allData[index]['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showBottomSheet(_allData[index]['id']);
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.indigo,
                        ),
                        IconButton(
                          onPressed: () {
                            _deleteData(_allData[index]['id']);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
