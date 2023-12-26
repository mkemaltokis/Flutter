import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniblog/models/blog.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/screens/blog_details.dart';
import 'package:miniblog/widgets/blog_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Blog> blogList = []; //  <Blog> <--> <Type Safe>

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // http paketi ile istek atmamız lazım.
    fetchBlogs();
  }

  Future fetchBlogs() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url); // isteği attım.
    // json'a çevirdik. buradan blog listesi geliyor.
    final List jsonData = jsonDecode(response.body);

    setState(() {
      blogList = jsonData.map((json) => Blog.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Blog Listesi"),
        actions: [
          // refresh etmeden de verileri ana sayfayı getirdik.
          IconButton(
            onPressed: () async {
              bool? result = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddBlog()));
              if (result == true) {
                fetchBlogs();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: blogList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // güncellemer için:
          : RefreshIndicator(
              onRefresh: () async {
                fetchBlogs();
              },
              child: ListView.builder(
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).push(MaterialPageRoute(
                      builder: (ctx) =>
                          BlogDetails(blogId: blogList[index].id!),
                    ));
                  },
                  child: BlogItem(blog: blogList[index]),
                ),
                // her bir blogun tıklanmasını yakalamak için kullanıldı.
                itemCount: blogList.length,
              ),
            ),
    );
  }
}
