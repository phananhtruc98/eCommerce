using System.Runtime.CompilerServices;
using log4net;

namespace ShoesStore
{
    public class LogHelper
    {
        public static ILog GetLogger([CallerFilePath] string filename = "")
        {
            return LogManager.GetLogger(filename);
        }
    }
}