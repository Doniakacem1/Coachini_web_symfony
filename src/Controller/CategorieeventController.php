<?php

namespace App\Controller;

use App\Entity\Categorieevent;
use App\Form\CategorieeventType;
use App\Repository\CategorieeventRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;

/**
 * @Route("/categorieevent")
 */
class CategorieeventController extends AbstractController
{

    /**
     * @Route("/listallcategorieevents", name="listallcategorieevents")
     */
    public function mobileindex(NormalizerInterface $normalizer)
    {
        $repository=$this->getDoctrine()->getRepository(Categorieevent::class);
        $CEvents =$repository->findAll();
        $json=$normalizer->normalize($CEvents,'json',['groups'=>'Cevents']);

        return new Response(json_encode($json));
    }
    /**
     * @Route("/addcategorieevent", name="addcategorieevent")
     */
    public function mobileAddEvent(Request $request,NormalizerInterface $normalizer)
    {
        $em=$this->getDoctrine()->getManager();
        $CEvent=new Categorieevent();
        $CEvent->setNom($request->get('nom'));
        $CEvent->setDescription($request->get('description'));
        $CEvent->setImage($request->get('dbPicture'));
        //$CEvent->setDbPicture($request->get('dbPicture'));
        $em ->persist($CEvent);
        $em->flush();
        $json=$normalizer->normalize($CEvent,'json',['groups'=>'Cevents']);
        return  new Response('Categorie Event added succefully');
    }

    /**
     * @Route("/updateCategorieEvent/{id}", name="updateCategorieEvent")
     */
    public function mobileupdate(Request $request,NormalizerInterface $normalizer,$id)
    {
        $em=$this->getDoctrine()->getManager();
        $CEvent=$em->getRepository(Categorieevent::class)->find($id);
        $CEvent->setNom($request->get('nom'));
        $CEvent->setDescription($request->get('description'));
        $CEvent->setPhoto($request->get('photo'));
        $em->flush();
        $json=$normalizer->normalize($CEvent,'json',['groups'=>'Cevents']);
        return  new Response('Updated succefully');
    }

    /**
     * @Route("/deleteCategorieEvent/{id}", name="deleteCategorieEvent")
     */
    public function mobiledeleteEvent(Request $request,NormalizerInterface $normalizer,$id)
    {
        $em=$this->getDoctrine()->getManager();
        $CategorieEvent=$em->getRepository(Categorieevent::class)->find($id);
        $em ->remove($CategorieEvent);
        $em->flush();
        $json=$normalizer->normalize($CategorieEvent,'json',['groups'=>'Cevents']);
        return  new Response('Event Deleted succefully');
    }
    /**
     * @Route("/", name="categorieevent_index", methods={"GET"})
     */
    public function index(CategorieeventRepository $categorieeventRepository): Response
    {
        return $this->render('categorieevent/index.html.twig', [
            'categorieevents' => $categorieeventRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="categorieevent_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $categorieevent = new Categorieevent();
        $form = $this->createForm(CategorieeventType::class, $categorieevent);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($categorieevent);
            $entityManager->flush();

            return $this->redirectToRoute('categorieevent_index');
        }

        return $this->render('categorieevent/new.html.twig', [
            'categorieevent' => $categorieevent,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="categorieevent_show", methods={"GET"})
     */
    public function show(Categorieevent $categorieevent): Response
    {
        return $this->render('categorieevent/show.html.twig', [
            'categorieevent' => $categorieevent,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="categorieevent_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Categorieevent $categorieevent): Response
    {
        $form = $this->createForm(CategorieeventType::class, $categorieevent);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('categorieevent_index');
        }

        return $this->render('categorieevent/edit.html.twig', [
            'categorieevent' => $categorieevent,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="categorieevent_delete", methods={"POST"})
     */
    public function delete(Request $request, Categorieevent $categorieevent): Response
    {
        if ($this->isCsrfTokenValid('delete'.$categorieevent->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($categorieevent);
            $entityManager->flush();
        }

        return $this->redirectToRoute('categorieevent_index');
    }
}
