<?php

namespace App\Controller;

use App\Entity\Profile;
use App\Form\ProfileType;
use App\Repository\ProfileRepository;
use App\Services\UploadImage;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use MercurySeries\FlashyBundle\FlashyNotifier;
use Knp\Component\Pager\PaginatorInterface;
use Dompdf\Dompdf;
use Dompdf\Options;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;


/**
 * @Route("/profile")
 */
class ProfileController extends AbstractController
{
    /**
     * @Route("/listprofil/{id}", name="listprofil", methods={"GET"})
     */
    public function print(ProfileRepository $profileRepository,int $id)
    {
        // Configure Dompdf according to your needs
        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $pdfOptions->setIsRemoteEnabled(true);
        // Instantiate Dompdf with our options
        $dompdf = new Dompdf($pdfOptions);

        $profile=$profileRepository->findBy(["id"=>$id]);

        // Retrieve the HTML generated in our twig file
        $html = $this->renderView('profile/listprofil.html.twig', [
            'profiles' => $profile,
        ]);

        // Load HTML to Dompdf
        $dompdf->loadHtml($html);

        // (Optional) Setup the paper size and orientation 'portrait' or 'portrait'
        $dompdf->setPaper('A4', 'portrait');

        // Render the HTML as PDF
        $dompdf->render();

        // Output the generated PDF to Browser (force download)
        $dompdf->stream("profilespdf.pdf", [
            "Attachment" => true
        ]);
    }

    /**
     * @Route("/", name="profile_index", methods={"GET"})
     */
    public function index(ProfileRepository $profileRepository,Request $request,PaginatorInterface $paginator): Response
    {
        return $this->render('profile/index.html.twig', [
            'profiles' => $profileRepository->findAll(),
        ]);
    }
    /**
     * @Route("/getProfileJSON", name="getProfileJSON")
     */
    public function getProfileJSON(NormalizerInterface $Normalizer): Response
    {
        $reclamations = $this->getDoctrine()
            ->getRepository(Profile::class)
            ->findAll();

        $jsonContent=$Normalizer->normalize($reclamations,'json',['groups'=>'post:read']);
        /*return $this->render('reclamation/getReclamationsJSON.html.twig', [
            'data' => $jsonContent,
        ]);*/
        return new Response(json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }
    /**
     * @Route("/getProfileByIdCompteJSON/{idCompte}", name="getProfileByIdCompteJSON")
     */
    public function getProfileByIdCompteJSON(NormalizerInterface $Normalizer,int $idCompte): Response
    {
        $reclamations = $this->getDoctrine()
            ->getRepository(Profile::class)
            ->findBy(["id_compte"=>$idCompte]);

        $jsonContent=$Normalizer->normalize($reclamations,'json',['groups'=>'post:read']);
        /*return $this->render('reclamation/getReclamationsJSON.html.twig', [
            'data' => $jsonContent,
        ]);*/
        return new Response(json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }
    /**
     * @Route("/deleteProfileJSON/{id}", name="deleteProfileJSON")
     */
    public function deleteProfileJSON(Request $request,NormalizerInterface $Normalizer,$id): Response
    {
        $em=$this->getDoctrine()->getManager();
        $profile=$em->getRepository(Profile::class)->find($id);
        $em->remove($profile);
        $em->flush();
        $jsonContent=$Normalizer->normalize($profile,'json',['groups'=>'post:read']);
        return new Response("Profile deleted successfully".json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }

    /**
     * @Route("/addProfileJSON", name="addProfileJSON")
     */
    public function addProfileJSON(Request $request,NormalizerInterface $Normalizer): Response
    {
        $profile=new Profile();
        $profile->setNom($request->get('nom'));
        $profile->setPhoto($request->get('photo'));
        $profile->setDescription($request->get('description'));
        $profile->setCategorie($request->get('categorie'));
        $profile->setRating($request->get('rating'));
        $profile->setDetail($request->get('detail'));
        $profile->setIdCompte($request->get('idcompte'));



        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($profile);
        $entityManager->flush();

        $jsonContent=$Normalizer->normalize($profile,'json',['groups'=>'post:read']);
        return new Response("Profile added successfully".json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }
    /**
     * @Route("/editProfileJSON", name="editProfileJSON")
     */
    public function editProfileJSON(Request $request,NormalizerInterface $Normalizer): Response
    {
        $profile = $this->getDoctrine()
            ->getRepository(Profile::class)
            ->find($request->get('id'));
        $profile->setNom($request->get('nom'));
        $profile->setPhoto($request->get('photo'));
        $profile->setDescription($request->get('description'));
        $profile->setCategorie($request->get('categorie'));
        $profile->setRating($request->get('rating'));
        $profile->setDetail($request->get('detail'));
        $profile->setIdCompte($request->get('idcompte'));

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($profile);
        $entityManager->flush();

        $jsonContent=$Normalizer->normalize($profile,'json',['groups'=>'post:read']);
        return new Response("Profile edit successfully".json_encode($jsonContent,JSON_UNESCAPED_UNICODE));
    }

    /**
     * @Route("/showBack", name="profile_back", methods={"GET"})
     */
    public function showBack(ProfileRepository $profileRepository): Response
    {
        return $this->render('profile/showBack.html.twig', [
            'profiles' => $profileRepository->findAll(),
        ]);
    }


    /**
     * @Route("/new", name="profile_new", methods={"GET","POST"})
     */
    public function new(Request $request,FlashyNotifier $flashy): Response
    {
        $profile = new Profile();
        $form = $this->createForm(ProfileType::class, $profile);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $file = $profile->getPhoto();

            if($file) {
                $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $fileName = $originalFilename."-".uniqid().'.'.$file->guessExtension();

                $file->move(
                    $this->getParameter('image_directory'),
                    $fileName
                );

                $profile->setPhoto($fileName);

            }
            $profile->setIdCompte(000);
            // Add Id Of current User

            /* $userConnected = $this->getUser();
             $userConnectedId = $userConnected->getId();
             $profile->setIdCompte($userConnectedId);*/
            $entityManager->persist($profile);
            $entityManager->flush();
            $flashy->success('profile created!');

            return $this->redirectToRoute('profile_index');
        }

        return $this->render('profile/new.html.twig', [
            'profile' => $profile,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="profile_show", methods={"GET"})
     */
    public function show(Profile $profile): Response
    {
        return $this->render('profile/show.html.twig', [
            'profile' => $profile,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="profile_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Profile $profile): Response
    {
        $form = $this->createForm(ProfileType::class, $profile);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $file = $profile->getPhoto();

            if($file) {
                $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $fileName = $originalFilename."-".uniqid().'.'.$file->guessExtension();

                $file->move(
                    $this->getParameter('image_directory'),
                    $fileName
                );

                $profile->setPhoto($fileName);

            }
            $profile->setIdCompte(000);
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('profile_index');
        }

        return $this->render('profile/edit.html.twig', [
            'profile' => $profile,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="profile_delete", methods={"POST"})
     */
    public function delete(Request $request, Profile $profile,FlashyNotifier $flashy): Response
    {
        if ($this->isCsrfTokenValid('delete'.$profile->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($profile);
            $entityManager->flush();
            $flashy->success('Profile supprime!');

        }

        return $this->redirectToRoute('profile_index');
    }

}
