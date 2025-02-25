CREATE TYPE "public"."schedule_status" AS ENUM('disabled', 'scheduled', 'running');

--> statement-breakpoint
CREATE TABLE "clusters" (
	"id" serial PRIMARY KEY NOT NULL,
	"cluster_identifier" text,
	"integration" text,
	"data" jsonb,
	"region" text DEFAULT 'us-east-1' NOT NULL,
	CONSTRAINT "instances_integration_identifier_unique" UNIQUE("cluster_identifier", "integration")
);

--> statement-breakpoint
CREATE TABLE "connections" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text,
	"is_default" boolean,
	"connstring" text,
	"params" jsonb,
	CONSTRAINT "connections_name_unique" UNIQUE("name"),
	CONSTRAINT "connections_connstring_unique" UNIQUE("connstring")
);

--> statement-breakpoint
CREATE TABLE "dbinfo" (
	"id" serial PRIMARY KEY NOT NULL,
	"connid" integer,
	"module" text,
	"data" jsonb,
	CONSTRAINT "dbinfo_module_unique" UNIQUE("connid", "module")
);

--> statement-breakpoint
CREATE TABLE "integrations" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text,
	"data" jsonb,
	CONSTRAINT "integrations_name_unique" UNIQUE("name")
);

--> statement-breakpoint
CREATE TABLE "assoc_cluster_connections" (
	"id" serial PRIMARY KEY NOT NULL,
	"cluster_id" integer,
	"connection_id" integer
);

--> statement-breakpoint
CREATE TABLE "schedules" (
	"id" serial PRIMARY KEY NOT NULL,
	"connection_id" integer NOT NULL,
	"playbook" varchar(255) NOT NULL,
	"schedule_type" varchar(255) NOT NULL,
	"cron_expression" varchar(255),
	"additional_instructions" text,
	"min_interval" integer,
	"max_interval" integer,
	"enabled" boolean NOT NULL,
	"last_run" timestamp,
	"next_run" timestamp,
	"status" "schedule_status" DEFAULT 'disabled',
	"failures" integer DEFAULT 0,
	"model" text DEFAULT 'openai-gpt-4o'
);

--> statement-breakpoint
ALTER TABLE
	"clusters"
ADD
	CONSTRAINT "instances_integration_fkey" FOREIGN KEY ("integration") REFERENCES "public"."integrations"("name") ON DELETE no action ON UPDATE no action;

--> statement-breakpoint
ALTER TABLE
	"dbinfo"
ADD
	CONSTRAINT "dbinfo_connid_fkey" FOREIGN KEY ("connid") REFERENCES "public"."connections"("id") ON DELETE no action ON UPDATE no action;

--> statement-breakpoint
ALTER TABLE
	"assoc_cluster_connections"
ADD
	CONSTRAINT "assoc_instance_connections_instance_id_fkey" FOREIGN KEY ("cluster_id") REFERENCES "public"."clusters"("id") ON DELETE no action ON UPDATE no action;

--> statement-breakpoint
ALTER TABLE
	"assoc_cluster_connections"
ADD
	CONSTRAINT "assoc_instance_connections_connection_id_fkey" FOREIGN KEY ("connection_id") REFERENCES "public"."connections"("id") ON DELETE no action ON UPDATE no action;

--> statement-breakpoint
ALTER TABLE
	"schedules"
ADD
	CONSTRAINT "schedules_connection_id_fkey" FOREIGN KEY ("connection_id") REFERENCES "public"."connections"("id") ON DELETE no action ON UPDATE no action;