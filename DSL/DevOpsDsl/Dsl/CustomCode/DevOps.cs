using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Variamos.DevOpsDsl
{
    public partial class Practice
    {
        string GetPracticeNameValue() {
            return this.PracticeType.ToString();
        }
    }
}
