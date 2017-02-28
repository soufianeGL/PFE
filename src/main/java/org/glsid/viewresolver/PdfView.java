package org.glsid.viewresolver;

import java.awt.Color;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.glsid.entities.Evolution;
import org.glsid.entities.User;
import org.glsid.metier.Theme;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class PdfView extends AbstractPdfView {

	@Override
	/**
	 * Override to produce a landscape format.
	 */
	protected Document newDocument() {
		return new Document(PageSize.A4.rotate());
	}

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		List<Evolution> evolutions = (List<Evolution>) model.get("evolutions");
		Theme[] themes = (Theme[]) model.get("checkboxes");

	
		BaseFont bf = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.CP1250, BaseFont.NOT_EMBEDDED);
		
		Font font = new Font(bf, 9);
		Font font2 = new Font(bf, 10);
		Font font3 = new Font(bf, 30);
		
		int cpt=0;
		for (Theme th:themes){
			if(th.isChecked()==true) cpt++;
		}

		PdfPTable table = new PdfPTable(cpt+1);
		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

		int i=0;
		// table for title
		PdfPTable table1 = new PdfPTable(1);
		PdfPCell cellTitle = new PdfPCell();
		cellTitle.addElement(new Paragraph("Liste des évolutions", font3));
		cellTitle.setPaddingBottom(30);
		cellTitle.setBorder(Rectangle.NO_BORDER);
		cellTitle.setPaddingLeft(200);
		table1.addCell(cellTitle);
		// end table for title

		document.addTitle("Liste des évolutions");
		document.addCreationDate();

		
		if(cpt>7){
		table.setWidthPercentage(100.0f);
		}
		 float[] columnWidths=new float[cpt+1];
		 columnWidths[0]=20f;
		 for (int j=1;j<cpt+1;j++){
			 columnWidths[j]=30f;
		 }
		 
	     table.setWidths(columnWidths);


		// define font for table header row

		PdfPCell cell0 = new PdfPCell();
		Paragraph p=new Paragraph("Etat Recette",font2);
		p.setAlignment(Element.ALIGN_CENTER);
		cell0.addElement(p);
		cell0.setBackgroundColor(Color.PINK);
		
		table.addCell(cell0);

		if (themes[0].isChecked() == true) {
		PdfPCell cell1 = new PdfPCell();
		
		Paragraph p2=new Paragraph("REF",font);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell1.addElement(p2);
		cell1.setBackgroundColor(Color.PINK);

		table.addCell(cell1);
		}

		if (themes[1].isChecked() == true) {
		PdfPCell cell2 = new PdfPCell();
		
		Paragraph p3=new Paragraph("Déscription", font2);
		p3.setAlignment(Element.ALIGN_CENTER);
		cell2.addElement(p3);
		cell2.setBackgroundColor(Color.PINK);
	
		table.addCell(cell2);
		}
		
		
		if (themes[2].isChecked() == true) {
		PdfPCell cell3 = new PdfPCell();
		
		Paragraph p2=new Paragraph("CP SI", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell3.addElement(p2);
		cell3.setBackgroundColor(Color.PINK);
		cell3.setPaddingBottom(5);
		table.addCell(cell3);
		}

		if (themes[3].isChecked() == true) {
		PdfPCell cell4 = new PdfPCell();
		
		Paragraph p2=new Paragraph("CP Recette", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell4.addElement(p2);
		cell4.setBackgroundColor(Color.PINK);
		cell4.setPaddingBottom(5);
		table.addCell(cell4);
		}

		if (themes[4].isChecked() == true) {
		PdfPCell cell5 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Etat Livraison", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell5.addElement(p2);
		cell5.setBackgroundColor(Color.PINK);
		cell5.setPaddingBottom(10);
		table.addCell(cell5);
		}
		
		if (themes[5].isChecked() == true) {
		PdfPCell cell6 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Date MEP souhaitée", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell6.addElement(p2);
		cell6.setBackgroundColor(Color.PINK);
		cell6.setPaddingBottom(5);
		table.addCell(cell6);
		}
		
		if (themes[6].isChecked() == true) {
		//date debut
		PdfPCell cell61 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Date début", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell61.addElement(p2);
		cell61.setBackgroundColor(Color.PINK);
		cell61.setPaddingBottom(5);
		table.addCell(cell61);
		}
		
		
		if (themes[7].isChecked() == true) {
		//date fin prévue
		PdfPCell cell62 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Date fin prévue", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell62.addElement(p2);
		cell62.setBackgroundColor(Color.PINK);
		cell62.setPaddingBottom(5);
		table.addCell(cell62);
		//
		}
		
		if (themes[8].isChecked() == true) {
		//date fin prévue
		PdfPCell cellDateFin = new PdfPCell();
		
		Paragraph p2=new Paragraph("Date fin effective", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cellDateFin.addElement(p2);
		cellDateFin.setBackgroundColor(Color.PINK);
		cellDateFin.setPaddingBottom(5);
		table.addCell(cellDateFin);
		//
		}
		
		if (themes[9].isChecked() == true) {
		//date fin prévue
		PdfPCell cellDateFin = new PdfPCell();
		
		Paragraph p2=new Paragraph("Date prévue cahier de test", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cellDateFin.addElement(p2);
		cellDateFin.setBackgroundColor(Color.PINK);
		cellDateFin.setPaddingBottom(5);
		table.addCell(cellDateFin);
		//
		}
		
		if (themes[10].isChecked() == true) {
		//date fin prévue
		PdfPCell cellDateFin = new PdfPCell();
		Paragraph p2=new Paragraph("Date effective cahier de test", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cellDateFin.addElement(p2);
		cellDateFin.setBackgroundColor(Color.PINK);
		cellDateFin.setPaddingBottom(5);
		table.addCell(cellDateFin);
		//
		}
		
		
		if (themes[11].isChecked() == true) {
		//Avancement
		PdfPCell cell621 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Avancement", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell621.addElement(p2);
		cell621.setBackgroundColor(Color.PINK);
		cell621.setPaddingBottom(5);
		table.addCell(cell621);
		//
		}
		
		if (themes[12].isChecked() == true) {
		//Commentaires
		PdfPCell cell621 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Commentaires", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell621.addElement(p2);
		cell621.setBackgroundColor(Color.PINK);
		cell621.setPaddingBottom(5);
		table.addCell(cell621);
		//
		}
		
		if (themes[13].isChecked() == true) {
		//Charge JH
		PdfPCell cell621 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Charge JH", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell621.addElement(p2);
		cell621.setBackgroundColor(Color.PINK);
		cell621.setPaddingBottom(5);
		table.addCell(cell621);
		//
		}
		
		if (themes[14].isChecked() == true) {
		//Charge JH
		PdfPCell cell621 = new PdfPCell();
		
		Paragraph p2=new Paragraph("RAF JH", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell621.addElement(p2);
		cell621.setBackgroundColor(Color.PINK);
		cell621.setPaddingBottom(5);
		table.addCell(cell621);
		//
		}
		
		if (themes[15].isChecked() == true) {
		//Charge JH
		PdfPCell cell621 = new PdfPCell();
		
		Paragraph p2=new Paragraph("Nombre de cas de tests", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell621.addElement(p2);
		cell621.setBackgroundColor(Color.PINK);
		cell621.setPaddingBottom(5);
		table.addCell(cell621);
		//
		}
		
		if (themes[16].isChecked() == true) {
		//Charge JH
		PdfPCell cell621 = new PdfPCell();
		
		Paragraph p2=new Paragraph("RAF en cas de tests", font2);
		p2.setAlignment(Element.ALIGN_CENTER);
		cell621.addElement(p2);
		cell621.setBackgroundColor(Color.PINK);
		cell621.setPaddingBottom(5);
		table.addCell(cell621);
		//
		}
		
		
		

		for (Evolution evol : evolutions) {


			if (evol.getEtatRecette().equals("BONNE")) {
				ClassPathResource classPathResource = new ClassPathResource("static/images/icons/good2.png");
				URL url=classPathResource.getURL();
				Image im = Image.getInstance(url);
				PdfPCell cell7 = new PdfPCell(im);

				cell7.setPaddingTop(15);
				cell7.setPaddingBottom(15);
				cell7.setPaddingLeft(15);

				table.addCell(cell7);
			}
			if (evol.getEtatRecette().equals("MAUVAISE")) {
				ClassPathResource classPathResource = new ClassPathResource("static/images/icons/alert2.png");
				URL url=classPathResource.getURL();
				Image im = Image.getInstance(url);
				PdfPCell cell7 = new PdfPCell(im);
				im.scaleAbsolute(20, 20);
				cell7.setPaddingTop(15);
				cell7.setPaddingLeft(15);
				cell7.setPaddingBottom(15);
				table.addCell(cell7);
			}
			if (evol.getEtatRecette().equals("CRITIQUE")) {
				ClassPathResource classPathResource = new ClassPathResource("static/images/icons/stop16.png");
				URL url=classPathResource.getURL();
				Image im = Image.getInstance(url);
				PdfPCell cell7 = new PdfPCell(im);

				cell7.setPaddingTop(15);
				cell7.setPaddingBottom(15);
				cell7.setPaddingLeft(15);

				table.addCell(cell7);
			}

			if (themes[0].isChecked() == true) {
			PdfPCell cell8 = new PdfPCell();
			Paragraph p2=new Paragraph(evol.getRefEvolution(), font);
			p2.setAlignment(Element.ALIGN_CENTER);
			cell8.addElement(p2);
			cell8.setPaddingTop(5);
			cell8.setPaddingBottom(5);
			table.addCell(cell8);
			}

			
			if (themes[1].isChecked() == true) {
			PdfPCell cell9 = new PdfPCell();
			Paragraph p2=new Paragraph(evol.getDescription(), font);
			p2.setAlignment(Element.ALIGN_CENTER);
			cell9.addElement(p2);
			cell9.setPaddingTop(5);
			cell9.setPaddingBottom(5);
			table.addCell(cell9);
			}
			
			if (themes[2].isChecked() == true) {
			PdfPCell cell10 = new PdfPCell();
			
			Paragraph p2=new Paragraph(evol.getCpsi().getusernameCpsi(), font);
			p2.setAlignment(Element.ALIGN_CENTER);
			cell10.addElement(p2);
			cell10.setPaddingTop(5);
			cell10.setPaddingBottom(5);
			table.addCell(cell10);
			}
			
			if (themes[3].isChecked() == true) {
			// CP Recettes
			StringBuffer cprs = new StringBuffer("");
			for (User cp : evol.getCprecettes()) {
				cprs.append(cp.getSsoId());
				cprs.append(". ");
			}
		
			PdfPCell cell11 = new PdfPCell();
			
			Paragraph p2=new Paragraph(cprs.toString(), font);
			p2.setAlignment(Element.ALIGN_CENTER);
			cell11.addElement(p2);
			cell11.setPaddingTop(5);
			cell11.setPaddingBottom(5);
			table.addCell(cell11);
			}

			if (themes[4].isChecked() == true) {
			PdfPCell cell12 = new PdfPCell();
			
			Paragraph p2=new Paragraph(evol.getEtatLivraison().getEtatLivraison(), font);
			p2.setAlignment(Element.ALIGN_CENTER);
			cell12.addElement(p2);
			cell12.setPaddingTop(5);
			cell12.setPaddingBottom(5);
			table.addCell(cell12);
			}
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			
			
			if (themes[5].isChecked() == true) {
			//date MEP souhaitee
			PdfPCell cell13 = new PdfPCell();
			if(evol.getDateMepSouhaitee()!=null){
				Paragraph p2=new Paragraph(df.format(evol.getDateMepSouhaitee()), font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell13.addElement(p2);

			}
			cell13.setPaddingTop(5);
			cell13.setPaddingBottom(5);
			table.addCell(cell13);
			}
			
			if (themes[6].isChecked() == true) {
			//date début
			PdfPCell cell14 = new PdfPCell();
			if(evol.getDateDebutTests()!=null){
				Paragraph p2=new Paragraph(df.format(evol.getDateDebutTests()), font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell14.addElement(p2);
			}
			cell14.setPaddingTop(5);
			cell14.setPaddingBottom(5);
			table.addCell(cell14);
			//
			}
			
			
			if (themes[7].isChecked() == true) {
			//date fin prévue
			PdfPCell cell15 = new PdfPCell();
			if(evol.getDateFinTests()!=null){
				
				Paragraph p2=new Paragraph(df.format(evol.getDateFinTests()), font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell15.addElement(p2);
			}
			cell15.setPaddingTop(5);
			cell15.setPaddingBottom(5);
			table.addCell(cell15);
			//
			}
			
			if (themes[8].isChecked() == true) {
			//date fin effective
			PdfPCell cell15 = new PdfPCell();
			if(evol.getDateFinEffective()!=null){
				
				Paragraph p2=new Paragraph(df.format(evol.getDateFinEffective()), font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell15.addElement(p2);
			}
			cell15.setPaddingTop(5);
			cell15.setPaddingBottom(5);
			table.addCell(cell15);
			//
			}
			
			if (themes[9].isChecked() == true) {
			//date fin prévue cahier test
			PdfPCell cell15 = new PdfPCell();
			if(evol.getDatePrevuCahier()!=null){
				
				Paragraph p2=new Paragraph(df.format(evol.getDatePrevuCahier()), font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell15.addElement(p2);
			}
			cell15.setPaddingTop(5);
			cell15.setPaddingBottom(5);
			table.addCell(cell15);
			//
			}
			
			if (themes[10].isChecked() == true) {
				//date fin effective cahier test
				PdfPCell cell15 = new PdfPCell();
				if(evol.getDateEffectiveCahier()!=null){
					
					Paragraph p2=new Paragraph(df.format(evol.getDateEffectiveCahier()), font);
					p2.setAlignment(Element.ALIGN_CENTER);
					cell15.addElement(p2);
				}
				cell15.setPaddingTop(5);
				cell15.setPaddingBottom(5);
				table.addCell(cell15);
				//
				}
			
			if (themes[11].isChecked() == true) {
			//avancement
			PdfPCell cell151 = new PdfPCell();
			
			Paragraph p2=new Paragraph(evol.getAvancement().toString()+" %", font);
			p2.setAlignment(Element.ALIGN_CENTER);
			cell151.addElement(p2);
			cell151.setPaddingTop(5);
			cell151.setPaddingBottom(5);
			table.addCell(cell151);
			
			}
			//
			
			if (themes[12].isChecked() == true) {
				//commentaires
				PdfPCell cell151 = new PdfPCell();
				
				Paragraph p2=new Paragraph(evol.getCommentaires(), font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell151.addElement(p2);
				cell151.setPaddingTop(5);
				cell151.setPaddingBottom(5);
				table.addCell(cell151);
				
				}
			
			if (themes[13].isChecked() == true) {
				//charge jh
				PdfPCell cell151 = new PdfPCell();
				
				Paragraph p2=new Paragraph(evol.getChargeJH()+" ", font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell151.addElement(p2);
				cell151.setPaddingTop(5);
				cell151.setPaddingBottom(5);
				table.addCell(cell151);
				
				}
			
			if (themes[14].isChecked() == true) {
				//charge raf jh
				PdfPCell cell151 = new PdfPCell();
				
				Paragraph p2=new Paragraph(evol.getRafJH()+"", font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell151.addElement(p2);
				cell151.setPaddingTop(5);
				cell151.setPaddingBottom(5);
				table.addCell(cell151);
				
				}
			
			if (themes[15].isChecked() == true) {
				//charge cas test
				PdfPCell cell151 = new PdfPCell();
				
				Paragraph p2=new Paragraph(evol.getNombreCasTests()+" ", font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell151.addElement(p2);
				cell151.setPaddingTop(5);
				cell151.setPaddingBottom(5);
				table.addCell(cell151);
				
				}
			
			if (themes[16].isChecked() == true) {
				//charge raf cas test
				PdfPCell cell151 = new PdfPCell();
				
				Paragraph p2=new Paragraph(evol.getRafEnCasTests()+" ", font);
				p2.setAlignment(Element.ALIGN_CENTER);
				cell151.addElement(p2);
				cell151.setPaddingTop(5);
				cell151.setPaddingBottom(5);
				table.addCell(cell151);
				
				}
			
			
			


		}

		document.add(table1);
		document.add(table);
		document.close();
		// close the database connection

	}

}
