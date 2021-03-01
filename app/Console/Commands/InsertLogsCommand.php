<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Services\LogTools\Interfaces\LogToolsInterface;
use Illuminate\Console\Command;

/**
 * Class InsertLogsCommand
 *
 * @package App\Console\Commands
 */
class InsertLogsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'logs:insert';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * @var LogToolsInterface
     */
    private LogToolsInterface $logTools;

    /**
     * Create a new command instance.
     *
     * @param LogToolsInterface $logTools
     */
    public function __construct(LogToolsInterface $logTools)
    {
        parent::__construct();

        $this->logTools = $logTools;
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(): int
    {

        $this->logTools->DispatchSaveLog([]);
        return 0;
    }
}
