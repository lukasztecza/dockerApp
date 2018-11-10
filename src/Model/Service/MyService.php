<?php declare(strict_types=1);
namespace App\Model\Service;

use App\Model\Repository\MyRepository;

class MyService
{
    private $myRepository;

    public function __construct(MyRepository $myRepository)
    {
        $this->myRepository = $myRepository;
    }

    public function getSampleData() : array
    {
        $names = $this->myRepository->getNames();
        $items = $this->myRepository->getItems();

        return ["names" => $names, "items" => $items];
    }
}
