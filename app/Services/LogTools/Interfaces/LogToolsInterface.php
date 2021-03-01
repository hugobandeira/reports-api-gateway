<?php

declare(strict_types=1);


namespace App\Services\LogTools\Interfaces;


/**
 * Interface LogTools
 *
 * @package App\Services\LogTools
 */
interface LogToolsInterface
{
    /**
     * Method receive logs for save in dataBase
     *
     * @param array $logs
     * @return bool
     */
    public function DispatchSaveLog(array $logs): bool;
}
