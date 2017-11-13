package pxml ;

import java.util.Set;
import java.util.TreeSet;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;

/**
 * @author yves.roos@univ-lille1.fr
 *
 * Corrigé de l'exercice d'introduction de la deuxième séance
 * de PXML, M1 MIAGE FA-FC 2010-2011
 * @see http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-2/tp2-intro.pdf 
 */
public class MaisonsHandler extends DefaultHandler {
	
	private int profondeur ;// utilisé pours les 2 questions
	
	private float surface ; // pour question 1
	private int profondeurDePieceEnglobante ; // pour question 1
	
	private Set<String> pieces ;// pour question 2
	
	/**
	 * Initialisation des variables
	 * @throws SAXException 
	 * @see org.xml.sax.ContentHandler#startDocument()
	 */
	public void startDocument() throws SAXException {
		this.profondeur = 0 ;
		this.surface = 0.0f ;
		this.profondeurDePieceEnglobante = -1 ;
		this.pieces = new TreeSet<String>() ;
		System.out.println("Question 1 : " ) ;
	}
	
	/**
	 * Affichage par ordre alphabétique de la liste de pièces
	 * @throws SAXException 
	 * @see org.xml.sax.ContentHandler#endDocument()
	 */
	public void endDocument() throws SAXException {
		System.out.println() ;
		System.out.println() ;
		System.out.print("Question 2 : " ) ;
		for (String piece : this.pieces) System.out.print(piece + " ") ;
		System.out.println() ;
	}
	
	/**
	 * Evenement recu a chaque fois que l'analyseur rencontre une balise xml ouvrante.
	 * @param nameSpaceURI l'url de l'espace de nommage.
	 * @param localName le nom local de la balise.
	 * @param rawName nom de la balise en version 1.0 
	 * <code>nameSpaceURI + ":" + localName</code>
	 * @throws SAXException si la balise ne correspond pas a ce qui est attendu,
	 * comme par exemple non respect d'une dtd.
	 */
	public void startElement(String nameSpaceURI, 
							 String localName, 
							 String rawName, Attributes attributs) throws SAXException {
		this.profondeur++ ;
		if (this.profondeur > 3) this.pieces.add(localName.toLowerCase()) ;
		if ("maison".equals(localName)) {
			this.surface = 0.0f ;
			System.out.print("Maison " + attributs.getValue("id") + " : ") ;
		} else {
			if (attributs.getValue("surface-m2") != null && 
				this.profondeurDePieceEnglobante == -1 ) {
				Float f = Float.parseFloat(attributs.getValue("surface-m2")) ;
				this.profondeurDePieceEnglobante = this.profondeur ;
				this.surface = this.surface + f ;               		
			}
		}
	}
	
	/**
	 * Evenement recu a chaque fermeture de balise.
	 */
	public void endElement(String nameSpaceURI, 
						   String localName, String rawName) throws SAXException {
		if ("maison".equals(localName)) System.out.println(this.surface + " m2") ;
		else if (this.profondeur == this.profondeurDePieceEnglobante) {
			this.profondeurDePieceEnglobante = -1 ;
		}
		this.profondeur-- ;
	}
	
	public static void main(String[] args) {
		try {
			XMLReader saxReader = XMLReaderFactory.createXMLReader();
			saxReader.setContentHandler(new MaisonsHandler());
			saxReader.parse(args[0]);
		} catch (Exception t) {
			t.printStackTrace();
		}
	}
	
	
}
