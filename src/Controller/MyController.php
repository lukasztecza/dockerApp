<?php
namespace App\Controller;

use LightApp\Controller\ControllerAbstract;
use LightApp\Model\System\Request;
use LightApp\Model\System\Response;

use App\Model\Service\MyService;

class MyController extends ControllerAbstract
{
    private $myService;

    public function __construct(MyService $myService)
    {
        $this->myService = $myService;
    }

    public function home(Request $request) : Response
    {
        $sampleData = $this->myService->getSampleData();

        return $this->jsonResponse(
            [
                'serverName' => $request->getServer(['SERVER_NAME'])['SERVER_NAME'],
                'serverPort' => $request->getServer(['SERVER_PORT'])['SERVER_PORT'],
                'httpHost' => $request->getServer(['HTTP_HOST'])['HTTP_HOST'],
                'hostName' => $request->getServer(['HOSTNAME'])['HOSTNAME'],
                'sampleData' => $sampleData
            ],
            ['serverName' => 'raw', 'serverPort' => 'raw', 'httpHost' => 'raw', 'hostName' => 'raw']
        );
    }
}
