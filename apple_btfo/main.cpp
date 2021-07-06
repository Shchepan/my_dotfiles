#include <iostream>
#include <string>
#include <fstream>
int main()
{
	std::ifstream input("/home/user/programy/apple_btfo/file.txt");
	std::string line;

	while(std::getline(input,line))
	{
		std::cout<<line<<'\n';
	}
return 0;
}
