﻿'''test 1'''#http://blog.csdn.net/yyt8yyt8/article/details/7000116import xml.etree.ElementTree as ETimport xml.dom.minidom as minidomdef get_root(xmlpath):    '''    xmlpath: xml path to xml file    '''    root = ET.parse(xmlpath).getroot()    return rootdef display(root):    rough_string = ET.tostring(root, 'utf-8')    reparsed = minidom.parseString(rough_string)    print reparsed.toprettyxml(indent= " ", encoding = 'utf-8')def test_1():    root = ET.Element('booflist')    bookE = ET.SubElement(root, 'book') #1    bookE.set('id', 'ISO001')    authorE = ET.Element('author') #2    authorE.text = 'Gaosilin'    bookE.append(authorE)    nameE = ET.Element('name')   #3    nameE.text = 'java'    bookE.insert(1,nameE)    bookE.insert(0,nameE)    nameE.text = 'C language'    display(root)        bookE.remove(authorE)    bookE.remove(nameE)    bookE.clear()    root.remove(bookE)    display(root)'''test 2'''# need test_2_file.xml#http://www.open-open.com/lib/view/open1329403902937.htmldef print_node(node):    '''print node info'''    print "==============================="    print "node.attrib:%s" % node.attrib    if node.attrib.has_key("age") > 0:        print "node.attrib['age']:%s" % node.attrib['age']    #else:    #    print "node.attrib['age']:%s" % node.attrib['age']    print "node.tag:%s" % node.tag    print "node.text:%s" % node.textdef read_xml(text):    '''read xml file'''    #load xml file (1. sp. string, 2.file path)    root = ET.parse(r"test_2_file.xml")    #root = ET.fromstring(text)    #get element    # 1 getiterator    lst_node = root.getiterator("person")    for node in lst_node:        print_node(node)    # 2 getchildren    lst_node_child = lst_node[0].getiterator()[0]    print_node(lst_node_child)    # 3 .find    node_find = root.find('/root/person')    #print_node(node_find)    # 4 findall    node_findall = root.findall("/root/person/name")[1]    print_node(node_findall)def find_age_of_all_people():    per=ET.parse('test_2_file.xml')    p=per.findall('/root/person')    for x in p:        print x.attribdef test_2():    find_age_of_all_people()    print "read_xml"    read_xml(open("test_2_file.xml").read())    '''test 3'''# need test_2_file.xml#http://blog.donews.com/bonycamel/archive/2006/10/12/1058684.aspxdef example_6():    #open('simple.xml', 'w').write('''<root>    #<foo>this</foo>    #<bar>that</bar>    #<foo>more</foo></root>''')    root = ET.parse('test_3_file.xml').getroot()    for node in root.findall('foo'):        print node.textdef example_5():    weblog = ET.parse('test_3_file.xml').getroot()    #for a in weblog.findall('entry'):    #    print "%s (%s)" % (a.findtext('resource'),a.findtext('byteCount'))    interesting = [entry for entry in weblog.findall('entry')                   if entry.find('host').text=='64.172.22.154'                   and entry.find('statusCode').text == '200']    for e in interesting:        print "%s (%s)" % (e.findtext('resource'),e.findtext('byteCount'))def example_10():    weblog = ET.parse("test_3_file.xml").getroot()    for ts in [ts.text for e in weblog.findall('entry')               for ts in e.findall('dateTime')               if ts.text.startswith("19/Aug")]:        print ts    #xx = weblog.findall("entry")    #print "%s (%s)" % (e.findtext('resource'),e.findtext('byteCount'))    #for x in [ts for ts in weblog.findall('/dateTime')]:# if ts.text.startswitch('19/Aug')]:        #print x.textdef example_11():  # xpath , find all tag  from all deep    weblog = ET.parse("test_3_file.xml").getroot()    citys = weblog.findall('.//dateTime')    for c in citys:        print c.textdef example_12():    '''doc.find('b').tail'''def test_3():    example_11()    if __name__ == '__main__':    test_3()