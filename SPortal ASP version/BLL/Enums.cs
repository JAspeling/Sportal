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
        GROUPLEADER = 1,
        GROUPMEMBER = 2,
        PROJECTLEADER = 4
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
