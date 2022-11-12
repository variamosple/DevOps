using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Variamos.DevOpsDsl
{
    public partial class SLO {
        string GetSloNameValue() {
            return DslUtilis.CamelToSpaceString(this.SliType.ToString());
        }
    }
    public partial class Practice
    {
        string GetPracticeNameValue() {
            
            
            return DslUtilis.CamelToSpaceString(this.PracticeType.ToString());
        }

        


        

    }

    public static class DslUtilis
    {

        /// <summary>
        /// Converts a string in Pascal format to space seprate phareses
        /// Example: HelloWord is converted to Hello World
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string CamelToSpaceString(string str)
        {
            string output = System.Text.RegularExpressions.Regex.Replace(str, "([A-Z])", " $1",
    System.Text.RegularExpressions.RegexOptions.Compiled).Trim();
            return output;
        }
    }


}
