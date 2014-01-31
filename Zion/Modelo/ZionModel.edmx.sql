
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/02/2013 02:40:10
-- Generated from EDMX file: C:\Users\Shana\documents\visual studio 2012\Projects\Zion\Zion\Modelo\ZionModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ZionDBLocal];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_DepartamentoPersonas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Departamentos] DROP CONSTRAINT [FK_DepartamentoPersonas];
GO
IF OBJECT_ID(N'[dbo].[FK_NotasEstudianteEstudiante]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NotasEstudianteSet] DROP CONSTRAINT [FK_NotasEstudianteEstudiante];
GO
IF OBJECT_ID(N'[dbo].[FK_CursoNotasEstudiante]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NotasEstudianteSet] DROP CONSTRAINT [FK_CursoNotasEstudiante];
GO
IF OBJECT_ID(N'[dbo].[FK_CursoDepartamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CursoSet] DROP CONSTRAINT [FK_CursoDepartamento];
GO
IF OBJECT_ID(N'[dbo].[FK_CursoDocente_Curso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CursoDocente] DROP CONSTRAINT [FK_CursoDocente_Curso];
GO
IF OBJECT_ID(N'[dbo].[FK_CursoDocente_Docente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CursoDocente] DROP CONSTRAINT [FK_CursoDocente_Docente];
GO
IF OBJECT_ID(N'[dbo].[FK_Estudiante_inherits_Personas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas_Estudiante] DROP CONSTRAINT [FK_Estudiante_inherits_Personas];
GO
IF OBJECT_ID(N'[dbo].[FK_Docente_inherits_Personas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas_Docente] DROP CONSTRAINT [FK_Docente_inherits_Personas];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Personas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personas];
GO
IF OBJECT_ID(N'[dbo].[Departamentos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departamentos];
GO
IF OBJECT_ID(N'[dbo].[NotasEstudianteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NotasEstudianteSet];
GO
IF OBJECT_ID(N'[dbo].[CursoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CursoSet];
GO
IF OBJECT_ID(N'[dbo].[Personas_Estudiante]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personas_Estudiante];
GO
IF OBJECT_ID(N'[dbo].[Personas_Docente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personas_Docente];
GO
IF OBJECT_ID(N'[dbo].[CursoDocente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CursoDocente];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Personas'
CREATE TABLE [dbo].[Personas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombres] varchar(50)  NULL,
    [Apellidos] varchar(10)  NULL,
    [Cedula] varchar(13)  NULL,
    [Telefono] varchar(20)  NULL,
    [sexo] varchar(1)  NOT NULL,
    [fecha_nacimiento] date  NOT NULL,
    [Email] varchar(max)  NULL
);
GO

-- Creating table 'Departamentos'
CREATE TABLE [dbo].[Departamentos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(max)  NOT NULL,
    [Clave] varchar(max)  NOT NULL,
    [PersonasId] int  NOT NULL
);
GO

-- Creating table 'NotasEstudianteSet'
CREATE TABLE [dbo].[NotasEstudianteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EstudianteId] int  NOT NULL,
    [CursoId] int  NOT NULL,
    [Periodo] varchar(max)  NOT NULL,
    [Nota] varchar(max)  NOT NULL
);
GO

-- Creating table 'CursoSet'
CREATE TABLE [dbo].[CursoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Clave] varchar(max)  NOT NULL,
    [Nombre] varchar(max)  NOT NULL,
    [Credito] smallint  NOT NULL,
    [DepartamentoId] int  NOT NULL
);
GO

-- Creating table 'Personas_Estudiante'
CREATE TABLE [dbo].[Personas_Estudiante] (
    [Matricula] int  NOT NULL,
    [PerodoIngreso] varchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Personas_Docente'
CREATE TABLE [dbo].[Personas_Docente] (
    [FechaIngreso] date  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'CursoDocente'
CREATE TABLE [dbo].[CursoDocente] (
    [Curso_Id] int  NOT NULL,
    [Docente_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [PK_Personas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Departamentos'
ALTER TABLE [dbo].[Departamentos]
ADD CONSTRAINT [PK_Departamentos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NotasEstudianteSet'
ALTER TABLE [dbo].[NotasEstudianteSet]
ADD CONSTRAINT [PK_NotasEstudianteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CursoSet'
ALTER TABLE [dbo].[CursoSet]
ADD CONSTRAINT [PK_CursoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personas_Estudiante'
ALTER TABLE [dbo].[Personas_Estudiante]
ADD CONSTRAINT [PK_Personas_Estudiante]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personas_Docente'
ALTER TABLE [dbo].[Personas_Docente]
ADD CONSTRAINT [PK_Personas_Docente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Curso_Id], [Docente_Id] in table 'CursoDocente'
ALTER TABLE [dbo].[CursoDocente]
ADD CONSTRAINT [PK_CursoDocente]
    PRIMARY KEY NONCLUSTERED ([Curso_Id], [Docente_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PersonasId] in table 'Departamentos'
ALTER TABLE [dbo].[Departamentos]
ADD CONSTRAINT [FK_DepartamentoPersonas]
    FOREIGN KEY ([PersonasId])
    REFERENCES [dbo].[Personas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartamentoPersonas'
CREATE INDEX [IX_FK_DepartamentoPersonas]
ON [dbo].[Departamentos]
    ([PersonasId]);
GO

-- Creating foreign key on [EstudianteId] in table 'NotasEstudianteSet'
ALTER TABLE [dbo].[NotasEstudianteSet]
ADD CONSTRAINT [FK_NotasEstudianteEstudiante]
    FOREIGN KEY ([EstudianteId])
    REFERENCES [dbo].[Personas_Estudiante]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_NotasEstudianteEstudiante'
CREATE INDEX [IX_FK_NotasEstudianteEstudiante]
ON [dbo].[NotasEstudianteSet]
    ([EstudianteId]);
GO

-- Creating foreign key on [CursoId] in table 'NotasEstudianteSet'
ALTER TABLE [dbo].[NotasEstudianteSet]
ADD CONSTRAINT [FK_CursoNotasEstudiante]
    FOREIGN KEY ([CursoId])
    REFERENCES [dbo].[CursoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CursoNotasEstudiante'
CREATE INDEX [IX_FK_CursoNotasEstudiante]
ON [dbo].[NotasEstudianteSet]
    ([CursoId]);
GO

-- Creating foreign key on [DepartamentoId] in table 'CursoSet'
ALTER TABLE [dbo].[CursoSet]
ADD CONSTRAINT [FK_CursoDepartamento]
    FOREIGN KEY ([DepartamentoId])
    REFERENCES [dbo].[Departamentos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CursoDepartamento'
CREATE INDEX [IX_FK_CursoDepartamento]
ON [dbo].[CursoSet]
    ([DepartamentoId]);
GO

-- Creating foreign key on [Curso_Id] in table 'CursoDocente'
ALTER TABLE [dbo].[CursoDocente]
ADD CONSTRAINT [FK_CursoDocente_Curso]
    FOREIGN KEY ([Curso_Id])
    REFERENCES [dbo].[CursoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Docente_Id] in table 'CursoDocente'
ALTER TABLE [dbo].[CursoDocente]
ADD CONSTRAINT [FK_CursoDocente_Docente]
    FOREIGN KEY ([Docente_Id])
    REFERENCES [dbo].[Personas_Docente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CursoDocente_Docente'
CREATE INDEX [IX_FK_CursoDocente_Docente]
ON [dbo].[CursoDocente]
    ([Docente_Id]);
GO

-- Creating foreign key on [Id] in table 'Personas_Estudiante'
ALTER TABLE [dbo].[Personas_Estudiante]
ADD CONSTRAINT [FK_Estudiante_inherits_Personas]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Personas]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Personas_Docente'
ALTER TABLE [dbo].[Personas_Docente]
ADD CONSTRAINT [FK_Docente_inherits_Personas]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Personas]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------