package org.glsid.entities;

import java.io.Serializable;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.envers.Audited;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonSetter;

@Entity
@Table(name="EVOLUTION")
public class Evolution implements Serializable {

	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	static SecureRandom rnd = new SecureRandom();

	String randomString(int len) {
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		return sb.toString();
	}

	@Id

	private String idEvolution;

	@Audited
	@Column(name = "ref", nullable = false, unique = true)
	@Size(min = 3, max = 50)
	private String RefEvolution;
	private String Description;

	
	@ManyToOne()
	@JoinColumn(name = "id_Cpsi" )
	private Cpsi cpsi;
	
	

	@ManyToOne
	@JoinColumn(name = "id_type")
	private TypeEvolution typeEvolution;

	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection<User> cprecettes;

	@ManyToOne
	@JoinColumn(name = "id_livraison")
	private Livraison etatLivaison;
	
	@Column(name = "etat_recette")
	private String EtatRecette;

	private Date created;
	private Date updated;
	
	@Audited
	@Column(name = "date_mep_souhaitee")
	private Date dateMepSouhaitee;

	private String commentaires;

	@Audited
	@Column(name = "date_debut_tests")
	private Date dateDebutTests;

	@Audited
	@Column(name = "date_fin_tests")
	private Date dateFinTests;

	@Audited
	@Column(name = "date_fin_effective")
	private Date dateFinEffective;

	@Audited
	@Column(name = "date_prevue_cahier_test")
	private Date datePrevuCahier;

	@Audited
	@Column(name = "date_effective_cahier_test")
	private Date dateEffectiveCahier;

	@Audited
	@Column(name = "avancement", precision = 3, scale = 2, nullable = true)
	@Max(value=100)
	private Double avancement;

	@Audited
	@Column(name = "KO", precision = 3, scale = 2, nullable = true)
	@Max(value=100)
	private Double koPourcentage;
	
	@Audited
	@Column(name = "RAF", precision = 3, scale = 2,nullable = true)
	@Max(value=100)
	private Double rafPourcentage;
	
	
	@Audited
	@Column(name = "charge_jh")
	private int ChargeJH;

	@Audited
	@Column(name = "raf_jh")
	private Double RafJH;
	@Audited
	@Column(name = "nombre_cas_tests")
	private int nombreCasTests;
	@Audited
	@Column(name = "raf_cas_tests")
	private int RafEnCasTests;

	@Column(name = "evolution_selected")
	private int evolutionSelected = 0;

	private int KPI2;
	private int KPI3;

	
	
	
	
	
	
	public Evolution(String idEvolution, String refEvolution, String description, Cpsi cpsi,
			TypeEvolution typeEvolution, Collection<User> cprecettes, Livraison etatLivaison, String etatRecette,
			Date created, Date updated, Date dateMepSouhaitee, String commentaires, Date dateDebutTests,
			Date dateFinTests, Date dateFinEffective, Date datePrevuCahier, Date dateEffectiveCahier, Double avancement,
			Double koPourcentage, Double rafPourcentage, int chargeJH, Double rafJH, int nombreCasTests,
			int rafEnCasTests, int evolutionSelected, int kPI2, int kPI3) {
		super();
		this.idEvolution = idEvolution;
		RefEvolution = refEvolution;
		Description = description;
		this.cpsi = cpsi;
		this.typeEvolution = typeEvolution;
		this.cprecettes = cprecettes;
		this.etatLivaison = etatLivaison;
		EtatRecette = etatRecette;
		this.created = created;
		this.updated = updated;
		this.dateMepSouhaitee = dateMepSouhaitee;
		this.commentaires = commentaires;
		this.dateDebutTests = dateDebutTests;
		this.dateFinTests = dateFinTests;
		this.dateFinEffective = dateFinEffective;
		this.datePrevuCahier = datePrevuCahier;
		this.dateEffectiveCahier = dateEffectiveCahier;
		this.avancement = avancement;
		this.koPourcentage = koPourcentage;
		this.rafPourcentage = rafPourcentage;
		ChargeJH = chargeJH;
		RafJH = rafJH;
		this.nombreCasTests = nombreCasTests;
		RafEnCasTests = rafEnCasTests;
		this.evolutionSelected = evolutionSelected;
		KPI2 = kPI2;
		KPI3 = kPI3;
	}

	public Cpsi getCpsi() {
		return cpsi;
	}

	public void setCpsi(Cpsi cpsi) {
		this.cpsi = cpsi;
	}

	public TypeEvolution getTypeEvolution() {
		return typeEvolution;
	}

	public void setTypeEvolution(TypeEvolution typeEvolution) {
		this.typeEvolution = typeEvolution;
	}

	public Livraison getEtatLivaison() {
		return etatLivaison;
	}

	public void setEtatLivaison(Livraison etatLivaison) {
		this.etatLivaison = etatLivaison;
	}

	public String getIdEvolution() {
		return idEvolution;
	}

	public void setIdEvolution() {
		this.idEvolution = randomString(10);
	}

	public Date getDateFinEffective() {
		return dateFinEffective;
	}

	public void setDateFinEffective(Date dateFinEffective) {
		this.dateFinEffective = dateFinEffective;
	}

	public Date getDatePrevuCahier() {
		return datePrevuCahier;
	}
	

	public String getCommentaires() {
		return commentaires;
	}

	public void setCommentaires(String commentaires) {
		this.commentaires = commentaires;
	}

	public void setDatePrevuCahier(Date datePrevuCahier) {
		this.datePrevuCahier = datePrevuCahier;
	}

	public Date getDateEffectiveCahier() {
		return dateEffectiveCahier;
	}

	public void setDateEffectiveCahier(Date dateEffectiveCahier) {
		this.dateEffectiveCahier = dateEffectiveCahier;
	}

	public Collection<User> getCprecettes() {
		return cprecettes;
	}

	public void setCprecettes(Collection<User> cprecettes) {
		this.cprecettes = cprecettes;
	}

	public int getEvolutionSelected() {
		return evolutionSelected;
	}

	public void setEvolutionSelected(int evolutionSelected) {
		this.evolutionSelected = evolutionSelected;
	}

	public String getRefEvolution() {
		return RefEvolution;
	}

	public void setRefEvolution(String refEvolution) {
		RefEvolution = refEvolution;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}



	public Livraison getEtatLivraison() {
		return etatLivaison;
	}

	public void setEtatLivraison(Livraison etatLivraison) {
		etatLivaison = etatLivraison;
	}

	public String getEtatRecette() {
		return EtatRecette;
	}

	public void setEtatRecette(String etatRecette) {
		EtatRecette = etatRecette;
	}

	public Date getDateMepSouhaitee() {
		return dateMepSouhaitee;
	}

	public void setDateMepSouhaitee(Date dateMepSouhaitee) {
		this.dateMepSouhaitee = dateMepSouhaitee;
	}

	public Date getDateDebutTests() {
		return dateDebutTests;
	}

	public void setDateDebutTests(Date dateDebutTests) {
		this.dateDebutTests = dateDebutTests;
	}

	public Date getDateFinTests() {
		return dateFinTests;
	}

	public void setDateFinTests(Date dateFinTests) {
		this.dateFinTests = dateFinTests;
	}

	public Double getAvancement() {
		return avancement;
	}

	public void setAvancement(Double avancement) {
		this.avancement = avancement;
	}

	public int getChargeJH() {
		return ChargeJH;
	}

	public void setChargeJH(int chargeJH) {
		ChargeJH = chargeJH;
	}

	public Double getRafJH() {
		return RafJH;
	}

	public void setRafJH(Double rafJH) {
		RafJH = rafJH;
	}

	public int getNombreCasTests() {
		return nombreCasTests;
	}

	public void setNombreCasTests(int nombreCasTests) {
		this.nombreCasTests = nombreCasTests;
	}

	public int getRafEnCasTests() {
		return RafEnCasTests;
	}

	public void setRafEnCasTests(int rafEnCasTests) {
		RafEnCasTests = rafEnCasTests;
	}

	public Evolution() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Evolution(String refEvolution, String description) {
		super();
		RefEvolution = refEvolution;
		Description = description;
	}

	public int getKPI2() {
		return KPI2;
	}

	public void setKPI2(int kPI2) {
		KPI2 = kPI2;
	}

	public int getKPI3() {
		return KPI3;
	}

	public void setKPI3(int kPI3) {
		KPI3 = kPI3;
	}
	
	
	

	public TypeEvolution getType() {
		return typeEvolution;
	}

	public void setType(TypeEvolution type) {
		typeEvolution = type;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public Double getKoPourcentage() {
		return koPourcentage;
	}

	public void setKoPourcentage(Double koPourcentage) {
		this.koPourcentage = koPourcentage;
	}

	public Double getRafPourcentage() {
		return rafPourcentage;
	}

	public void setRafPourcentage(Double rafPourcentage) {
		this.rafPourcentage = rafPourcentage;
	}

	@PrePersist
	protected void onCreate() {
		created = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		updated = new Date();
	}

}
