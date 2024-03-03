<?php

namespace App\Controller;

use App\Repository\TodoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Attribute\Route;

class TodoController extends AbstractController
{
    // #[Route('/todo', name: 'app_todo')]
    // public function index(): JsonResponse
    // {
    //     return $this->json([
    //         'message' => 'Welcome to your new controller!',
    //         'path' => 'src/Controller/TodoController.php',
    //     ]);
    // }

    #[Route('/api/todo', name: 'get_todo', methods: ['GET'])]
    public function getTodo(TodoRepository $todoRepository): JsonResponse
    {
        $todos = $todoRepository->findAll();
        $data = [];

        foreach ($todos as $todo) {
            $data[] = [
                'id' => $todo->getId(),
                'title' => $todo->getTitle(),
            ];
        }

        return new JsonResponse($data, JsonResponse::HTTP_OK);
    }
}
