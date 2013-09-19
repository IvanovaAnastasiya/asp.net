namespace Library.Migrations
{
    using Library.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Library.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(Library.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //

            //context.Categories.AddOrUpdate(
            //  c => c.Id,
            //  new Category { Name = "Programming" },
            //  new Category { Name = "Databases" },
            //  new Category { Name = "Web Development" },
            //  new Category { Name = "System Administration"},
            //  new Category { Name = "Data Structures and Algorithms" },
            //  new Category { Name = "Rocket Science" },              
            //);

            //context.Books.AddOrUpdate(
            //    b=>b.Id

        }
    }
}
