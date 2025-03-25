import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'bottom_Navigation_Bar.dart';

class GetOtherUserProfileScreen extends StatefulWidget {
  const GetOtherUserProfileScreen({super.key});

  @override
  State<GetOtherUserProfileScreen> createState() =>
      _GetOtherUserProfileScreenState();
}

class _GetOtherUserProfileScreenState extends State<GetOtherUserProfileScreen> {
  final List<String> imageUrls = const [
    'https://s3-alpha-sig.figma.com/img/d2ca/625a/3112cfe78d1043fe2fc1829343e4f3ea?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=APEEsJMWO~DkjjqaSem6gqmdf~BQACyoBsCeBnxn7sTrCfy4od8hRoat~6Wjq6sAecW4rUo~xCRTnifGb4MS9wZiULc2pY2yegep6n44oDwQsQXw~3HnFQ6QeNv6l6Z~aHKftcpsA82o5T7-49T7doZwAXqQbNheDrRUyU4rf3-xYhPO1RBZRQDFJ1GVZFnVnBAWgGBoRv02RIR5MCA8ekRME8xH8yUSYzmRl2buiIORW4r3AWDae6WX5rN~LIdI3g1GMnF8pZLvXwc7368FNscbZb~wZfAO-wKARCW49FptmxvMo9t2v851scx0vYfxSZ2cupFfgQGGuPOXRPqz7g__',
    'https://s3-alpha-sig.figma.com/img/a4e9/c99b/8d01215f93ced77b88c27d84e6915136?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qxauFTcvu1QxWTkQhGROIKOtLM8DFYOI~ZH2ZaEGqK0KsMD-pA3HJ9OJ~ixWo6uU6gbsPkJJZFicgVQI2jcScehOtfDvQPquSueaspGgaypjQ7dhbw9RyrhoXR6udmc650TmUKwVIQPOKuN7zPAGNVNa-EUM-G69R7e3DOro2iFr6gsROKN93HIAsO-VF9kGMftoe4wselKgZBgYHr0cPpvwZb0jleZ9AqJoFYOL7xXOB34byncYcy6wkZdBLcHz~xjgyUSNj1lFWSRw6tBsUxkuTXN9~rnIbJX5Xi17-4EP3NTO-pvmiZ7C39WfxLKG6ZLeIil0E1aTAuJIkfK9TQ__',
    'https://s3-alpha-sig.figma.com/img/418d/21a8/b4c9391381bcccbc6e093252eb914031?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=dCt7FpIgmBZVFXSRXyBLJjN5BJ2OPXatFZ7FDcZvmfmWXMTC3hg94j3O24VdMTRvFJxMGDQWwH~eQTIDSXEG-LauvXFl4qF6Ps5MDQLjek3IlDIn3LUAVlq9GjG3y5Kb6uMSCve44yO0JMGlL7rWhp4UaZJd-6Aesif4H8bSfwpG5Fjfp0gN1WxfPXaMCy7QApTLPccquSyo~r3BGx6lVkWx5jdDHDfBrNjztOlmIJUwNFeuEn8b79ULuqcSfdh3vmdotLzRSg2t~-tU5Nozs61cLTUW9ar2cTOr~osb8ETE3gCxP18tS1cFWcAgYbrNQkApRqFaQL9JRRs2OobOLA__',
    'https://s3-alpha-sig.figma.com/img/dba2/84ff/d488d54541e1ff3c119accfc503d37a4?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=lQhpvQnrV1rQmi0eu-F1nDht5TuHjAKa6XJSMcwq1m-n4-jS9UcW01urvLA3JOihW8Hny70CsrLqMDymND1~QPJdEOGjSRN1XqhwYf4zFHkg-nEar6NcsfDPkOaFo6tg7XeuuROkRSUS-XhqyO-9T26LcI1yasZplFPZ43drAzDB0d~HX8OomlzEHhVFJdZbFY2BKxKIoni1YPHbijfrWPiocZV7yYJF~driPGcY3PzBMI0a56XOSQLI5bJZYOWVrfKyjvIXA-5sAdE8m2kknAFyGlnkQ8e-CcwzY1B3tGV93mEaracs2du4Bh~rFTcJ9iIKSE1DsUpN9aC6YWnpog__',
    'https://s3-alpha-sig.figma.com/img/fc3f/0d82/be4de7590fafdd57d1217dfcd3862b66?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=nOJW2fA9HTIB9N13dqdpPL9cYmevVPlLIpnqQTXJ3ziP0ok1yqUb7HeiEiOn4sCI1IFGSMAC2Ufemdy0FEBkRhu0pGNblO2q-Oz5JNxKbZNdSEvuzfDPJZ-K-4lwElL9sq7P5CIjCGmah2sypjYrjeQBtYSj6KfHs2JEZcML71oA1IkjhwpScKXc5JK70xgwxEo2NdqsjyHq~0x2cn7tj93J996QcfktWB-djwAAESexzy9TdLHpg1209t69MjxDIWaWl86nF56GniKpMJEO1H~uQVbYU08A1NUnNsDpLzw2LKUknbvn-7Sq7~Yp1xARm7HZ1T~A5nJd2lEKjCdA~Q__',
    'https://s3-alpha-sig.figma.com/img/1f03/e112/8aa1ba073d58425a6e1e502242a9f6a5?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=BMPCk0nS~NqZCwmF60iy-51Q5uElWH5VNf-91nFe9Uq4ARWRm61S9KRaK7zcPcLFFfoSJo0XBH6aNGq3WVu2-EzH3xhtyvpRofw51JDUbenlw~cGrPy7C9kwbEBVC1paTFLWERiluABKlD7J1nLYCjPAan0P1edzxANUcjGiz0S6bXosNCT7kQHp~po6DKhobr8qCKo26evYsI9u8B1nyw2rT4r-sCTfnKEAKsiGFvVjW1eksAxtwkrmWXGj~~RyggNG~C9xvOnhdL3ZDLnTMW7IwxFqvqrdirJZXAqxhVuisKCHh50GOX7ADNp8XRqs1vTGwqGz1IaL0DCTJnfaJw__',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColor.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/180c/baf9/791005d50ba5ddbc7325d1a786dc03a6?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=orRgSIVzn38yvqds6g5YmMKDIc4vL6kdo2BZT~vZqFUXUzsGj2PCaWMbocdGJV2skpAob8DpQQ6B5wBxqvF1JLKz6XXblRcXtjTFvx09h2XSk~mMVipH1TSebbdCNlFX06BoyKKNI0IQDqJeAEdmZ1b8NMZ9ia0VLtMKlM63awW3bdEy2Fa3dLpl60fniw-Veanfky5mC-qc9msQZlKZjH0ydCs6fbWSevIIsIUcxnGX~uA-lpuTk2kfLBOjJ059ynF7IKL2FFaggEZLhatqVIuOKbf5e-PZ-HY9WcdMDCbchjQRfksrHelZSluy2ZQLwMCrCZAFUZJSnB1hUnEsAA__"),
                      // Network image URL
                      fit: BoxFit
                          .cover, // Ensures the image covers the container
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const BottomNavScreen()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Chef Ali",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const Text("")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                    child: ClipOval(
                      child: Image.network(
                        "https://s3-alpha-sig.figma.com/img/4eb1/4b02/61802b25e543f0595b8c08e4b4902fcf?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FtsFTqsims3bWoM6wihJhg9VcRzqBzE~Symgz02hogqSrZqCFblRscXnnpN4yQh47LTXDsPaoRIgvXK9mMtfHLfo3WXWe1W8J0gCK3Zuv~TDaO~OQ0Od89MslNBCqiL4ZFghE7nB4gudEID1ahxfDl33z9CXrO00GIzi9guzDTfdgQbFuwhFsC3UE47Wp3BfhJMfSzAIQ9-uDs~Q-roI7y-uKUjJ0ELUTKDdnKuOtn90Rjp9K~I32kOutJZZ-s59bHeUaufjHNi8L5ia3TZTuWN9JUNCvRSqZP8OxnJ2RyuMbQAug16LK6jnW~nfRGt7Jul5OiXbCXElnf0M7ECOnA__",
                        width: 100, // Diameter
                        height: 100, // Diameter
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "@ChefAli50",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Chef,Designer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "32",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      "1.1M",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      "32",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 104,
                  height: 30,
                  decoration: BoxDecoration(
                    color: UiColor.butttonColor,
                    borderRadius: BorderRadius.circular(56),
                  ),
                  child: const Center(
                      child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 104,
                  height: 30,
                  decoration: BoxDecoration(
                    color: UiColor.butttonColor2,
                    borderRadius: BorderRadius.circular(56),
                  ),
                  child: const Center(
                      child: Text(
                    "Message",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: UiColor.backgroundColor2,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Recent Post",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 2 columns
                  crossAxisSpacing: 12,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 12,
                  // Square items
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    height: 160,
                    width: 107,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
