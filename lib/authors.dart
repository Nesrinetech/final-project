import 'package:flutter/material.dart';


class Authors extends StatelessWidget {
  const Authors({super.key});

 
  
 
  final List<Map<String, String>> _vendors =  const [
    {
      "image": "assets/images/image12.png",
       
      "name": "Lorem fnegnegpeow",
    },
    {
      "image": "assets/images/image13.png",
       
      "name": "Lorem fnegnegpeow",
    },
    {
      "image": "assets/images/image14.png",
       
      "name": "Lorem fnegnegpeow",
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
        'Authors',
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
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
 

      Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text(
                  'Authors',
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
                   



                  // return Container(
                  //   width: 100,
                  //   margin: const EdgeInsets.only(right: 12),
                  //   child: Column(
                  //     children: [
                  //       // Circular avatar
                  //       CircleAvatar(
                  //         radius: 30,
                  //         backgroundImage: AssetImage(imagePath), // shows profile pic
                  //       ),
                  //       const SizedBox(height: 8),
                  //       Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                  //       const SizedBox(height: 2),
                  //       Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  //     ],
                  //   ),
                  // );


                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [ 
                        ClipRRect(

                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(imagePath, width:100, height: 64, fit: BoxFit.cover, errorBuilder: (context, error, stack) => Container(
                            width: 100,
                            height: 64,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.store, color: Colors.grey),
                          ), 
                          ),
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


            
          ],
        ),
      ),
);

  }
}






         
