<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class IndexController extends AbstractController
{
    #[Route(path: '/dupa', name: 'test', methods: ['GET'])]
    public function index(): Response
    {
        return $this->json("{'test': 'test'}");
    }
}
