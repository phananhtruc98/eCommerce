using System.Diagnostics.CodeAnalysis;

[assembly:
    SuppressMessage("Microsoft.Usage", "CA2202:Do not dispose objects multiple times", Scope = "member",
        Target =
            "Utilities.FileHelper.#ExportGridView(System.String,System.String,System.Web.UI.WebControls.DataGrid)")]
[assembly:
    SuppressMessage("Microsoft.Usage", "CA2202:Do not dispose objects multiple times", Scope = "member",
        Target = "Utilities.FileHelper.#ResizeImageHeight(System.String,System.String,System.Int32)")]
[assembly:
    SuppressMessage("Microsoft.Usage", "CA2202:Do not dispose objects multiple times", Scope = "member",
        Target = "Utilities.FileHelper.#ResizeImageWidth(System.String,System.String,System.Int32)")]
[assembly:
    SuppressMessage("Microsoft.Design", "CA1001:TypesThatOwnDisposableFieldsShouldBeDisposable", Scope = "type",
        Target = "Utilities.OnlineUsers")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target =
            "Utilities.SqlHelper.#CreateCommand(System.Data.SqlClient.SqlConnection,System.String,System.String[])")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target = "Utilities.SqlHelper.#GetDataset(System.String,System.String)")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target = "Utilities.SqlHelper.#GetDataWithSqlCommand(System.String)")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target =
            "Utilities.SqlHelper.#PrepareCommand(System.Data.SqlClient.SqlCommand,System.Data.SqlClient.SqlConnection,System.Data.SqlClient.SqlTransaction,System.Data.CommandType,System.String,System.Data.SqlClient.SqlParameter[],System.Boolean&)")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target = "Utilities.SqlHelper.#SetDataWithSqlCommand(System.String)")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target = "Utilities.SqlHelper.#UpdateData(System.String,System.Collections.ArrayList,System.String)")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target = "Utilities.SqlHelper.#UpdateData(System.String,System.String)")]
[assembly:
    SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities", Scope = "member",
        Target =
            "Utilities.SqlHelperParameterCache.#DiscoverSpParameterSet(System.Data.SqlClient.SqlConnection,System.String,System.Boolean)")]
// This file is used by Code Analysis to maintain SuppressMessage 
// attributes that are applied to this project.
// Project-level suppressions either have no target or are given 
// a specific target and scoped to a namespace, type, member, etc.
//
// To add a suppression to this file, right-click the message in the 
// Code Analysis results, point to "Suppress Message", and click 
// "In Suppression File".
// You do not need to add suppressions to this file manually.