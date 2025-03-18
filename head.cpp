#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cctype>
#include <algorithm>

using namespace std;

bool isNumber(const string& str) {
    return !str.empty() && std::all_of(str.begin(), str.end(), ::isdigit);
}

int parseNumber(const string& str) {
    if (!str.empty() && std::all_of(str.begin(), str.end(), ::isdigit)) {
      // error handling for stoi - better use stol
      return std::stoi(str); 
    }
    return -1;
}

int main(int argc,char** argv){
  vector<string> args;
  for(int i=0;i<argc;i++){
    args.push_back(string(argv[i]));
  }

  if(argc == 1){
    int lineCount = 0;
    string line;
    while(lineCount < 10){
      getline(cin,line);
      cout << line << "\n";
      lineCount++;
    }
  }else{
    int TOTAL_LINE_COUNT = -1; // -n 500 | -n500 | --lines=500
    for(int i=1;i<argc;i++){
      if(args[i] == "-n"){
        if(i == argc - 1){
          cerr << "Please provide number of lines with -n" << "\n";
          return 1;
        }
        if(!isNumber(args[i+1])){
          cerr << "Please proivde valid number of lines" << "\n";
          return 1;
        }
        TOTAL_LINE_COUNT = parseNumber(args[i+1]);
      }else if(args[i].find("--lines") !=-1){
        auto idx = args[i].find("--lines");
        string numStr = args[i].substr(8,args[i].size());
        if(!isNumber(numStr)){
          cerr << "please proivde valid number of lines" << "\n";
          return 1;
        }
        TOTAL_LINE_COUNT = parseNumber(numStr);
      }else if(args[i].find("-n") != -1 && args[i].size() > 2){
        string numStr = args[i].substr(2,args[i].size());
         if(!isNumber(numStr)){
          cerr << "please proivde valid number of lines" << "\n";
          return 1;
        }
        TOTAL_LINE_COUNT = parseNumber(numStr);
      }
    }
    for(int i=1;i<argc;i++){
      string filePath = args[i];
      if(filePath.find("-n")!=-1 || filePath.find("--lines") !=-1 || isNumber(args[i]))
        continue;
      
      ifstream infile(filePath);
      if(!infile){
        cerr << "Error opening file: " << filePath << "\n";
        return 1;
      }

      string readLine;
      int lineCount = 0;
      while(getline(infile,readLine)){
        if(lineCount >= TOTAL_LINE_COUNT)
          break;
        lineCount++;
        cout << readLine << "\n";
      }

      infile.close();
    }
  }
  return 0;
}
