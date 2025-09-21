import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

   @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;  
  static const Color primaryPurple = Color(0xFF54408C);

  void _onBottomNavTap(int index) {
    setState(() => _selectedIndex = index);
    
  }
  

  final List<Map<String, String>> _books =  const [
    {
      "image": "assets/images/image4.png",
      "title": "empty",
      "price": "Lorem fnegnegpeow",
    },
    {
      "image": "assets/images/image5.png",
      "title": "empty",
      "price": "Lorem fnegnegpeow",
    },
    {
      "image": "assets/images/image6.png",
      "title": "empty",
      "price": "Lorem fnegnegpeow",
    },
  ];
  final List<Map<String, String>> _vendors =  const [
    {
      "image": "assets/images/image8.png",
       
      "name": "Lorem fnegnegpeow",
    },
    {
      "image": "assets/images/image9.png",
       
      "name": "Lorem fnegnegpeow",
    },
    {
      "image": "assets/images/image10.png",
       
      "name": "Lorem fnegnegpeow",
    },
  ];
  final List<Map<String, String>> _authors =  const [
    {
      "image": "assets/images/image11.png",
      "name": "John Freeman",
      "subtitle": "Writer",
    },
    {
      "image": "assets/images/image12.png",
      "name": "Tess Gunty",
      "subtitle": "Novelist",
    },
    {
      "image": "assets/images/image14.png",
      "name": "Richard Perston",
      "subtitle": "Writer",
    },
  ];


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.search, color: Colors.black87),
        onPressed: () {

        },
      ),
      title: const Text(
        'Home',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {

          },
        ),
      ],
      ),

      body: SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Left side: texts and button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Special Offer',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Discount 25%',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                // action
                              },
                              style: ElevatedButton.styleFrom(
                                
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text('Order Now'),
                            ),
                          ),
                        ],
                      ),
                    ),

                     
                  
                      Image.asset(
                        'assets/images/image4.png',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                         
                      ),
                  ],
                ),
      ),
      ),

      const SizedBox(height: 20),

      Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text(
                  'Top of the week',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: const Text('See all'),
                ),
            ],
              ),

              const SizedBox(height: 10),


              


    SizedBox(
      height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  final book = _books[index];


                  final imagePath = book['image'] as String;
                  final title = book['title'] as String;
                  final price = book['price'] as String;

                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagePath,
                            height: 180,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
           ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            
          
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
            const Text(
                  'Best Vendors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/vendors');
                  },
                  child: const Text('See all',
                  style: TextStyle(color: Colors.blue),
                ),
     ),
            ],
              ),

          ),
          
             // best vendors
SizedBox(
      height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _vendors.length,
                itemBuilder: (context, index) {
                  final vendor = _vendors[index];


                  final imagePath = vendor['image']!;
                  final name = vendor['name']!;
                   

                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(imagePath, width:100, height: 64, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            name,
                            style: const TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                        ),
                        const SizedBox(height: 4),
                      ],
           ),
                        );
                },
                    ),
        
                  ),

        
             

            const SizedBox(height: 20),


            // authors header

             Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text(
                  'Authors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
            ],
              ),

              const SizedBox(height: 10),



              // horizontal list of Authors
          SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _authors.length,
                itemBuilder: (context, index) {
                  final author = _authors[index];
                  final imagePath = author['image']!;
                  final name = author['name']!;
                  final subtitle = author['subtitle']!;

                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        // Circular avatar
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(imagePath), // shows profile pic
                        ),
                        const SizedBox(height: 8),
                        Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 2),
                        Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
            
            const SizedBox(height: 60),
          ],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}






         
 