import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Radio3Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('커스텀 라디오 버튼'),
      ),
      body: Radio3()
    );
  }
}

class Radio3 extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<Radio3> {
  List sampleData = new List();
  String _selectedText='만나서 반갑습니다';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(true, '한국어', ));
    sampleData.add(new RadioModel(false, 'English', ));
    
  } 

  final SemanticsProperties properties = SemanticsProperties(
    label:'라디오버튼 언어를 선택 하세요',
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Semantics.fromProperties(
          properties: properties, 
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Semantics( 
                    inMutuallyExclusiveGroup:true,
                    selected:sampleData[0].isSelected,
                    label:'한국어, 2개의 라디오 버튼중 1번째',
                    child:ExcludeSemantics(
                      child:InkWell(
                        child: _buttonstyle(sampleData[0]),
                        
                        onTap: (){
                          setState(() {
                            changeAction(selectedItem:0 , selectedText: '만나서 반갑습니다.');
                          });
                        },
                      )
                    )
                  ),
                  Semantics(
                    inMutuallyExclusiveGroup:true,
                    selected:sampleData[1].isSelected,
                    label:'English, 2개의 라디오 버튼중 2번째',
                    child:ExcludeSemantics(
                      child:
                        InkWell(
                        child: _buttonstyle(sampleData[1]),
                        onTap: (){
                          setState(() {
                            changeAction(selectedItem:1 , selectedText: 'Nice to meet you.');
                          });
                        },
                      )
                    )
                  )
                ]
              ),
            ),
        Text(_selectedText,textScaleFactor: 2.0,),
      ]
    );
  }
  void changeAction({int selectedItem, String selectedText}){
    this._selectedText=selectedText;
    sampleData.forEach((element) => element.isSelected = false);
    sampleData[selectedItem].isSelected = true;
    if(selectedItem==1)
      SemanticsService.announce('English가 선택되었습니다. Nice to meet you.', TextDirection.rtl);
    else if(selectedItem==0)
      SemanticsService.announce('한국어가 선택되었습니다. 만나서 반갑습니다.', TextDirection.rtl);
  }
  
  Widget _buttonstyle(sampleData) {
    return  Container(
        padding: EdgeInsets.only(right: 20),
        child: Stack(
          children: [
            Container(
              height: 40,
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(width: 1,color: sampleData.isSelected? Colors.blue:Colors.grey),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              child: Center(child: Text("${sampleData.buttonText}")),
            ),
          ],
        ),
      );
    
  }
}

// Button style


class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText,);
}