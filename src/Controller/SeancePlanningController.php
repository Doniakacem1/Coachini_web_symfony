<?php

namespace App\Controller;

use App\Entity\SeancePlanning;
use App\Form\SeancePlanningType;
use App\Entity\SeancePlanningRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use MercurySeries\FlashyBundle\FlashyNotifier;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;

/**
 * @Route("/seance/planning")
 */
class SeancePlanningController extends AbstractController
{
    /**
     * @Route("/", name="seance_planning_index", methods={"GET"})
     */
    public function index(SeancePlanningRepository $seancePlanningRepository): Response
    {
        return $this->render('seance_planning/index.html.twig', [ #was basePlanning
            'seance_plannings' => $seancePlanningRepository->findAll(),
        ]);
    }
    /**
     * @Route("/allplanningjson", name="allplanningjson")
     */
    public function allseances( NormalizerInterface $Normalizer )
        //http://127.0.0.1:8000/seance/planning/allplanningjson
    {
        $repository = $this->getDoctrine()->getRepository(SeancePlanning::class);
        $seances = $repository->findAll();

        $jsonContent = $Normalizer->normalize($seances,'json',['groups'=>'post:read']);

        return new Response(json_encode($jsonContent));
    }


    /**
     * @Route("/seanceplanningjsonid", name="seanceplanningjsonID" )
     */
    public function SeanceIDJSON( Request $request,NormalizerInterface $Normalizer )
        //http://127.0.0.1:8000/seance/planning/seanceplanningjsonid?id=79
    {
        $id= $request->get('id');
        $em = $this->getDoctrine()->getManager();
        $seance = $em->getRepository(SeancePlanning::class)->find($id);

        $jsonContent = $Normalizer->normalize($seance,'json',['groups'=>'post:read']);

        return new Response(json_encode($jsonContent));
    }
    /**
     * @Route("/addseanceclientid/new", name="addseanceclientjson")
     */
    public function addSeanceJSON( Request $request,NormalizerInterface $Normalizer )
        //http://127.0.0.1:8000/seance/planning/addseanceclientid/new?userName=ademmobile&summary=test mobile&description=json mobile&date=2021-03-21&startsAt=16:58:23&finishsAt=17:58:23&localisation=sousse


    {
        $em = $this->getDoctrine()->getManager();
        $seance= new SeancePlanning();
        $seance->setUserName($request->get('userName'));
        $seance->setSummary($request->get('summary'));
        $seance->setDescription($request->get('description'));
        $seance->setDate($request->get('date'));
        $seance->setStartsAt($request->get('startsAt'));
        $seance->setFinishsAt($request->get('finishsAt'));
        $seance->setLocalisation($request->get('localisation'));
        $em->persist($seance);
        $em->flush();

        $jsonContent = $Normalizer->normalize($seance,'json',['groups'=>'post:read']);

        return new Response(json_encode($jsonContent));
    }
    /**
     * @Route("/updateseanceclientJSON", name="updateseanceclient")
     */
    public function updateSeanceJSON( Request $request,NormalizerInterface $Normalizer )
        //http://127.0.0.1:8000/seance/planning/updateseanceclientJSON?userName=ademmobile&summary=edit2 mobile&description=json mobile&date=2021-03-21&startsAt=16:58:23&finishsAt=17:58:23&localisation=sousse
    {
        $id= $request->get('userName');
        $em = $this->getDoctrine()->getManager();
        $seance = $em->getRepository(SeancePlanning::class)->find($id);

        $seance->setUserName($request->get('userName'));
        $seance->setSummary($request->get('summary'));
        $seance->setDescription($request->get('description'));
        $seance->setDate($request->get('date'));
        $seance->setStartsAt($request->get('startsAt'));
        $seance->setFinishsAt($request->get('finishsAt'));
        $seance->setLocalisation($request->get('localisation'));
        $em->flush();

        $jsonContent = $Normalizer->normalize($seance,'json',['groups'=>'post:read']);

        return new Response("Seance Updated !".json_encode($jsonContent));
    }
    /**
     * @Route("/deleteseanceclientJSON", name="deleteseanceclient")
     */
    public function deleteSeancejson( Request $request,NormalizerInterface $Normalizer )
        //http://127.0.0.1:8000/seance/planning/deleteseanceclientJSON?userName=ademmobile
    {
        $id= $request->get('userName');
        $em = $this->getDoctrine()->getManager();
        $seance = $em->getRepository(SeancePlanning::class)->find($id);

        $em->remove($seance);
        $em->flush();

        $jsonContent = $Normalizer->normalize($seance,'json',['groups'=>'post:read']);

        return new Response("seance deleted !".json_encode($jsonContent));
    }

    /**
     * @Route("/client", name="seance_planning_index_client", methods={"GET"})
     */
    public function indexclient(SeancePlanningRepository $seancePlanningRepository): Response
    {
        return $this->render('seance_planning/indexclient.html.twig', [ #was basePlanning
            'seance_plannings' => $seancePlanningRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="seance_planning_new", methods={"GET","POST"})
     */
    public function new(Request $request , FlashyNotifier $flashy): Response
    {
        $seancePlanning = new SeancePlanning();
        $form = $this->createForm(SeancePlanningType::class, $seancePlanning);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($seancePlanning);
            $entityManager->flush();
            $flashy->success('Your meeting has been successfully created!');
            return $this->redirectToRoute('seance_planning_index');
        }

        return $this->render('seance_planning/new.html.twig', [
            'seance_planning' => $seancePlanning,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="seance_planning_show", methods={"GET"})
     */
    public function show(SeancePlanning $seancePlanning): Response
    {
        return $this->render('seance_planning/show.html.twig', [
            'seance_planning' => $seancePlanning,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="seance_planning_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, SeancePlanning $seancePlanning , FlashyNotifier $flashy): Response
    {
        $form = $this->createForm(SeancePlanningType::class, $seancePlanning);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            $flashy->info('Your Meeting have been successfully UPDATED!');
            return $this->redirectToRoute('seance_planning_index');
        }

        return $this->render('seance_planning/edit.html.twig', [
            'seance_planning' => $seancePlanning,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="seance_planning_delete", methods={"POST"})
     */
    public function delete(Request $request, SeancePlanning $seancePlanning , FlashyNotifier $flashy): Response
    {
        if ($this->isCsrfTokenValid('delete'.$seancePlanning->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($seancePlanning);
            $entityManager->flush();
        }
        $flashy->error('Meeting Have been successfully DELETED!');
        return $this->redirectToRoute('seance_planning_index');
    }
    /**
     * @Route("/calendar", name="booking_calendar", methods={"GET"})
     */
    public function calendar(): Response
    {
        return $this->render('seance_planning/calendar.html.twig');
    }
}
