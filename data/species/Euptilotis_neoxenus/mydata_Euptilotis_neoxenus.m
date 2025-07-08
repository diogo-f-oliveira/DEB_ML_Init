function [data, auxData, metaData, txtData, weights] = mydata_Euptilotis_neoxenus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Trogoniformes'; 
metaData.family     = 'Trogonidae';
metaData.species    = 'Euptilotis_neoxenus'; 
metaData.species_en = 'Eared quetzal'; 

metaData.ecoCode.climate = {'BSk', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvr', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 16];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 04];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 22;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'GonzCruz2008';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from HollRome2012 for Todiramphus cinnamominus';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'GonzCruz2008';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from KeslHaig2004 for Todiramphus cinnamominus';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from KeslHaig2004 for Todiramphus cinnamominus';
data.tR = 1825;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AZ_Anim';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9125;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AZ_Anim';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 34.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Will1992';

data.Wwb = 14.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Orel2004';
  comment.Wwb = 'taken from Pharomachrus mocinno';
data.Wwi = 130.25; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 115.5;   units.Wwim = 'g';    label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'avibase';   

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Planet';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time weight
data.tW = [ ... % time since birth (d), wet weight (g)
3 18.3;
5	26.1;
10	45.7;
16	81.5;
19	92.9;
28	96];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GonzCruz2008';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'high age at first reproduction cannot be captured by the std model';
D2 = 'mod_3: v is reduced';
D3 = 'mod_3: males are assumed to differ from females by {p_Am} only';
D4 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '3CYXH'; % Cat of Life
metaData.links.id_ITIS = '178101'; % ITIS
metaData.links.id_EoL = '45510778'; % Ency of Life
metaData.links.id_Wiki = 'Euptilotis_neoxenus'; % Wikipedia
metaData.links.id_ADW = 'Euptilotis_neoxenus'; % ADW
metaData.links.id_Taxo = '55161'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '83AB5D3D4D0EAA16'; % avibase
metaData.links.id_birdlife = 'eared-quetzal-euptilotis-neoxenus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euptilotis_neoxenus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeslHaig2004'; type = 'Article'; bib = [ ... 
'author = {Kesler, D. C. and Haig, S. M.}, ' ... 
'year = {2004}, ' ...
'title = {Thermal Characteristics of Wild and Captive Micronesian Kingfisher Nesting Habitats}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {23}, ' ...
'pages = {301--308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HollRome2012'; type = 'Misc'; bib = [...
'author = {Holland, G. and Romer, L.}, ' ... 
'year = {2012}, ' ...
'institution = {Kingfishers. Australasian Society of Zoo Keeping Inc.}, ' ...
'howpublished = {\url{http://www.aszk.org.au}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzCruz2008'; type = 'Article'; bib = [ ... 
'author = {Gonz\''{a}lez-Rojas, J. I. and Cruz-Nieto, J. and Ruvalcaba-Ortega, I. and Cruz-Nieto, M. A.}, ' ... 
'year = {2008}, ' ...
'title = {Breeding biology of Eared Quetzals in the Sierra Madre Occidental, Mexico.}, ' ...
'journal = {Journal of Field Ornithology}, ' ...
'volume = {79}, ' ...
'number = {1}, '...
'pages = {20--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'John2000'; type = 'Book'; bib = [ ... 
'author = {Johnsgard, P. A.}, ' ... 
'year = {2000}, ' ...
'title = {Trogons and Quetzals of the World}, ' ...
'publisher = {Smithsonian Institution Press}, ' ...
'address = {Washington, DC}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1992'; type = 'Incollection'; bib = [ ... 
'author = {Williamson, S. L.}, ' ... 
'year = {1992}, ' ...
'title = {The Eared Trogon in {A}rizona: Behavior, ecology, and management of the "Northern Quetzal"}, ' ...
'booktitle = {Proceedings of the Chiricahua Mountains Research Symposium, 15-16 March 1992.}, ' ...
'publisher = {Southwest Parks and Monuments Association}, ' ...
'address = {Tucson, Arizona}, '...
'pages = {98--101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Orel2004'; type = 'Article'; bib = [ ... 
'author = {Orellana, C.}, ' ... 
'year = {2004}, ' ...
'title = {Quetzals bred in captivity in {C}hiapas}, ' ...
'journal = {Frontiers in ecology and the environment}, ' ...
'volume = {2}, ' ...
'number = {7}, '...
'pages = {345}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Planet'; type = 'Misc'; bib = ...
'howpublished = {\url{www.planetofbirds.com}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AZ_Anim'; type = 'Misc'; bib = ...
'howpublished = {\url{http://a-z-animals.com/animals/quetzal/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=83AB5D3D4D0EAA16&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

