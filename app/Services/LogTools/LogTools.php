<?php

declare(strict_types=1);


namespace App\Services\LogTools;


use App\Services\LogTools\Interfaces\LogToolsInterface;

/**
 * Class LogTools
 *
 * @package App\Services\LogTools
 */
class LogTools implements LogToolsInterface
{
    /**
     * @param array $logs
     * @return bool
     */
    public function DispatchSaveLog(array $logs): bool
    {
        // TODO: Implement DispatchSaveLog() method.
    }
}
