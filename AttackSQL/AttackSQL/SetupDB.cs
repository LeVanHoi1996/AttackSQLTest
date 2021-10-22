using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttackSQL
{
    
    public class Setdatatextsql
    {
        public SetupDB SetupDB = new SetupDB();
       
        public string sql = "USE [master] \nGo \n";
        public string Querysql()
        {
            sql += " CREATE DATABASE  " + SetupDB.Namedatabase + "\n CONTAINMENT = NONE \n";
            sql += " ON  PRIMARY (";
            sql += " NAME = N'"+ SetupDB.Namedatabase + "', FILENAME = N'"+SetupDB.FILENAME+ "' , SIZE = 8192KB , MAXSIZE = UNLIMITED , FILEGROWTH = 65536KB  ) \n";
            sql += " LOG ON  (";
            sql += " NAME = N'"+ SetupDB.Namedatabase + "_log', FILENAME = N'" + SetupDB.FILENAME_log + "' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB ) \nGo \n";
            sql += "USE "+ SetupDB.Namedatabase + "\nGO \n";
            return sql; 
        }
    }

     public class SetupDB
    {
        //data
        public string Namedatabase { get; set; }
        public string FILENAME { get; set; }
        public string SIZE { get; set; }
        public string MAXSIZE { get; set; }
        public string FILEGROWTH { get; set; }
        //log
        public string Namedatabase_log { get; set; }
        public string FILENAME_log { get; set; }
        public string SIZE_log { get; set; }
        public string MAXSIZE_log { get; set; }
        public string FILEGROWTH_log { get; set; }

    }
}
