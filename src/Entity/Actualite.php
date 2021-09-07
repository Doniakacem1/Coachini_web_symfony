<?php

namespace App\Entity;

use App\Repository\ActualiteRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=ActualiteRepository::class)
 */
class Actualite
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer",name="IdAct")
     * @Groups("post:read")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255,name="Statut")
     *  @Assert\NotBlank(message="Statut is required")
     * @Groups("post:read")
     */
    private $statut;

    /**
     * @ORM\Column(type="string", length=2083,name="Image")
     *  @Assert\NotBlank(message="Image is required")
     * @Groups("post:read")
     */
    private $image;

    /**
     * @ORM\Column(type="string", length=2083,name="Fichier",nullable=true)
     *  @Assert\NotBlank(message="fichier is required")
     * @Groups("post:read")
     */
    private $fichier;

    /**
     * @ORM\Column(type="string", length=255,name="Bio")
     *  @Assert\NotBlank(message="biographie is required")
     * @Groups("post:read")
     */
    private $bio;

    /**
     * @ORM\Column(type="string", length=255,name="Compétence")
     *  @Assert\NotBlank(message="Competence is required")
     * @Groups("post:read")
     */
    private $competence;

    /**
     * @ORM\Column(type="integer", nullable=true,options={"default" : 0})
     * @Groups("post:read")
     */
    private $likepub=0;

    /**
     * @ORM\Column(type="datetime")
     * @Groups("post:read")
     *
     */
    private $datepub;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStatut(): ?string
    {
        return $this->statut;
    }

    public function setStatut(string $statut): self
    {
        $this->statut = $statut;

        return $this;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function setImage( $image): void
    {
        $this->image = $image;

    }

    /**
     * @return mixed
     */
    public function getFichier()
    {
        return $this->fichier;
    }

    /**
     * @param mixed $fichier
     */
    public function setFichier($fichier): void
    {
        $this->fichier = $fichier;
    }



    public function getBio(): ?string
    {
        return $this->bio;
    }

    public function setBio(string $bio): self
    {
        $this->bio = $bio;

        return $this;
    }

    public function getCompetence(): ?string
    {
        return $this->competence;
    }

    public function setCompetence(string $competence): self
    {
        $this->competence = $competence;

        return $this;
    }

    public function getLikepub(): ?int
    {
        return $this->likepub;
    }

    public function setLikepub(?int $likepub): self
    {
        $this->likepub = $likepub;

        return $this;
    }

    public function getDatepub(): ?\DateTimeInterface
    {
        return $this->datepub;
    }

    public function setDatepub(\DateTimeInterface $datepub): self
    {
        $this->datepub = $datepub;

        return $this;
    }
}
