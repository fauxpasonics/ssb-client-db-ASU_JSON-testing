CREATE TABLE [etl].[Task]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[BatchID] [int] NOT NULL CONSTRAINT [DF__Task__BatchID__6EF57B66] DEFAULT ((0)),
[ExecutionOrder] [int] NOT NULL CONSTRAINT [DF__Task__ExecutionO__6FE99F9F] DEFAULT ((1)),
[TaskName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__TaskName__70DDC3D8] DEFAULT ('Not Specified'),
[TaskType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__TaskType__71D1E811] DEFAULT ('Not Specified'),
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__SQL__72C60C4A] DEFAULT (NULL),
[Target] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__Target__73BA3083] DEFAULT (NULL),
[Source] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__Source__74AE54BC] DEFAULT (NULL),
[CustomMatchOn] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__CustomMatc__75A278F5] DEFAULT (NULL),
[ExcludeColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__ExcludeCol__76969D2E] DEFAULT (NULL),
[Execute] [bit] NULL CONSTRAINT [DF__Task__Execute__778AC167] DEFAULT ((0)),
[FailBatchOnFailure] [bit] NULL CONSTRAINT [DF__Task__FailBatchO__787EE5A0] DEFAULT ((1)),
[SuppressResults] [bit] NULL CONSTRAINT [DF__Task__SuppressRe__797309D9] DEFAULT ((0)),
[RunSQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF__Task__Active__7A672E12] DEFAULT ((1)),
[CREATED_DATE] [datetime] NOT NULL CONSTRAINT [DF__Task__CREATED_DA__7B5B524B] DEFAULT ([etl].[ConvertToLocalTime](getdate())),
[LUPDATED_DATE] [datetime] NOT NULL CONSTRAINT [DF__Task__LUPDATED_D__7C4F7684] DEFAULT ([etl].[ConvertToLocalTime](getdate()))
)
GO
ALTER TABLE [etl].[Task] ADD CONSTRAINT [PK__Task__3214EC27C1F977BA] PRIMARY KEY CLUSTERED  ([ID])
GO
