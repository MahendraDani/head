#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc,char** argv){
  if(argc == 1){
    // read 10 lines from stdin
    int lineCount = 0;
    string line;
    while(lineCount < 10){
      getline(cin,line);
      cout << line << "\n";
      lineCount++;
    }
  }else{
    for(int i=1;i<argc;i++){
      string filePath = argv[i];
      
      ifstream infile(filePath);
      if(!infile){
        cerr << "Error opening file: " << filePath << "\n";
        return 1;
      }

      string readLine;
      while(getline(infile,readLine)){
        cout << readLine << "\n";
      }

      infile.close()
    }
  }
  return 0;
}
