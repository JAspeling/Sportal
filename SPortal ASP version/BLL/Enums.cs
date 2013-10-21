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
        MODERATOR,
        STAFF,
        ADMIN
    }

    [Flags]
    public enum UserRoles
    {
        GROUPMEMBER = 1,
        GROUPLEADER = 2 | GROUPMEMBER,
        CREATOR = 4
    }

    public enum PostType
    {
        PARENT = 1,
        CHILD
    }

    public enum Gender
    {
        MALE,
        FEMALE
    }
}
