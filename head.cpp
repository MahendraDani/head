#include <iostream>
#include <vector>
#include <fstream>
#include <string>
#include <cctype>
#include <algorithm>
#include <sys/stat.h>

using namespace std;

bool isNumber(const string &str) {
  return !str.empty() && all_of(str.begin(), str.end(), ::isdigit);
}


int parseNumber(const string &str) {
  if (!str.empty() && all_of(str.begin(), str.end(), ::isdigit))
  {
    // error handling for stoi - better use stol
    return stoi(str);
  }
  return -1;
}

typedef struct options {
  int lineCount;
  int byteCount;
} options;

class FileReader {
  public:
  
  int readFileByText(string &filePath, int lineCount){
    ifstream infile;

    if(this->isDirectory(filePath) !=0){
      cout << "head: " << filePath << ": Is a directory" << "\n";
      return 1;
    }
    infile.open(filePath);

    if(!infile){
      cout << "head: " << filePath << ": No such file or directory" << "\n";
      return -1;
    }

    string line;
    int cnt = 0;
    while(getline(infile,line)){
      if(cnt >= lineCount)
        break;
      
      cout << line << "\n";
      cnt++;
    }

    infile.close();
    return 0;
  }

  int readFileByBytes(string &filePath, int byteCount) {
    if(this->isDirectory(filePath) !=0){
      cout << "head: " << filePath << ": Is a directory" << "\n";
      return 1;
    }

    ifstream infile(filePath, ios::binary);

    if (!infile){
      cout << "head: " << filePath << ": No such file or directory" << "\n";
      return -1;
    }

    vector<char> buffer(byteCount);
    infile.read(buffer.data(), byteCount);

    streamsize bytesRead = infile.gcount();

    cout.write(buffer.data(), bytesRead);
    cout << endl;

    infile.close();
    return 0;
  }

  private:
  bool isDirectory(string& path) {
    struct stat pathStat;
    if (stat(path.c_str(), &pathStat) != 0) {
        return false;
    }
    return S_ISDIR(pathStat.st_mode);
  }
};

int main(int argc, char** argv){
  options opts = {
    .lineCount = -1,
    .byteCount = -1
  };

  vector<string> vargv;
  for(int i=0;i<argc;i++){
    vargv.push_back(string(argv[i]));
  }

  if(argc = 2){
    int cnt = 0;
    string line;
    while(cnt < 10){
      cin >> line;
      cout << line << "\n";
      cnt++;
    }
    return 0;
  }

  // handle options
  /*
  1. support -n 13 | -n13 | --lines=13
  2. support -c 13 | -c13 | --bytes=13
  3. handle: -n and -c args can't be present at the same time
  4. handle: numbers for -n and -c should be > 0
  5. handle: -n file.txt 13 => error => the number should be the next number after the option
  6. handle: if a flag is provided, atleast one file must be provided
  */

  // TODO : handle syntax error like -n=123213 -n-c12323
  // TODO : handle error when flag is provided but any file Path is not provided
  for(int i=1;i < vargv.size();i++){
    string arg = vargv[i];
    if(arg.find("-n")!=-1){
      if(arg.size() != 2){
        opts.lineCount = parseNumber(arg.substr(2,arg.size()));
      }else{
        if(i == vargv.size()-1){
          cerr << "Please provide the number of lines" << "\n";
          return 1;
        }
        opts.lineCount = parseNumber(vargv[i+1]);
      }
    }else if(arg.find("--lines=")!=-1){
      string numStr = arg.substr(8,arg.size());
      opts.lineCount =  parseNumber(numStr);
    }else if(arg.find("-c") !=-1){
      if(arg.size() != 2){
        opts.byteCount = parseNumber(arg.substr(2,arg.size()));
      }else{
        if(i == vargv.size()-1){
          cerr << "Please provide the number of bytes" << "\n";
          return 1;
        }
        opts.byteCount = parseNumber(vargv[i+1]);
      }
    }else if(arg.find("--bytes=") !=-1){
      string numStr = arg.substr(8,arg.size());
      opts.byteCount = parseNumber(numStr);
    }
  }

  if(opts.byteCount != -1 && opts.lineCount !=-1){
    cerr << "head: can't combine line and byte counts" << "\n";
    return 1;
  }

  FileReader fileReader;
  // read text-by-text
  for(int i=1;i<vargv.size();i++){
    string filePath = vargv[i];
    if (filePath.find("-n") != -1 || filePath.find("--lines") != -1 || isNumber(vargv[i]))
      continue;

    if (filePath.find("-c") != -1 || filePath.find("--bytes") != -1 || isNumber(vargv[i]))
      continue;
    
    int fs;
    if(opts.byteCount != -1){
      fs = fileReader.readFileByBytes(filePath,opts.byteCount);
    }else if (opts.lineCount != -1){
      fs = fileReader.readFileByText(filePath, opts.lineCount);
    }else if(opts.byteCount == -1 && opts.lineCount == -1){
      fs = fileReader.readFileByText(filePath,10);
    }

    if(fs == -1){
      return 1;
    }
  }
  return 0;
}