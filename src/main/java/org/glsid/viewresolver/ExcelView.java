package org.glsid.viewresolver;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;
import org.glsid.entities.Evolution;
import org.glsid.entities.User;
import org.glsid.metier.Theme;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.servlet.view.document.AbstractExcelView;

@SuppressWarnings("deprecation")
public class ExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		List<Evolution> evolutions = (List<Evolution>) model.get("evolutions");
		Theme[] themes = (Theme[]) model.get("checkboxes");

		int i = 0;
		// create a new Excel sheet
		HSSFSheet sheet = workbook.createSheet("Liste des évolutions");

		sheet.setColumnWidth(0, 1100);
		for(int k=1; k<13;k++){	
		sheet.setColumnWidth(k, 4500);
		}
		sheet.setDefaultRowHeight((short) 700);

		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		Font font2 = workbook.createFont();
		font2.setFontHeightInPoints((short) 10);
		font.setFontHeightInPoints((short)11);
		font2.setFontName("Candara");
		font.setFontName("Candara");
		
		style.setFillForegroundColor(IndexedColors.VIOLET.getIndex());
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setColor(HSSFColor.WHITE.index);
		style.setWrapText(true);
		style.setFont(font);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		style.setAlignment(CellStyle.VERTICAL_CENTER);

		// style2
		CellStyle style2 = workbook.createCellStyle();
		style2.setWrapText(true);
		style2.setAlignment(CellStyle.ALIGN_CENTER);
		style2.setAlignment(CellStyle.VERTICAL_CENTER);

		
		style2.setFont(font2);

		// create header row
		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("   Etat");
		
		header.getCell(0).setCellStyle(style);

		if (themes[0].isChecked() == true) {
			header.createCell(++i).setCellValue("   REF");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[1].isChecked() == true) {

			header.createCell(++i).setCellValue("Description");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[2].isChecked() == true) {
			header.createCell(++i).setCellValue("CP SI");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[3].isChecked() == true) {
			header.createCell(++i).setCellValue("CP Recette");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[4].isChecked() == true) {
			header.createCell(++i).setCellValue("Etat livraison");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[5].isChecked() == true) {
			header.createCell(++i).setCellValue("Date MEP souhaitée");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[6].isChecked() == true) {
			header.createCell(++i).setCellValue("Date début des tests planifiée");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[7].isChecked() == true) {
			header.createCell(++i).setCellValue("Date fin prévue des tests");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[8].isChecked() == true) {
			header.createCell(++i).setCellValue("Date fin effective des tests");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[9].isChecked() == true) {
			header.createCell(++i).setCellValue("Date prévue cahier de test");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[10].isChecked() == true) {
			header.createCell(++i).setCellValue("Date effective cahier de test");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[11].isChecked() == true) {
			header.createCell(++i).setCellValue("Avancement OK (J)");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[12].isChecked() == true) {
			header.createCell(++i).setCellValue("Commentaires");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[13].isChecked() == true) {
			header.createCell(++i).setCellValue("Charge JH");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[14].isChecked() == true) {
			header.createCell(++i).setCellValue("RAF JH");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[15].isChecked() == true) {
			header.createCell(++i).setCellValue("Nombre de cas de tests");
			header.getCell(i).setCellStyle(style);
		}

		if (themes[16].isChecked() == true) {
			header.createCell(++i).setCellValue("RAF en cas de tests");
			header.getCell(i).setCellStyle(style);
		}

		// create data rows
		int rowCount = 1;

		Drawing drawing = sheet.createDrawingPatriarch();
		for (Evolution aEvol : evolutions) {

			HSSFRow aRow = sheet.createRow(rowCount++);
			InputStream inputStream = null;
			aRow.setHeight((short) 500);

			if (aEvol.getEtatRecette().equals("CRITIQUE")) {
				ClassPathResource classPathResource = new ClassPathResource("static/images/icons/stop24.png");
				inputStream = classPathResource.getInputStream();
			}
			if (aEvol.getEtatRecette().equals("BONNE")) {
				ClassPathResource classPathResource = new ClassPathResource("static/images/good2.png");
				inputStream = classPathResource.getInputStream();
			}
			if (aEvol.getEtatRecette().equals("MAUVAISE")) {
				ClassPathResource classPathResource = new ClassPathResource("static/images/icons/alertExcel.png");
				inputStream = classPathResource.getInputStream();
			}

			// Get the contents of an InputStream as a byte[].
			byte[] bytes = IOUtils.toByteArray(inputStream);
			// Adds a picture to the workbook
			int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);

			inputStream.close();

			HSSFClientAnchor anchor;
			anchor = new HSSFClientAnchor(512, 128, 512, 128, (short) 0, (rowCount - 1), (short) 1, rowCount);

			/* Invoke createPicture and pass the anchor point and ID */
			HSSFPicture my_picture = (HSSFPicture) drawing.createPicture(anchor, pictureIdx);
			/* Call resize method, which resizes the image */
			anchor.setAnchorType(0);
			my_picture.resize(0.4);

			int j = 0;
			CreationHelper helper = workbook.getCreationHelper();

			if (themes[0].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getRefEvolution());
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[1].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getDescription());
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[2].isChecked() == true) {

				if (aEvol.getCpsi() != null) {
					aRow.createCell(++j).setCellValue(aEvol.getCpsi().getusernameCpsi());
					aRow.getCell(j).setCellStyle(style2);
				}
			}

			StringBuffer toppings = new StringBuffer("");

			for (User topping : aEvol.getCprecettes()) {
				toppings.append(topping.getSsoId());
				toppings.append(" ");
			}

			if (themes[3].isChecked() == true) {
				aRow.createCell(++j).setCellValue(toppings.toString());
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[4].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getEtatLivraison().getEtatLivraison());
				aRow.getCell(j).setCellStyle(style2);
			}

			// date format
			SimpleDateFormat dt1 = new SimpleDateFormat("dd/MM/yyyy");

			if (themes[5].isChecked() == true) {
				if (aEvol.getDateMepSouhaitee() != null) {
					aRow.createCell(++j).setCellValue(dt1.format(aEvol.getDateMepSouhaitee()));
					aRow.getCell(j).setCellStyle(style2);
				} else {
					aRow.createCell(++j).setCellValue("");
					aRow.getCell(j).setCellStyle(style2);

				}
			}

			if (themes[6].isChecked() == true) {
				if (aEvol.getDateDebutTests() != null) {
					aRow.createCell(++j).setCellValue(dt1.format(aEvol.getDateDebutTests()));
					aRow.getCell(j).setCellStyle(style2);
				} else {
					aRow.createCell(++j).setCellValue("");
					aRow.getCell(j).setCellStyle(style2);

				}
			}

			if (themes[7].isChecked() == true) {
				if (aEvol.getDateFinTests() != null) {
					aRow.createCell(++j).setCellValue(dt1.format(aEvol.getDateFinTests()));
					aRow.getCell(j).setCellStyle(style2);
				} else {
					aRow.createCell(++j).setCellValue("");
					aRow.getCell(j).setCellStyle(style2);
				}
			}

			if (themes[8].isChecked() == true) {
				if (aEvol.getDateFinEffective() != null) {
					aRow.createCell(++j).setCellValue(dt1.format(aEvol.getDateFinEffective()));
					aRow.getCell(j).setCellStyle(style2);
				} else {
					aRow.createCell(++j).setCellValue("");
					aRow.getCell(j).setCellStyle(style2);

				}
			}

			if (themes[9].isChecked() == true) {
				if (aEvol.getDatePrevuCahier() != null) {
					aRow.createCell(++j).setCellValue(dt1.format(aEvol.getDatePrevuCahier()));
					aRow.getCell(j).setCellStyle(style2);

				} else {
					aRow.createCell(++j).setCellValue("");
					aRow.getCell(j).setCellStyle(style2);

				}
			}

			if (themes[10].isChecked() == true) {
				if (aEvol.getDateEffectiveCahier() != null) {
					aRow.createCell(++j).setCellValue(dt1.format(aEvol.getDateEffectiveCahier()));
					aRow.getCell(j).setCellStyle(style2);
				} else {
					aRow.createCell(++j).setCellValue("");
					aRow.getCell(j).setCellStyle(style2);

				}
			}

			if (themes[11].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getAvancement() + "%");
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[12].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getCommentaires());
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[13].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getChargeJH());
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[14].isChecked() == true) {
				if (aEvol.getRafJH() != null) {
					aRow.createCell(++j).setCellValue(aEvol.getRafJH());
					aRow.getCell(j).setCellStyle(style2);
				}
			}

			if (themes[15].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getNombreCasTests());
				aRow.getCell(j).setCellStyle(style2);
			}

			if (themes[16].isChecked() == true) {
				aRow.createCell(++j).setCellValue(aEvol.getRafEnCasTests());
				aRow.getCell(j).setCellStyle(style2);
			}

		}

	}
}
