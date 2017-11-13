import java.io.File;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class ApplyXSLT {


  public static void main(String[] args) throws Exception {
    TransformerFactory fabrique;
    StreamSource xml;
    StreamSource xslt;
    StreamResult dest;
    Transformer transformation;

    String nomSource = args[0] ;
    String nomTransfo = args[1] ;
    String nomCible = args[2] ; 

    fabrique = TransformerFactory.newInstance() ;
    xml = new StreamSource(new File(nomSource)) ;
    xslt = new StreamSource(new File(nomTransfo)) ;
    transformation = fabrique.newTransformer(xslt) ;
    dest = new StreamResult(new File(nomCible)) ;
    transformation.transform(xml, dest);
  }
}
