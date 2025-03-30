using Microsoft.Data.SqlClient;

namespace QHRMCodeTest.Services
{
    internal static class ConnectionStrings
    {
        public static SqlConnectionStringBuilder SqlConnectionStringBuilder = new SqlConnectionStringBuilder()
        {
            DataSource = "ZAKAWARMAW\\SQL2022",
            InitialCatalog = "QHRMCodeTest",
            UserID = "sa",
            Password = "sa@123",
            TrustServerCertificate = true
        };
    }
}
