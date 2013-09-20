using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public enum UserType
    {
        USER = 1,
        STAFF,
        ADMIN
    }

    [Flags]
    public enum UserRoles
    {
        MENTOR = 1,
        MENTEE = 2,
        PROJECTLEADER = 4
    }
}
