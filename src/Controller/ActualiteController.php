<?php

namespace App\Controller;

use App\Entity\Actualite;
use App\Form\ActualiteType;
use App\Repository\ActualiteRepository;
use MercurySeries\FlashyBundle\FlashyNotifier;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;

/**
 * @Route("/actualite")
 */
class ActualiteController extends AbstractController
{
    /**
     * @Route("/", name="actualite_index", methods={"GET"})
     */
    public function index(ActualiteRepository $actualiteRepository,Request $request,PaginatorInterface $paginator): Response
    {
        $donnees = $this->getDoctrine()->getRepository(Actualite::class)->findAll();

        $actualite = $paginator->paginate(
            $donnees, // Requête contenant les données à paginer (ici nos articles)
            $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
            2 // Nombre de résultats par page
        );

        return $this->render('actualite/index.html.twig', [
            'actualites' => $actualite,
        ]);

    }


    /**
     * @Route("/getActualiteJSON", name="getActualiteJSON")
     */
    public function getActualiteJSON(NormalizerInterface $Normalizer): Response
    {
        $reclamations = $this->getDoctrine()
            ->getRepository(Actualite::class)
            ->findAll();

        $jsonContent=$Normalizer->normalize($reclamations,'json',['groups'=>'post:read']);
        /*return $this->render('reclamation/getReclamationsJSON.html.twig', [
            'data' => $jsonContent,
        ]);*/
        return new Response(json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }

    /**
     * @Route("/searchActJSON/{statut}", name="searchActJSON")
     */
    public function searchActJSON($statut, NormalizerInterface $Normalizer): Response
    {

        $actualite = $this->getDoctrine()

            ->getRepository(Actualite::class)
            ->findActualiteByStatus($statut);

        $jsonContent=$Normalizer->normalize($actualite,'json',['groups'=>'post:read']);
        /*return $this->render('reclamation/getReclamationsJSON.html.twig', [
            'data' => $jsonContent,
        ]);*/
        return new Response(json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }
    /**
     * @Route("/deleteActualiteJSON/{id}", name="deleteActualiteJSON")
     */
    public function deleteActualiteJSON(Request $request,NormalizerInterface $Normalizer,$id): Response
    {
        $em=$this->getDoctrine()->getManager();
        $profile=$em->getRepository(Actualite::class)->find($id);
        $em->remove($profile);
        $em->flush();
        $jsonContent=$Normalizer->normalize($profile,'json',['groups'=>'post:read']);
        return new Response("Actualite deleted successfully".json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }

    /**
     * @Route("/addActualiteJSON", name="addActualiteJSON")
     */
    public function addActualiteJSON(Request $request,NormalizerInterface $Normalizer): Response
    {
        $actualite=new Actualite();
        $actualite->setStatut($request->get('statut'));
        $actualite->setImage($request->get('image'));
        $actualite->setFichier($request->get('fichier'));
        $actualite->setBio($request->get('bio'));
        $actualite->setCompetence($request->get('competence'));
        $actualite->setLikepub($request->get('likepub'));
        $date = new \DateTime('now');
        $actualite->setDatepub($date);




        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($actualite);
        $entityManager->flush();

        $jsonContent=$Normalizer->normalize($actualite,'json',['groups'=>'post:read']);
        return new Response("Actulalite added successfully".json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }
    /**
     * @Route("/editActualiteJSON", name="editActualiteJSON")
     */
    public function editActualiteJSON(Request $request,NormalizerInterface $Normalizer): Response
    {
        $actualite = $this->getDoctrine()
            ->getRepository(Actualite::class)
            ->find($request->get('id'));
        $actualite->setStatut($request->get('statut'));
        $actualite->setImage($request->get('image'));
        $actualite->setFichier($request->get('fichier'));
        $actualite->setBio($request->get('bio'));
        $actualite->setCompetence($request->get('competence'));
        $actualite->setLikepub($request->get('likepub'));
        $date = new \DateTime('now');
        $actualite->setDatepub($date);

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($actualite);
        $entityManager->flush();

        $jsonContent=$Normalizer->normalize($actualite,'json',['groups'=>'post:read']);
        return new Response("Actualite edit successfully".json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }



    /**
     * @Route("/myact", name="actualite_indexact", methods={"GET"})
     */
    public function indexact(ActualiteRepository $actualiteRepository,Request $request,PaginatorInterface $paginator): Response
    {
        $donnees = $this->getDoctrine()->getRepository(Actualite::class)->findAll();

        $actualite = $paginator->paginate(
            $donnees, // Requête contenant les données à paginer (ici nos articles)
            $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
            2 // Nombre de résultats par page
        );

        return $this->render('actualite/indexact.html.twig', [
            'actualites' => $actualite,
        ]);

    }
    /**
     * @Route("/showActualiteBack", name="actualite_back", methods={"GET"})
     */
    public function showActualiteBack(ActualiteRepository $actualiteRepository): Response
    {
        return $this->render('actualite/showActualiteBack.html.twig', [
            'actualites' => $actualiteRepository->findAll(),
        ]);
    }


    /**
     * @Route("/new", name="actualite_new", methods={"GET","POST"})
     */
    public function new(Request $request,FlashyNotifier $flashy): Response
    {
        $actualite = new Actualite();
        $form = $this->createForm(ActualiteType::class, $actualite);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();

            $file =  $actualite->getImage();
            $file1 = $actualite->getFichier();


            if($file) {
                $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $fileName = $originalFilename."-".uniqid().'.'.$file->guessExtension();

                $file->move(
                    $this->getParameter('image_directory'),
                    $fileName
                );

                $actualite->setImage($fileName);

            }
            if($file1) {
                $originalFilename1 = pathinfo($file1->getClientOriginalName(), PATHINFO_FILENAME);
                $fileName1 = $originalFilename1."-".uniqid().'.'.$file1->guessExtension();

                $file1->move(
                    $this->getParameter('file_directory'),
                    $fileName1
                );

                $actualite->setFichier($fileName1);

            }
            $actualite->setDatepub(new \DateTime('now'));

            $entityManager->persist($actualite);
            $entityManager->flush();
            $flashy->primary('Actualite créer!', 'http://your-awesome-link.com');

            return $this->redirectToRoute('actualite_index');
        }

        return $this->render('actualite/new.html.twig', [
            'actualite' => $actualite,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="actualite_show", methods={"GET"})
     */
    public function show(Actualite $actualite): Response
    {
        return $this->render('actualite/show.html.twig', [
            'actualite' => $actualite,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="actualite_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Actualite $actualite): Response
    {
        $oldPhoto = $actualite->getImage();
        $oldFile = $actualite->getFichier();
        $form = $this->createForm(ActualiteType::class, $actualite);
        $form->handleRequest($request);



        if ($form->isSubmitted() && $form->isValid()) {
            $file = $actualite->getImage();
            $file1 = $actualite->getFichier();

            if($file) {
                $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $fileName = $originalFilename . "-" . uniqid() . '.' . $file->guessExtension();

                $file->move(
                    $this->getParameter('image_directory'),
                    $fileName
                );

                $actualite->setImage($fileName);
            }
            else {
                $actualite->setImage($oldPhoto);
            }
            if($file1) {
                $originalFilename1 = pathinfo($file1->getClientOriginalName(), PATHINFO_FILENAME);
                $fileName1 = $originalFilename1."-".uniqid().'.'.$file1->guessExtension();

                $file1->move(
                    $this->getParameter('file_directory'),
                    $fileName1
                );

                $actualite->setFichier($fileName1);

            }
            else {
                $actualite->setFichier($oldFile);
            }
            $actualite->setDatepub(new \DateTime('now'));
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('actualite_index');
        }

        return $this->render('actualite/edit.html.twig', [
            'actualite' => $actualite,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="actualite_delete", methods={"POST"})
     */
    public function delete(Request $request, Actualite $actualite): Response
    {
        if ($this->isCsrfTokenValid('delete'.$actualite->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($actualite);
            $entityManager->flush();
        }

        return $this->redirectToRoute('actualite_index');
    }

    /**
         * @Route("/like/{id}", name="like", methods={"GET"})
     */
    public function Like(ActualiteRepository $facceuilRepository,$id): Response
    {
        $Actualite = $this->getDoctrine()->getRepository(Actualite::class)->find($id);
        $Actualite->setLikepub(1);
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($Actualite);
        $entityManager->flush();

        return $this->redirectToRoute('actualite_index');

    }

    /**
     * @Route("/deslilike/{id}", name="deslike", methods={"GET"})
     */
    public function Deslike(ActualiteRepository $facceuilRepository,$id): Response
    {
        $Actualite = $this->getDoctrine()->getRepository(Actualite::class)->find($id);
        $Actualite->setLikepub(0);
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($Actualite);
        $entityManager->flush();


        return $this->redirectToRoute('actualite_index');

    }
}
