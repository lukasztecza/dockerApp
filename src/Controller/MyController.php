<?php
namespace SampleApp\Controller;

use LightApp\Controller\ControllerAbstract;
use LightApp\Model\System\Request;
use LightApp\Model\System\Response;

class MyController extends ControllerAbstract
{
    public function home(Request $request) : Response
    {
        return $this->jsonResponse(
            [
                'serverName' => $request->getServer(['SERVER_NAME'])['SERVER_NAME'],
                'serverPort' => $request->getServer(['SERVER_PORT'])['SERVER_PORT'],
                'httpHost' => $request->getServer(['HTTP_HOST'])['HTTP_HOST'],
                'hostName' => $request->getServer(['HOSTNAME'])['HOSTNAME']
            ],
            ['serverName' => 'raw', 'serverPort' => 'raw', 'httpHost' => 'raw', 'hostName' => 'raw']);
    }
}
