function [data, auxData, metaData, txtData, weights] = mydata_Kinosternon_sonoriense
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Kinosternon_sonoriense'; 
metaData.species_en = 'Sonora mud turtle'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biSv'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 11];

%% set data
% zero-variate data

data.am = 36.5*365;  units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.7; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                 bibkey.Lb = 'HensJone2010';
data.Lp = 10; units.Lp = 'cm';  label.Lp = 'carapace length at puberty for females';     bibkey.Lp = 'HensJone2010';
data.Lpm = 8.5; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'HensJone2010';
data.Li = 14.2; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';        bibkey.Li = 'HensJone2010';
data.Lim = 12.1; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';       bibkey.Lim = 'HensJone2010';

data.Wwb = 3.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Claudius angustatus';
data.Wwi = 676; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'EoL';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Claudius angustatus: 2.4 eggs per clutch, 2.5 clutches per yr';
 
% univariate data
% time-length data
data.tL = [ ... % time since birth (yr), carapace length (cm)
33.074	2.792
44.577	3.057
67.665	3.472
79.582	3.170
126.283	3.283
172.901	3.509
231.104	3.887
359.070	4.830
428.390	6.000
441.272	4.377
464.471	4.642
499.034	5.358
534.481	4.868
603.691	6.189
627.358	5.811
627.745	5.283
697.175	6.302
755.931	5.925
802.135	6.717
884.972	5.396
931.507	5.736
977.132	7.321
977.905	6.264
1024.026	7.170
1024.302	6.792
1058.673	7.774
1082.340	7.396
1187.576	7.434
1303.845	8.377
1303.900	8.302
1420.556	8.717
1420.639	8.604
1420.777	8.415
1548.963	9.057
1664.129	11.509
1677.342	9.434
1724.484	8.943
1735.656	9.660
1817.389	9.849
1864.587	9.283
1876.007	9.660
2098.036	9.925
2296.177	10.868
2904.005	11.358
3032.467	11.623
3441.934	11.472
3920.694	12.528
4119.497	12.566
4224.787	12.528
4388.475	12.604
6773.888	13.358];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HensJone2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Mean temperatures varies from 10 to 30 C';
metaData.bibkey.F1 = 'HensJone2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R86Z'; % Cat of Life
metaData.links.id_ITIS = '173768'; % ITIS
metaData.links.id_EoL = '457729'; % Ency of Life
metaData.links.id_Wiki = 'Kinosternon_sonoriense'; % Wikipedia
metaData.links.id_ADW = 'Kinosternon_sonoriense'; % ADW
metaData.links.id_Taxo = '48368'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Kinosternon&species=sonoriense'; % ReptileDB
metaData.links.id_AnAge = 'Kinosternon_sonoriense'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kinosternon_sonoriense}}';
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
bibkey = 'HensJone2010'; type = 'Article'; bib = [ ... 
'author = {Frank R. Hensley and Thomas R. Jones and Mandi S. Maxwell and Lisa J. Adams and Nicole Stevenson Nedella}, ' ... 
'year = {2010}, ' ...
'title = {DEMOGRAPHY, TERRESTRIAL BEHAVIOR, AND GROWTH OF {S}ONORA MUD TURTLES (\emph{Kinosternon sonoriense}) IN AN EXTREME HABITAT}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {24}, ' ...
'pages = {174-193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Kinosternon_sonoriense}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/815713/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/6493/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'encyclopedia'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.encyclopedia.com/environment/encyclopedias-almanacs-transcripts-and-maps/central-american-river-turtles-dermatemydidae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

