namespace TechGeeks.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserFields : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "FullName", c => c.String());
            AddColumn("dbo.AspNetUsers", "BirthDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.AspNetUsers", "NIF", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "NIF");
            DropColumn("dbo.AspNetUsers", "BirthDate");
            DropColumn("dbo.AspNetUsers", "FullName");
        }
    }
}
