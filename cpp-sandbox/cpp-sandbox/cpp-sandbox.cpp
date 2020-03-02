#include "cpp-sandbox.h"
#include <thread>

using namespace std::chrono_literals;

int main()
{
  std::thread thread_1([]
    {
      auto i = 0;
      while (i < 10)
      {
        std::this_thread::sleep_for(0.1s);
        std::cout << "Hello, I'm thread 1 !" << std::endl;
        ++i;
      }
    });
  std::thread thread_2([]
    {
      auto i = 0;
      while (i < 10)
      {
        std::this_thread::sleep_for(0.1s);
        std::cout << "Hello, I'm thread 2 !" << std::endl;
        ++i;
      }
    });
  thread_1.join();
  thread_2.join();
  std::cout << "Hello CMake." << std::endl;
	return 0;
}
