import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniblog/models/blog.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({Key? key, required this.blogId}) : super(key: key);
  final String blogId;
  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  Blog blog = Blog();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBlogs();
  }

  Future fetchBlogs() async {
    Uri url = Uri.parse(
        "https://tobetoapi.halitkalayci.com/api/Articles/${widget.blogId}");
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);

    setState(() {
      blog = Blog.fromJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(blog.title == null ? "Lütfen Bekleyiniz" : blog.title!)),
      body: blog.id == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(221, 155, 155, 155),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(blog.thumbnail!),
                        ),
                      ),
                      Text(
                        "${blog.author!}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(blog.content!),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
