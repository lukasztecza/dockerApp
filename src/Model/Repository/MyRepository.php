<?php declare(strict_types=1);
namespace App\Model\Repository;

use LightApp\Model\Repository\RepositoryAbstract;

class MyRepository extends RepositoryAbstract
{
    public function getNames() : array
    {
        return $this->getRead()->fetch('SELECT * FROM `names`');
    }

    public function getItems() : array
    {
        return $this->getRead()->fetch('SELECT * FROM `items`');
    }
}
