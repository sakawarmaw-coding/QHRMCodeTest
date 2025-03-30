using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QHRMCodeTest.Models;
using QHRMCodeTest.Services;
using System.Data;
using System.Reflection.Metadata;

namespace QHRMCodeTest.Controllers
{
    public class ProductController : Controller
    {
        ResponseModel repModel = new ResponseModel();
        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetList()
        {
            var data = new List<object[]>();
            var parameter = new DynamicParameters();

            string query = "select * from TblProduct";
            using IDbConnection db = new SqlConnection(ConnectionStrings.SqlConnectionStringBuilder.ConnectionString);
            List<ProductModel> lst = db.Query<ProductModel>(query).ToList();
            var list_count = lst.Count();
            if (list_count > 0)
            {
                int i = 0;
                foreach (ProductModel l in lst)
                {
                    i = i + 1;
                    var dataId = l.Id;
                    data.Add(new object[] {
                        i
                       ,l.Name
                       ,l.Description
                       ,l.Price
                       ,Convert.ToDateTime(l.CreatedDate)
                        ,"<div class='actions'>" +
                        $"<button class='btn btn-sm bg-danger-light edit' data-id='{l.Id}'><i class='feather-edit'></i></button>" +
                        $"<button class='btn btn-sm bg-danger-light delete' data-id='{l.Id}'><i class='feather-trash-2'></i></button>" +
                        "</div>"
                       ,l.Id
                    });
                }
            }
            return Json(
                    new
                    {
                        recordsTotal = list_count,
                        recordsFiltered = list_count,
                        data = data
                    }
            );
        }

        public JsonResult SaveUpdate(ProductModel prod)
        {
            try
            {
                var item = FindById(prod.Id);
                if (item is null)
                {
                    string query = @"INSERT INTO [dbo].[TblProduct]
                                               ([Name]
                                               ,[Description]
                                               ,[Price]
                                               ,[CreatedDate])
                                         VALUES
                                               (@Name
                                               ,@Description
                                               ,@Price
                                               ,GETDATE())";

                    using IDbConnection db = new SqlConnection(ConnectionStrings.SqlConnectionStringBuilder.ConnectionString);
                    int result = db.Execute(query, prod);
                    repModel.RespCode = result > 0 ? "success" : "failed";
                    repModel.RespMsg = result > 0 ? "Saving Success" : "Save failed";
                }
                else
                {
                    string query = @"UPDATE [dbo].[TblProduct]
                                       SET [Name] = @Name
                                          ,[Description] = @Description
                                          ,[Price] = @Price
                                          ,[CreatedDate] = GETDATE()
                                     WHERE Id=@Id";

                    using IDbConnection db = new SqlConnection(ConnectionStrings.SqlConnectionStringBuilder.ConnectionString);
                    int result = db.Execute(query, prod);
                    repModel.RespCode = result > 0 ? "success" : "failed";
                    repModel.RespMsg = result > 0 ? "Updating Success" : "Updated failed";

                }
            }
            catch (Exception ex)
            {
                repModel.RespCode ="error";
                repModel.RespMsg = ex.Message;
            }
            return Json(repModel);
        }

        private ProductModel? FindById(int id)
        {
            string query = "select * from TblProduct where Id = @Id";
            using IDbConnection db = new SqlConnection(ConnectionStrings.SqlConnectionStringBuilder.ConnectionString);
            var item = db.Query<ProductModel>(query, new ProductModel { Id = id }).FirstOrDefault();
            return item;
        }

        public JsonResult GetDataById(int id)
        {
            var data = FindById(id);
            return Json(data);
        }

        public JsonResult Delete(int id)
        {
            try
            {
                var item = FindById(id);
                if (item is null)
                {
                    repModel.RespCode = "error";
                    repModel.RespMsg = "Data Not Found";
                    return Json(repModel);
                }

                string query = @"Delete From TblProduct where Id = @Id";
                using IDbConnection db = new SqlConnection(ConnectionStrings.SqlConnectionStringBuilder.ConnectionString);
                int result = db.Execute(query, new ProductModel { Id = id });
                repModel.RespCode = result > 0 ? "success" : "failed";
                repModel.RespMsg = result > 0 ? "Deleting Success" : "Delete failed";
            }
            catch (Exception ex)
            {
                repModel.RespCode = "error";
                repModel.RespMsg = ex.Message;
            }

            return Json(repModel);
        }

    }
}
